module Interp.Declaration where

import AbsGrammar
import Control.Monad.Reader
import Interp.Utils
import Interp.Expression
import Data.Maybe(fromJust)
import qualified Data.Map as M

execDecl :: TopDef -> Interp (Env -> Env)
execDecl (VarDecl varType items) =
  case items of
    [] -> do
      actEnv <- ask
      return (\env -> actEnv)
    (itemsH:itemsT) -> do
      f <- execSingleVarDecl itemsH varType
      local f $ execDecl (VarDecl varType itemsT)

execDecl (ConstDecl varType items) =
  case items of
    [] -> do
      actEnv <- ask
      return (\env -> actEnv)
    (itemsH:itemsT) -> do
      f <- execSingleVarDecl itemsH varType
      local f $ execDecl (ConstDecl varType itemsT)


execSingleVarDecl :: Item -> Type -> Interp (Env -> Env)
execSingleVarDecl item varType =
  case item of 
    Init x expr -> do
      val <- evalExpr expr
      createNewVariable x val
    NoInit x -> createNewVariable x $ getDefaultValue varType