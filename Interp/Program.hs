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
interpProgram (Program stmts)  = do
  res <- runExceptT (runReaderT( 
        runStateT (interpStmtBlock $ head stmts) (M.empty, 0)) 
        $ Env { variables = M.empty, functions = M.empty })
  case res of
    Left err -> putStrLn err
    _ -> putStrLn "ok"