module TypeChecker.Statement where

import Control.Monad.Reader
import TypeChecker.Utils
import TypeChecker.Expression
import AbsGrammar
import qualified Data.Map as M
import TypeChecker.Declaration

checkStmt :: Stmt -> Checker (Env -> Env)
checkStmt stmt = case stmt of
  Empty -> return id

  BStmt (Block stmts) ->  
    local (\env -> env { blockNumber = (blockNumber env) + 1 }) $ proceedCheck stmts
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

  -- Ret expr

  -- VRet

  Cond expr stmt -> do
    exprType <- getExprType expr
    checkType expr [Bool] exprType
    checkStmt stmt
    return id

  ElseCond expr stmt1 stmt2 -> do
    exprType <- getExprType expr
    checkType expr [Bool] exprType
    checkStmt stmt1
    checkStmt stmt2
    return id

  While expr stmt -> do
    exprType <- getExprType expr
    checkType expr [Bool] exprType
    local (\env -> env { isLoop = True }) $ checkStmt stmt
    return id

  For x expr1 expr2 stmt -> do
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

  StmtDecl def -> execDecl def

