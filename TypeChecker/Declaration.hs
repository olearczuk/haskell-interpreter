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


execDecl (FnDecl fType f args stmt) = do
  let instruction = (FnDecl fType f args stmt)
  blockNum <- asks blockNumber
  checkIfFunctionDefined f instruction
  actEnv <- ask
  
  let functionArgs = map (\(Arg argType argId) -> (argType, argId)) args
  let newEnv = actEnv { functions = M.insert f (fType, blockNum, functionArgs) $ functions actEnv}

  return (\env -> newEnv)


initArguments :: [(Type, Ident)] -> Checker (Env -> Env)
initArguments args = local nextBlockNumber $ initArgumentsAux args id
  where
    initArgumentsAux :: [(Type, Ident)] -> (Env -> Env) -> Checker (Env -> Env)
    initArgumentsAux [] acc = return acc
    initArgumentsAux ((argType, argId):argsT) acc = do
      f <- execSingleVarDecl (NoInit argId) argType False
      initArgumentsAux argsT $ acc . f


execSingleVarDecl :: Item -> Type -> IsConst -> Checker (Env -> Env)
execSingleVarDecl item varType isConst = do 
  case item of
    NoInit x -> do
      checkIfVariableDefined x item
      addVariable x varType isConst
      
    Init x expr -> do
      checkIfVariableDefined x item
      exprType <- getExprType expr
      checkType expr [varType] exprType
      addVariable x varType isConst

