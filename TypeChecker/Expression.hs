module TypeChecker.Expression where

import Control.Monad.Reader
import qualified Data.Map as M
import TypeChecker.Utils
import AbsGrammar

getExprType :: Expr -> Checker Type
getExprType expr = case expr of
  EVar x -> lookupVariableType x expr

  EInt n -> return Int

  ETrue -> return Bool

  EFalse -> return Bool

  -- EApp Ident [Expr] TODO

  EString _ -> return Str

  Neg expr1 -> do
    t1 <- getExprType expr1
    checkType expr [Int] t1
    return t1

  Not expr1 -> do
    t1 <- getExprType expr1
    checkType expr [Int] t1
    return t1

  EMul expr1 _ expr2 -> checkTwoExprs expr1 expr2 [Int]

  EAdd expr1 Plus expr2 -> checkTwoExprs expr1 expr2 [Int, Str]
  
  EAdd expr1 Minus expr2 -> checkTwoExprs expr1 expr2 [Int]

  ERel expr1 Eq expr2 -> checkTwoExprs expr1 expr2 allVariableTypes >> return Bool

  ERel expr1 Ne expr2 -> checkTwoExprs expr1 expr2 allVariableTypes >> return Bool

  ERel expr1 _ expr2 -> checkTwoExprs expr1 expr2 [Int, Str] >> return Bool

  EAnd expr1 expr2 -> checkTwoExprs expr1 expr2 [Bool]

  EOr expr1 expr2 -> checkTwoExprs expr1 expr2 [Bool]

  where 
    checkTwoExprs :: Expr -> Expr -> ExpectedTypes -> Checker Type
    checkTwoExprs expr1 expr2 expected = do
      t1 <- getExprType expr1
      checkType expr1 expected t1
      t2 <- getExprType expr2
      checkType expr2 [t1] t2
      return t1