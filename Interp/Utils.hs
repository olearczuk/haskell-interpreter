module Interp.Utils where

import Control.Monad.Reader
import Control.Monad.State
import Control.Monad.Except
import qualified Data.Map as M
import Data.Maybe(fromJust)
import AbsGrammar

data Val = IntVal Integer | StringVal String | BoolVal Bool | VoidVal deriving (Eq, Ord)

instance Show Val where
  show (IntVal n) = show n
  show (StringVal s) = s
  show (BoolVal b) = if b then "true" else "false"
  show VoidVal = "<void value>"  

data StmtResult = StmtBreak | StmtContinue | StmtReturn Val

type Loc = Int

data Env = Env { variables :: M.Map Ident Loc, functions :: M.Map Ident (Env, [Val] -> Interp (Maybe StmtResult)) }

type Mem = M.Map Loc Val
type Store = (Mem, Loc)

type Interp a = StateT Store (ReaderT Env (ExceptT String IO)) a

defaultValues :: M.Map Type Val
defaultValues = M.fromList [(Int, IntVal 0), (Str, StringVal ""), (Bool, BoolVal False)]

defaultExprs :: M.Map Type Expr
defaultExprs = M.fromList [(Int, EInt 0), (Str, EString ""), (Bool, EFalse)]

newloc :: Interp Loc
newloc = state $ \(mem, l) -> (l+1, (mem, l+1))

modifyMem :: (Mem -> Mem) -> Interp ()
modifyMem f = modify $ \(mem, l) -> (f mem, l)

getVarLoc :: Ident -> Interp Loc
getVarLoc x = do
  vars <- asks variables
  return $ fromJust $ M.lookup x vars

getLocVal :: Loc -> Interp Val
getLocVal l = do
  (mem, _) <- get
  return $ fromJust $ M.lookup l mem

createNewVariable :: Ident -> Val -> Interp (Env -> Env)
createNewVariable x val = do
  loc <- newloc
  modifyMem $ M.insert loc val
  return $ (\env -> env { variables = M.insert x loc (variables env) })

getDefaultValue ::Type -> Val
getDefaultValue t = fromJust $ M.lookup t defaultValues