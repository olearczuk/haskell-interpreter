-- automatically generated by BNF Converter
module Main where


import System.IO ( stdin, hGetContents )
import System.Environment ( getArgs, getProgName )
import System.Exit ( exitFailure, exitSuccess )
import Control.Monad (when)

import LexGrammar
import ParGrammar
import SkelGrammar
import PrintGrammar
import AbsGrammar

import TypeChecker.Program


import ErrM

type ParseFun a = [Token] -> Err a

myLLexer = myLexer

type Verbosity = Int

usage :: IO ()
usage = do
  putStrLn $ unlines
    [ "usage: Call with following argument:"
    , "  (file)   Interpret a given file."
    ]
  exitFailure

main :: IO ()
main = do 
  args <- getArgs 
  case args of
    [] -> usage
    (fileName:_) -> do
      input <- readFile fileName
      case pProgram (myLexer $ input) of
        Bad s -> do 
          putStrLn s
          exitFailure
        Ok tree -> checkProgram tree

