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

checkProgram :: Program -> Either String (Env ->Env)
checkProgram (Program decls) = 
  let stmts = map (\decl -> StmtDecl decl) decls in
  runExcept $ runReaderT (checkStmts stmts) 
    $ Env { variables = M.empty, isLoop = False, blockNumber = 0,
            functions = M.empty, actFunctionType = Nothing }

  


