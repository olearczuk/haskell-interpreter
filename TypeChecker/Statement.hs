module TypeChecker.Statement where

import Control.Monad.Reader
import TypeChecker.Utils
import TypeChecker.Expression
import AbsGrammar
import qualified Data.Map as M
import TypeChecker.Declaration

checkStmts :: [Stmt] -> Checker (Env -> Env)
checkStmts [] = return id

checkStmts (stmt:stmtT) = do
  stmtResult <- checkStmt stmt
  local stmtResult $ checkStmts stmtT 

checkStmt :: Stmt -> Checker (Env -> Env)
checkStmt stmt = case stmt of
  Empty -> return id

  BStmt (Block stmts) ->  
    local nextBlockNumber $ proceedCheck stmts
    where 
      proceedCheck :: [Stmt] -> Checker (Env -> Env)
      proceedCheck stmts =
        case stmts of
          [] -> return id
          (stmtH:stmtT) -> do
            f <- checkStmt stmtH
            local f (proceedCheck stmtT)
            return id

  Ass x expr -> do
    val <- lookupVariableValue x expr
    checkValueConst val expr
    valType <- getValType val
    exprType <- getExprType expr
    checkType expr [valType] exprType
    return id

  Incr x -> do
    val <- lookupVariableValue x stmt
    varType <- getValType val
    checkValueConst val stmt
    checkType stmt [Int] varType
    return id

  Decr x -> do
    val <- lookupVariableValue x stmt
    varType <- getValType val
    checkValueConst val stmt
    checkType stmt [Int] varType
    return id

  Ret expr -> do
    fType <- lookupActFunctionType stmt
    exprType <- getExprType expr
    checkType stmt [fType] exprType
    return id
  
  VRet -> do
    fType <- lookupActFunctionType stmt
    checkType stmt [fType] Void
    return id

  Cond expr stmt -> local nextBlockNumber $ do
    exprType <- getExprType expr
    checkType expr [Bool] exprType
    checkStmt stmt
    return id

  ElseCond expr stmt1 stmt2 -> local nextBlockNumber $ do
    exprType <- getExprType expr
    checkType expr [Bool] exprType
    checkStmt stmt1
    checkStmt stmt2
    return id

  While expr stmt -> local nextBlockNumber $ do
    exprType <- getExprType expr
    checkType expr [Bool] exprType
    local (\env -> env { isLoop = True }) $ checkStmt stmt
    return id

  For x expr1 expr2 stmt -> local nextBlockNumber $
    do
      exprType1 <- getExprType expr1
      checkType expr1 [Int] exprType1
      exprType2 <- getExprType expr2
      checkType expr2 [Int] exprType2
      f <- execSingleVarDecl (NoInit x) Int True
      local (\env -> f env { isLoop = True }) $ checkStmt stmt
      return id

  Break -> checkIfLoop stmt >> return id

  Continue -> checkIfLoop stmt >> return id

  StmtExp expr -> getExprType expr >> return id

  StmtDecl (FnDecl fType f args innerStmt) -> do
    fDecl <- execDecl (FnDecl fType f args innerStmt)
    local fDecl $ do
      (fType, _, args) <- lookupFunctionData f stmt
      fArgs <- local nextBlockNumber $ initArguments args
      local (\env -> nextBlockNumber . fArgs $ env { actFunctionType = Just fType }) $ checkStmt $ BStmt innerStmt
    return fDecl

  StmtDecl decl -> execDecl decl
