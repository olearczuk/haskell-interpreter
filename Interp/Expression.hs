module Interp.Expression where

import AbsGrammar
import Interp.Utils
import Control.Monad.Except
import qualified Data.Map as M
import Data.Maybe(fromJust)
import PrintGrammar
import Control.Monad.Reader
import Control.Monad(forM_)

evalExpr :: Expr -> Interp Val

evalExpr (EVar x) = getVarLoc x >>= getLocVal

evalExpr (EInt n) = return $ IntVal n

evalExpr ETrue = return $ BoolVal True

evalExpr EFalse = return $ BoolVal False

evalExpr (EApp (Ident "print") (expr:exprsT)) = do
  val <-evalExpr expr
  liftIO $ putStr $ show val ++ (if (length exprsT) > 0  then " " else "")
  evalExpr (EApp (Ident "print") exprsT)

evalExpr (EApp (Ident "print") []) = liftIO $ putStrLn "" >> return VoidVal

evalExpr (EApp f exprs) = do
  functions <- asks functions
  let function = fromJust $ M.lookup f functions
  Just (StmtReturn val) <- function exprs
  return val

evalExpr (EString s) = return $ StringVal s


evalExpr (Neg expr) = do
  (IntVal n) <- evalExpr expr
  return $ IntVal $ -n


evalExpr (Not expr) = do
  (BoolVal b) <- evalExpr expr
  return $ BoolVal $ not b


evalExpr (EMul expr1 op expr2) = do
  (IntVal val1) <- evalExpr expr1
  (IntVal val2) <- evalExpr expr2
  case op of
    Mul -> return $ (IntVal $ val1 * val2)
    Div -> if val2 == 0
      then throwError $ printTree (EMul expr1 op expr2) ++ " <- div by 0"
      else return $ (IntVal $ val1 `div` val2)
    Mod -> if val2 == 0
      then throwError $ printTree (EMul expr1 op expr2) ++ " <- mod by 0"
      else return $ (IntVal $ val1 `mod` val2)


evalExpr (EAdd expr1 Plus expr2) = do
  expr1Val <- evalExpr expr1
  case expr1Val of
    IntVal val1 -> do
      IntVal val2 <- evalExpr expr2
      return $ IntVal $ val1 + val2
    StringVal val1 -> do
      StringVal val2 <- evalExpr expr2
      return $ StringVal $ val1 ++ val2


evalExpr (EAdd expr1 Minus expr2) = do
  IntVal val1 <- evalExpr expr1
  IntVal val2 <- evalExpr expr2
  return $ (IntVal $ val1 - val2)


evalExpr (ERel expr1 rel expr2) = do
  val1 <- evalExpr expr1
  val2 <- evalExpr expr2
  return $ BoolVal $ case rel of
    Lth -> val1 < val2
    Le -> val1 <= val2
    Gth -> val1 > val2
    Ge -> val1 >= val2
    Eq -> val1 == val2
    Ne -> val1 /= val2


evalExpr (EAnd expr1 expr2) = do
  BoolVal val1 <- evalExpr expr1
  if val1 == False
    then return $ BoolVal val1
    else do
      BoolVal val2 <- evalExpr expr2
      return $ BoolVal $ and [val1, val2]


evalExpr (EOr expr1 expr2) = do
  BoolVal val1 <- evalExpr expr1
  if val1 == True
    then return $ BoolVal val1
    else do
      BoolVal val2 <- evalExpr expr2
      return $ BoolVal $ or [val1, val2]
