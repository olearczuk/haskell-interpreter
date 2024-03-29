module Interp.Program where

import Control.Monad.State
import Control.Monad.Reader
import Control.Monad.Except
import qualified Data.Map as M

import AbsGrammar
import PrintGrammar
import Interp.Statement
import Interp.Utils

interpProgram :: Program -> IO ()
interpProgram (Program decls)  = do
  let stmts = map (\decl -> StmtDecl decl) decls
      stmts' = stmts ++ [StmtExp (EApp (Ident "main") [])]
  res <- runExceptT (runReaderT (runStateT (interpStmts stmts') initStore) 
                     initEnv)
  case res of
    Left err -> putStrLn err
    _ -> return ()