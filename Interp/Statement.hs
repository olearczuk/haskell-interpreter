module Interp.Statement where

import AbsGrammar
import Interp.Expression
import Interp.Declaration
import Interp.Utils
import Control.Monad.Reader
import Data.Maybe(fromJust)
import qualified Data.Map as M


interpStmtBlock :: Stmt -> Interp (Maybe StmtResult)
interpStmtBlock (BStmt (Block stmts)) = interpStmts stmts

    
interpStmts :: [Stmt] -> Interp (Maybe StmtResult)
interpStmts stmts = case stmts of
  [] -> return Nothing
  (stmtsH:stmtsT) -> interpStmt stmtsH stmtsT


interpStmt :: Stmt -> [Stmt] -> Interp (Maybe StmtResult)
interpStmt Empty cont = interpStmts cont 

interpStmt (BStmt (Block stmts)) cont = do
  res <- interpStmts stmts
  case res of
    Just result -> return $ Just result
    Nothing -> interpStmts cont


interpStmt (Ass x expr) cont = do
  loc <- getVarLoc x
  val <- evalExpr expr
  modifyMem $ M.insert loc val
  interpStmts cont


interpStmt (Incr x) cont = do
  loc <- getVarLoc x
  IntVal val <- getLocVal loc
  modifyMem $ M.insert loc (IntVal $ val + 1)
  interpStmts cont


interpStmt (Decr x) cont = do
  loc <- getVarLoc x
  IntVal val <- getLocVal loc
  modifyMem $ M.insert loc (IntVal $ val - 1)
  interpStmts cont


interpStmt (Ret expr) _ = do
  val <- evalExpr expr
  return $ Just $ StmtReturn val


interpStmt VRet _ = return $ Just $ StmtReturn VoidVal


interpStmt (Cond expr stmt) cont = do
  BoolVal b <- evalExpr expr
  res <- interpStmt (if b then stmt else Empty) []
  case res of
    Just result -> return $ Just result
    Nothing -> interpStmts cont


interpStmt (ElseCond expr stmt1 stmt2) cont = do
  BoolVal b <- evalExpr expr
  res <- interpStmt (if b then stmt1 else stmt2) []
  case res of
    Just result -> return $ Just result
    Nothing -> interpStmts cont

interpStmt (While expr stmt) cont = do
  vars <- asks variables
  BoolVal b <- evalExpr expr
  if b 
    then do
      res <- interpStmt stmt []
      case res of
        Just StmtBreak -> interpStmts cont
        _ -> interpStmt (While expr stmt) cont
    else interpStmts cont

interpStmt (For x expr1 expr2 stmt) cont = do
  actEnv <- ask
  (IntVal n1) <- evalExpr expr1
  (IntVal n2) <- evalExpr expr2
  f <- createNewVariable x (IntVal n1)
  if n1 <= n2
    then do
      res <- local f $ interpStmt stmt []
      case res of
        Just StmtBreak -> interpStmts cont
        _ -> interpStmt (For x (EInt $ n1+1) (EInt n2) stmt) cont
    else interpStmts cont

interpStmt Break _ = return $ Just StmtBreak

interpStmt Continue _ = return $ Just StmtContinue

interpStmt (StmtExp expr) cont = evalExpr expr >> interpStmts cont

interpStmt (StmtDecl (FnDecl fType fId args (Block stmts))) cont =
  let args' = map (\(Arg t x) -> x) args
      stmts' = stmts ++ [getReturn fType]
      function = executeFunction args' stmts' in
  local (\env -> env { 
    functions = M.insert fId function $ functions env
  }) $ interpStmts cont

  where
    getReturn :: Type -> Stmt
    getReturn Void = VRet
    getReturn t = Ret $ fromJust $ M.lookup t defaultExprs

    executeFunction :: [Ident] -> [Stmt] -> [Expr] -> Interp (Maybe StmtResult)
    executeFunction [] stmts [] = interpStmts stmts

    executeFunction (x:xT) stmts (expr:exprT) = do
      vars <- asks variables
      exprVal <- evalExpr expr
      creation <- createNewVariable x exprVal
      local creation $ executeFunction xT stmts exprT

interpStmt (StmtDecl def) cont = do
  f <- execDecl def
  local f $ interpStmts cont
