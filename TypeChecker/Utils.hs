module TypeChecker.Utils where

import Control.Monad.Reader
import Control.Monad.Except
import qualified Data.Map as M
import AbsGrammar
import PrintGrammar

data Val = Const Type | NonConst Type
type IsConst = Bool
type ExpectedTypes = [Type]

allVariableTypes :: ExpectedTypes
allVariableTypes = [Int, Str, Bool]

-- TODO -> add functions
data Env = Env { variables :: M.Map String Val, isLoop :: Bool } 
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
    else throwError $ (wrappedPrintTree instruction) ++  (" <- wrong type " ++ (wrappedPrintTree t) ++ "\n")


getValType :: Val -> Checker Type
getValType (Const t) = return t
getValType (NonConst t) = return t


lookupVariableValue :: (Print a) => String -> a -> Checker Val
lookupVariableValue x instruction = do
  vars <- asks variables
  let val = M.lookup x vars
  case val of 
    Nothing ->  throwError $ (wrappedPrintTree instruction) ++ " <- variable is not defined\n"
    Just v -> return v


lookupVariableType :: (Print a) => String -> a -> Checker Type
lookupVariableType x instruction = lookupVariableValue x instruction >>= getValType



-- TODO -> add checking in functions later
checkIfIdentTaken :: (Print a) => String -> a -> Checker ()
checkIfIdentTaken x instruction = do
  vars <- asks variables
  if M.member x vars
    then throwError $ (wrappedPrintTree instruction) ++ " <- ident already taken\n"
    else return ()


checkValueConst :: (Print a) => Val -> a -> Checker ()
checkValueConst val instruction =
  case val of
    (Const _) -> throwError $ (wrappedPrintTree instruction) ++ " <- can't change const variable\n"
    _ -> return ()


checkIfLoop :: (Print a) => a -> Checker ()
checkIfLoop instruction = do
  isLoop <- asks isLoop
  if isLoop
    then return ()
    else throwError $ (wrappedPrintTree instruction) ++  " <- called outside of loop\n"