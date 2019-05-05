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

checkProgram :: Program -> Either String (Env ->Env )
checkProgram (Program stmts) = 
  runExcept $ runReaderT (checkStmt $ head stmts) 
    $ Env { variables = M.empty, isLoop = False, blockNumber = 0 }

  


