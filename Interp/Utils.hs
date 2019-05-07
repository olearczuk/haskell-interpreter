module Interp.Utils where

import Control.Monad.Reader
import Control.Monad.State
import Control.Monad.Except
import qualified Data.Map as M
import Data.Maybe(fromJust)
import AbsGrammar

data Val = IntVal Integer | StringVal String | BoolVal Bool deriving (Eq, Ord)

type Loc = Int

data Env = Env { variables :: M.Map Ident Loc }

type Mem = M.Map Loc Val
type Store = (Mem, Loc)

type Interp a = StateT Store (ReaderT Env (Except String)) a

defaultValues :: M.Map Type Val
defaultValues = M.fromList [(Int, IntVal 0), (Str, StringVal ""), (Bool, BoolVal False)]

newloc :: Interp Loc
newloc = state $ \(mem, l) -> (l+1, (mem, l+1))

modifyMem :: (Mem -> Mem) -> Interp ()
modifyMem f = modify $ \(mem, l) -> (f mem, l)

keywords :: [String]
keywords = ["int", "string", "bool", "void", "const", "break", "continue"]

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