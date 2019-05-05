module TypeChecker.Declaration where

import Control.Monad.Reader
import TypeChecker.Utils
import TypeChecker.Expression
import AbsGrammar
import qualified Data.Map as M

execDecl :: TopDef -> Checker (Env -> Env)
execDecl (VarDecl varType items) =
  case items of
    [] -> do
      actEnv <- ask
      return (\env -> actEnv)
    (itemsH:itemsT) -> do
      f <- execSingleVarDecl itemsH varType False
      local f $ execDecl (VarDecl varType itemsT)

execDecl (ConstDecl varType items) =
  case items of
    [] -> do
      actEnv <- ask
      return (\env -> actEnv)
    (itemsH:itemsT) -> do
      f <- execSingleVarDecl itemsH varType True
      local f $ execDecl (ConstDecl varType itemsT)
  

execSingleVarDecl :: Item -> Type -> IsConst -> Checker (Env -> Env)
execSingleVarDecl item varType isConst = do 
  case item of
    NoInit x -> do
      checkIfVariableDefined x item
      checkType item allVariableTypes varType
      addVariable x varType isConst
      
    Init x expr -> do
      checkIfVariableDefined x item
      checkType item allVariableTypes varType
      exprType <- getExprType expr
      checkType expr [varType] exprType
      addVariable x varType isConst

