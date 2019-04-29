module TypeChecker.Program where

import AbsGrammar
import TypeChecker.Utils

import TypeChecker.Statement
import qualified Data.Map as M
import Control.Monad.Reader
import Control.Monad.Except
import PrintGrammar

import Control.Monad.Identity

import TypeChecker.Declaration

checkProgram :: Program -> IO ()
checkProgram (Program stmts) = 
  let result = runExcept $ runReaderT (checkStmt $ head stmts) 
                  $ Env { variables = M.empty, isLoop = False} in
  case result of
    Left err -> putStrLn err
    Right _ -> print "Ok"
  


