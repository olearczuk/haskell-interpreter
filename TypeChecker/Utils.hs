module TypeChecker.Utils where

import Control.Monad.Reader
import Control.Monad.Except
import qualified Data.Map as M
import AbsGrammar
import PrintGrammar

data Val = Const Type | NonConst Type
type IsConst = Bool
type ExpectedTypes = [Type]
type BlockNumber = Integer
type ArgsData = [(Type, Ident)]
type FunctionData = (Type, BlockNumber, ArgsData)

builtInFunctions :: [Ident]
builtInFunctions = [Ident "print", Ident "readInt", Ident "readStr"]

allComparableTypes :: ExpectedTypes
allComparableTypes = [Int, Str, Bool]


data Env = Env { 
                  variables :: M.Map Ident (Val, BlockNumber), 
                  isLoop :: Bool, 
                  blockNumber :: Integer, 
                  functions :: M.Map Ident FunctionData, 
                  actFunctionType :: Maybe Type
                }


type Checker a = (ReaderT Env (Except String)) a

wrappedPrintTree :: (Print a) => a -> String
wrappedPrintTree instruction =
  let s = printTree instruction in
  if last s == '\n'
    then init s
    else s


checkType :: (Print a) => a -> ExpectedTypes -> Type -> Checker ()
checkType instruction types t = do
  if elem t types
    then return ()
    else throwError $ (wrappedPrintTree instruction) ++  (" <- wrong type " ++ (wrappedPrintTree t))


getValType :: Val -> Checker Type
getValType (Const t) = return t
getValType (NonConst t) = return t


lookupVariableValue :: (Print a) => Ident -> a -> Checker Val
lookupVariableValue x instruction = do
  vars <- asks variables
  let val = M.lookup x vars
  case val of 
    Nothing ->  throwError $ (wrappedPrintTree instruction) ++ " <- variable is not defined"
    Just (v, blockNumber) -> return v


lookupVariableType :: (Print a) => Ident -> a -> Checker Type
lookupVariableType x instruction = lookupVariableValue x instruction >>= getValType


checkIfVariableDefined :: (Print a) => Ident -> a -> Checker ()
checkIfVariableDefined x instruction = do
  vars <- asks variables
  actBlockNumber <- asks blockNumber
  let val = M.lookup x vars
  case val of
    Just (v, blockNumber) -> 
      if blockNumber == actBlockNumber
        then throwError $ (wrappedPrintTree instruction) ++ " <- variable is already defined"
        else return ()
    Nothing -> return  ()


checkValueConst :: (Print a) => Val -> a -> Checker ()
checkValueConst val instruction =
  case val of
    (Const _) -> throwError $ (wrappedPrintTree instruction) ++ " <- can't change const variable"
    _ -> return ()


checkIfLoop :: (Print a) => a -> Checker ()
checkIfLoop instruction = do
  isLoop <- asks isLoop
  if isLoop
    then return ()
    else throwError $ (wrappedPrintTree instruction) ++  " <- called outside of loop"


addVariable :: Ident -> Type -> IsConst -> Checker (Env -> Env)
addVariable x varType isConst = do
  blockNumber <- asks blockNumber
  return $ \env -> 
        let val = if isConst then Const varType else NonConst varType in
        let newVariables = M.insert x (val, blockNumber) (variables env) in
        env { variables = newVariables }


nextBlockNumber :: Env -> Env
nextBlockNumber env = env { blockNumber = 1 + blockNumber env }

checkIfFunctionDefined :: (Print a) => Ident -> a -> Checker ()
checkIfFunctionDefined f instruction = do
  if f `elem` builtInFunctions
    then throwError $ (wrappedPrintTree instruction) ++ " <- built in function"
  else do
    functions <- asks functions
    actBlockNumber <- asks blockNumber
    let functionData = M.lookup f functions
    case functionData of
      Just (_, blockNumber, _) ->
        if blockNumber == actBlockNumber
          then throwError $ (wrappedPrintTree instruction) ++ " <- function is already defined"
          else return ()
      Nothing -> return ()

lookupFunctionData :: (Print a) => Ident -> a -> Checker FunctionData
lookupFunctionData f instruction = do
  functions <- asks functions
  let functionData = M.lookup f functions
  case functionData of
    Nothing -> throwError $ (wrappedPrintTree instruction) ++ " <- function is not defined"
    Just fData -> return fData

lookupActFunctionType :: (Print a) => a -> Checker Type
lookupActFunctionType instruction = do
  fType <- asks actFunctionType
  case fType of
    Nothing -> throwError $ (wrappedPrintTree instruction) ++ " <- outside of function"
    Just t -> return t