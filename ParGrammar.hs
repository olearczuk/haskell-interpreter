{-# OPTIONS_GHC -w #-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module ParGrammar where
import AbsGrammar
import LexGrammar
import ErrM
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn 
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 (Ident)
	| HappyAbsSyn5 (Integer)
	| HappyAbsSyn6 (String)
	| HappyAbsSyn7 (Program)
	| HappyAbsSyn8 (TopDef)
	| HappyAbsSyn9 (Item)
	| HappyAbsSyn10 ([Item])
	| HappyAbsSyn11 ([TopDef])
	| HappyAbsSyn12 (Arg)
	| HappyAbsSyn13 ([Arg])
	| HappyAbsSyn14 (Block)
	| HappyAbsSyn15 ([Stmt])
	| HappyAbsSyn16 (Stmt)
	| HappyAbsSyn17 (Type)
	| HappyAbsSyn18 ([Type])
	| HappyAbsSyn19 (Expr)
	| HappyAbsSyn26 ([Expr])
	| HappyAbsSyn27 (AddOp)
	| HappyAbsSyn28 (MulOp)
	| HappyAbsSyn29 (RelOp)

{- to allow type-synonyms as our monads (likely
 - with explicitly-specified bind and return)
 - in Haskell98, it seems that with
 - /type M a = .../, then /(HappyReduction M)/
 - is not allowed.  But Happy is a
 - code-generator that can just substitute it.
type HappyReduction m = 
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> m HappyAbsSyn
-}

action_0,
 action_1,
 action_2,
 action_3,
 action_4,
 action_5,
 action_6,
 action_7,
 action_8,
 action_9,
 action_10,
 action_11,
 action_12,
 action_13,
 action_14,
 action_15,
 action_16,
 action_17,
 action_18,
 action_19,
 action_20,
 action_21,
 action_22,
 action_23,
 action_24,
 action_25,
 action_26,
 action_27,
 action_28,
 action_29,
 action_30,
 action_31,
 action_32,
 action_33,
 action_34,
 action_35,
 action_36,
 action_37,
 action_38,
 action_39,
 action_40,
 action_41,
 action_42,
 action_43,
 action_44,
 action_45,
 action_46,
 action_47,
 action_48,
 action_49,
 action_50,
 action_51,
 action_52,
 action_53,
 action_54,
 action_55,
 action_56,
 action_57,
 action_58,
 action_59,
 action_60,
 action_61,
 action_62,
 action_63,
 action_64,
 action_65,
 action_66,
 action_67,
 action_68,
 action_69,
 action_70,
 action_71,
 action_72,
 action_73,
 action_74,
 action_75,
 action_76,
 action_77,
 action_78,
 action_79,
 action_80,
 action_81,
 action_82,
 action_83,
 action_84,
 action_85,
 action_86,
 action_87,
 action_88,
 action_89,
 action_90,
 action_91,
 action_92,
 action_93,
 action_94,
 action_95,
 action_96,
 action_97,
 action_98,
 action_99,
 action_100,
 action_101,
 action_102,
 action_103,
 action_104,
 action_105,
 action_106,
 action_107,
 action_108,
 action_109,
 action_110,
 action_111,
 action_112,
 action_113,
 action_114,
 action_115,
 action_116,
 action_117,
 action_118,
 action_119,
 action_120,
 action_121,
 action_122,
 action_123,
 action_124,
 action_125,
 action_126 :: () => Int -> ({-HappyReduction (Err) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyReduce_1,
 happyReduce_2,
 happyReduce_3,
 happyReduce_4,
 happyReduce_5,
 happyReduce_6,
 happyReduce_7,
 happyReduce_8,
 happyReduce_9,
 happyReduce_10,
 happyReduce_11,
 happyReduce_12,
 happyReduce_13,
 happyReduce_14,
 happyReduce_15,
 happyReduce_16,
 happyReduce_17,
 happyReduce_18,
 happyReduce_19,
 happyReduce_20,
 happyReduce_21,
 happyReduce_22,
 happyReduce_23,
 happyReduce_24,
 happyReduce_25,
 happyReduce_26,
 happyReduce_27,
 happyReduce_28,
 happyReduce_29,
 happyReduce_30,
 happyReduce_31,
 happyReduce_32,
 happyReduce_33,
 happyReduce_34,
 happyReduce_35,
 happyReduce_36,
 happyReduce_37,
 happyReduce_38,
 happyReduce_39,
 happyReduce_40,
 happyReduce_41,
 happyReduce_42,
 happyReduce_43,
 happyReduce_44,
 happyReduce_45,
 happyReduce_46,
 happyReduce_47,
 happyReduce_48,
 happyReduce_49,
 happyReduce_50,
 happyReduce_51,
 happyReduce_52,
 happyReduce_53,
 happyReduce_54,
 happyReduce_55,
 happyReduce_56,
 happyReduce_57,
 happyReduce_58,
 happyReduce_59,
 happyReduce_60,
 happyReduce_61,
 happyReduce_62,
 happyReduce_63,
 happyReduce_64,
 happyReduce_65,
 happyReduce_66,
 happyReduce_67,
 happyReduce_68,
 happyReduce_69,
 happyReduce_70,
 happyReduce_71,
 happyReduce_72,
 happyReduce_73,
 happyReduce_74,
 happyReduce_75,
 happyReduce_76 :: () => ({-HappyReduction (Err) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,456) ([0,0,0,18954,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,40960,1184,0,0,0,0,0,0,0,0,8192,0,0,0,0,0,0,0,512,74,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,4096,256,0,0,0,256,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,16448,9,0,8704,8,33284,3,0,0,1,0,0,0,16,0,0,0,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8328,0,0,0,32768,4,0,0,0,24581,7,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,34816,32,2064,14,0,4164,2048,1796,0,8704,8,33284,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,0,0,0,256,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,1024,148,0,0,0,0,0,0,512,0,0,0,0,0,0,0,0,4164,2048,1796,0,8704,8,33284,3,0,0,0,0,0,2176,2,57473,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2082,1024,898,0,0,0,0,0,0,0,0,0,0,1088,32769,28736,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4164,2048,1796,0,0,4,0,0,0,32,0,0,0,0,0,0,0,0,1041,0,0,0,0,0,0,0,0,72,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1088,48137,31711,0,0,0,0,0,0,16656,8192,7184,0,0,0,0,0,0,9280,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2048,0,0,0,0,0,0,0,0,512,0,0,0,0,1,0,0,16384,0,0,0,0,32,0,0,0,4352,36,49410,1,0,8,0,0,0,0,0,0,0,8192,130,8256,56,0,0,2,0,0,0,0,0,0,0,4164,2048,1796,0,0,0,32768,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,512,0,0,0,8328,4096,3592,0,0,128,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,2048,0,0,0,0,0,0,0,0,512,0,0,0,34816,33056,31735,14,0,36932,64448,1853,0,8704,8,33284,3,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,4096,577,63471,28,0,8328,4096,3592,0,32768,0,0,0,0,0,0,0,0,4352,61476,53118,1,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pProgram","Ident","Integer","String","Program","TopDef","Item","ListItem","ListTopDef","Arg","ListArg","Block","ListStmt","Stmt","Type","ListType","Expr6","Expr4","Expr3","Expr2","Expr1","Expr","Expr5","ListExpr","AddOp","MulOp","RelOp","'!'","'!='","'%'","'&&'","'('","')'","'*'","'+'","'++'","','","'-'","'--'","'/'","';'","'<'","'<='","'='","'=='","'>'","'>='","'bool'","'break'","'const'","'continue'","'else'","'false'","'for'","'if'","'int'","'return'","'string'","'to'","'true'","'void'","'while'","'{'","'||'","'}'","L_ident","L_integ","L_quoted","%eof"]
        bit_start = st * 71
        bit_end = (st + 1) * 71
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..70]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (50) = happyShift action_7
action_0 (52) = happyShift action_8
action_0 (58) = happyShift action_9
action_0 (60) = happyShift action_10
action_0 (63) = happyShift action_11
action_0 (7) = happyGoto action_3
action_0 (8) = happyGoto action_4
action_0 (11) = happyGoto action_5
action_0 (17) = happyGoto action_6
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (68) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (71) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (50) = happyShift action_7
action_4 (52) = happyShift action_8
action_4 (58) = happyShift action_9
action_4 (60) = happyShift action_10
action_4 (63) = happyShift action_11
action_4 (8) = happyGoto action_4
action_4 (11) = happyGoto action_16
action_4 (17) = happyGoto action_6
action_4 _ = happyReduce_12

action_5 _ = happyReduce_4

action_6 (68) = happyShift action_2
action_6 (4) = happyGoto action_13
action_6 (9) = happyGoto action_14
action_6 (10) = happyGoto action_15
action_6 _ = happyFail (happyExpListPerState 6)

action_7 _ = happyReduce_38

action_8 (50) = happyShift action_7
action_8 (58) = happyShift action_9
action_8 (60) = happyShift action_10
action_8 (63) = happyShift action_11
action_8 (17) = happyGoto action_12
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_36

action_10 _ = happyReduce_37

action_11 _ = happyReduce_39

action_12 (68) = happyShift action_2
action_12 (4) = happyGoto action_21
action_12 (9) = happyGoto action_14
action_12 (10) = happyGoto action_22
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (34) = happyShift action_19
action_13 (46) = happyShift action_20
action_13 _ = happyReduce_8

action_14 (39) = happyShift action_18
action_14 _ = happyReduce_10

action_15 (43) = happyShift action_17
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_13

action_17 _ = happyReduce_6

action_18 (68) = happyShift action_2
action_18 (4) = happyGoto action_21
action_18 (9) = happyGoto action_14
action_18 (10) = happyGoto action_44
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (50) = happyShift action_7
action_19 (58) = happyShift action_9
action_19 (60) = happyShift action_10
action_19 (63) = happyShift action_11
action_19 (12) = happyGoto action_41
action_19 (13) = happyGoto action_42
action_19 (17) = happyGoto action_43
action_19 _ = happyReduce_15

action_20 (30) = happyShift action_34
action_20 (34) = happyShift action_35
action_20 (40) = happyShift action_36
action_20 (55) = happyShift action_37
action_20 (62) = happyShift action_38
action_20 (68) = happyShift action_2
action_20 (69) = happyShift action_39
action_20 (70) = happyShift action_40
action_20 (4) = happyGoto action_24
action_20 (5) = happyGoto action_25
action_20 (6) = happyGoto action_26
action_20 (19) = happyGoto action_27
action_20 (20) = happyGoto action_28
action_20 (21) = happyGoto action_29
action_20 (22) = happyGoto action_30
action_20 (23) = happyGoto action_31
action_20 (24) = happyGoto action_32
action_20 (25) = happyGoto action_33
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (46) = happyShift action_20
action_21 _ = happyReduce_8

action_22 (43) = happyShift action_23
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_7

action_24 (34) = happyShift action_67
action_24 _ = happyReduce_43

action_25 _ = happyReduce_44

action_26 _ = happyReduce_48

action_27 _ = happyReduce_62

action_28 (32) = happyShift action_64
action_28 (36) = happyShift action_65
action_28 (42) = happyShift action_66
action_28 (28) = happyGoto action_63
action_28 _ = happyReduce_55

action_29 (37) = happyShift action_61
action_29 (40) = happyShift action_62
action_29 (27) = happyGoto action_60
action_29 _ = happyReduce_57

action_30 (31) = happyShift action_53
action_30 (33) = happyShift action_54
action_30 (44) = happyShift action_55
action_30 (45) = happyShift action_56
action_30 (47) = happyShift action_57
action_30 (48) = happyShift action_58
action_30 (49) = happyShift action_59
action_30 (29) = happyGoto action_52
action_30 _ = happyReduce_59

action_31 (66) = happyShift action_51
action_31 _ = happyReduce_61

action_32 _ = happyReduce_9

action_33 _ = happyReduce_53

action_34 (30) = happyShift action_34
action_34 (34) = happyShift action_35
action_34 (40) = happyShift action_36
action_34 (55) = happyShift action_37
action_34 (62) = happyShift action_38
action_34 (68) = happyShift action_2
action_34 (69) = happyShift action_39
action_34 (70) = happyShift action_40
action_34 (4) = happyGoto action_24
action_34 (5) = happyGoto action_25
action_34 (6) = happyGoto action_26
action_34 (19) = happyGoto action_50
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (30) = happyShift action_34
action_35 (34) = happyShift action_35
action_35 (40) = happyShift action_36
action_35 (55) = happyShift action_37
action_35 (62) = happyShift action_38
action_35 (68) = happyShift action_2
action_35 (69) = happyShift action_39
action_35 (70) = happyShift action_40
action_35 (4) = happyGoto action_24
action_35 (5) = happyGoto action_25
action_35 (6) = happyGoto action_26
action_35 (19) = happyGoto action_27
action_35 (20) = happyGoto action_28
action_35 (21) = happyGoto action_29
action_35 (22) = happyGoto action_30
action_35 (23) = happyGoto action_31
action_35 (24) = happyGoto action_49
action_35 (25) = happyGoto action_33
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (30) = happyShift action_34
action_36 (34) = happyShift action_35
action_36 (40) = happyShift action_36
action_36 (55) = happyShift action_37
action_36 (62) = happyShift action_38
action_36 (68) = happyShift action_2
action_36 (69) = happyShift action_39
action_36 (70) = happyShift action_40
action_36 (4) = happyGoto action_24
action_36 (5) = happyGoto action_25
action_36 (6) = happyGoto action_26
action_36 (19) = happyGoto action_48
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_46

action_38 _ = happyReduce_45

action_39 _ = happyReduce_2

action_40 _ = happyReduce_3

action_41 (39) = happyShift action_47
action_41 _ = happyReduce_16

action_42 (35) = happyShift action_46
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (68) = happyShift action_2
action_43 (4) = happyGoto action_45
action_43 _ = happyFail (happyExpListPerState 43)

action_44 _ = happyReduce_11

action_45 _ = happyReduce_14

action_46 (65) = happyShift action_78
action_46 (14) = happyGoto action_77
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (50) = happyShift action_7
action_47 (58) = happyShift action_9
action_47 (60) = happyShift action_10
action_47 (63) = happyShift action_11
action_47 (12) = happyGoto action_41
action_47 (13) = happyGoto action_76
action_47 (17) = happyGoto action_43
action_47 _ = happyReduce_15

action_48 _ = happyReduce_49

action_49 (35) = happyShift action_75
action_49 _ = happyFail (happyExpListPerState 49)

action_50 _ = happyReduce_50

action_51 (30) = happyShift action_34
action_51 (34) = happyShift action_35
action_51 (40) = happyShift action_36
action_51 (55) = happyShift action_37
action_51 (62) = happyShift action_38
action_51 (68) = happyShift action_2
action_51 (69) = happyShift action_39
action_51 (70) = happyShift action_40
action_51 (4) = happyGoto action_24
action_51 (5) = happyGoto action_25
action_51 (6) = happyGoto action_26
action_51 (19) = happyGoto action_27
action_51 (20) = happyGoto action_28
action_51 (21) = happyGoto action_29
action_51 (22) = happyGoto action_30
action_51 (23) = happyGoto action_31
action_51 (24) = happyGoto action_74
action_51 (25) = happyGoto action_33
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (30) = happyShift action_34
action_52 (34) = happyShift action_35
action_52 (40) = happyShift action_36
action_52 (55) = happyShift action_37
action_52 (62) = happyShift action_38
action_52 (68) = happyShift action_2
action_52 (69) = happyShift action_39
action_52 (70) = happyShift action_40
action_52 (4) = happyGoto action_24
action_52 (5) = happyGoto action_25
action_52 (6) = happyGoto action_26
action_52 (19) = happyGoto action_27
action_52 (20) = happyGoto action_28
action_52 (21) = happyGoto action_73
action_52 (25) = happyGoto action_33
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_76

action_54 (30) = happyShift action_34
action_54 (34) = happyShift action_35
action_54 (40) = happyShift action_36
action_54 (55) = happyShift action_37
action_54 (62) = happyShift action_38
action_54 (68) = happyShift action_2
action_54 (69) = happyShift action_39
action_54 (70) = happyShift action_40
action_54 (4) = happyGoto action_24
action_54 (5) = happyGoto action_25
action_54 (6) = happyGoto action_26
action_54 (19) = happyGoto action_27
action_54 (20) = happyGoto action_28
action_54 (21) = happyGoto action_29
action_54 (22) = happyGoto action_30
action_54 (23) = happyGoto action_72
action_54 (25) = happyGoto action_33
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_71

action_56 _ = happyReduce_72

action_57 _ = happyReduce_75

action_58 _ = happyReduce_73

action_59 _ = happyReduce_74

action_60 (30) = happyShift action_34
action_60 (34) = happyShift action_35
action_60 (40) = happyShift action_36
action_60 (55) = happyShift action_37
action_60 (62) = happyShift action_38
action_60 (68) = happyShift action_2
action_60 (69) = happyShift action_39
action_60 (70) = happyShift action_40
action_60 (4) = happyGoto action_24
action_60 (5) = happyGoto action_25
action_60 (6) = happyGoto action_26
action_60 (19) = happyGoto action_27
action_60 (20) = happyGoto action_71
action_60 (25) = happyGoto action_33
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_66

action_62 _ = happyReduce_67

action_63 (30) = happyShift action_34
action_63 (34) = happyShift action_35
action_63 (40) = happyShift action_36
action_63 (55) = happyShift action_37
action_63 (62) = happyShift action_38
action_63 (68) = happyShift action_2
action_63 (69) = happyShift action_39
action_63 (70) = happyShift action_40
action_63 (4) = happyGoto action_24
action_63 (5) = happyGoto action_25
action_63 (6) = happyGoto action_26
action_63 (19) = happyGoto action_27
action_63 (25) = happyGoto action_70
action_63 _ = happyFail (happyExpListPerState 63)

action_64 _ = happyReduce_70

action_65 _ = happyReduce_68

action_66 _ = happyReduce_69

action_67 (30) = happyShift action_34
action_67 (34) = happyShift action_35
action_67 (40) = happyShift action_36
action_67 (55) = happyShift action_37
action_67 (62) = happyShift action_38
action_67 (68) = happyShift action_2
action_67 (69) = happyShift action_39
action_67 (70) = happyShift action_40
action_67 (4) = happyGoto action_24
action_67 (5) = happyGoto action_25
action_67 (6) = happyGoto action_26
action_67 (19) = happyGoto action_27
action_67 (20) = happyGoto action_28
action_67 (21) = happyGoto action_29
action_67 (22) = happyGoto action_30
action_67 (23) = happyGoto action_31
action_67 (24) = happyGoto action_68
action_67 (25) = happyGoto action_33
action_67 (26) = happyGoto action_69
action_67 _ = happyReduce_63

action_68 (39) = happyShift action_81
action_68 _ = happyReduce_64

action_69 (35) = happyShift action_80
action_69 _ = happyFail (happyExpListPerState 69)

action_70 _ = happyReduce_52

action_71 (32) = happyShift action_64
action_71 (36) = happyShift action_65
action_71 (42) = happyShift action_66
action_71 (28) = happyGoto action_63
action_71 _ = happyReduce_54

action_72 _ = happyReduce_58

action_73 (37) = happyShift action_61
action_73 (40) = happyShift action_62
action_73 (27) = happyGoto action_60
action_73 _ = happyReduce_56

action_74 _ = happyReduce_60

action_75 _ = happyReduce_51

action_76 _ = happyReduce_17

action_77 _ = happyReduce_5

action_78 (15) = happyGoto action_79
action_78 _ = happyReduce_19

action_79 (30) = happyShift action_34
action_79 (34) = happyShift action_35
action_79 (40) = happyShift action_36
action_79 (43) = happyShift action_88
action_79 (50) = happyShift action_7
action_79 (51) = happyShift action_89
action_79 (52) = happyShift action_8
action_79 (53) = happyShift action_90
action_79 (55) = happyShift action_37
action_79 (56) = happyShift action_91
action_79 (57) = happyShift action_92
action_79 (58) = happyShift action_9
action_79 (59) = happyShift action_93
action_79 (60) = happyShift action_10
action_79 (62) = happyShift action_38
action_79 (63) = happyShift action_11
action_79 (64) = happyShift action_94
action_79 (65) = happyShift action_78
action_79 (67) = happyShift action_95
action_79 (68) = happyShift action_2
action_79 (69) = happyShift action_39
action_79 (70) = happyShift action_40
action_79 (4) = happyGoto action_83
action_79 (5) = happyGoto action_25
action_79 (6) = happyGoto action_26
action_79 (8) = happyGoto action_84
action_79 (14) = happyGoto action_85
action_79 (16) = happyGoto action_86
action_79 (17) = happyGoto action_6
action_79 (19) = happyGoto action_27
action_79 (20) = happyGoto action_28
action_79 (21) = happyGoto action_29
action_79 (22) = happyGoto action_30
action_79 (23) = happyGoto action_31
action_79 (24) = happyGoto action_87
action_79 (25) = happyGoto action_33
action_79 _ = happyFail (happyExpListPerState 79)

action_80 _ = happyReduce_47

action_81 (30) = happyShift action_34
action_81 (34) = happyShift action_35
action_81 (40) = happyShift action_36
action_81 (55) = happyShift action_37
action_81 (62) = happyShift action_38
action_81 (68) = happyShift action_2
action_81 (69) = happyShift action_39
action_81 (70) = happyShift action_40
action_81 (4) = happyGoto action_24
action_81 (5) = happyGoto action_25
action_81 (6) = happyGoto action_26
action_81 (19) = happyGoto action_27
action_81 (20) = happyGoto action_28
action_81 (21) = happyGoto action_29
action_81 (22) = happyGoto action_30
action_81 (23) = happyGoto action_31
action_81 (24) = happyGoto action_68
action_81 (25) = happyGoto action_33
action_81 (26) = happyGoto action_82
action_81 _ = happyReduce_63

action_82 _ = happyReduce_65

action_83 (34) = happyShift action_67
action_83 (38) = happyShift action_104
action_83 (41) = happyShift action_105
action_83 (46) = happyShift action_106
action_83 _ = happyReduce_43

action_84 _ = happyReduce_35

action_85 _ = happyReduce_22

action_86 _ = happyReduce_20

action_87 (43) = happyShift action_103
action_87 _ = happyFail (happyExpListPerState 87)

action_88 _ = happyReduce_21

action_89 (43) = happyShift action_102
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (43) = happyShift action_101
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (34) = happyShift action_100
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (34) = happyShift action_99
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (30) = happyShift action_34
action_93 (34) = happyShift action_35
action_93 (40) = happyShift action_36
action_93 (43) = happyShift action_98
action_93 (55) = happyShift action_37
action_93 (62) = happyShift action_38
action_93 (68) = happyShift action_2
action_93 (69) = happyShift action_39
action_93 (70) = happyShift action_40
action_93 (4) = happyGoto action_24
action_93 (5) = happyGoto action_25
action_93 (6) = happyGoto action_26
action_93 (19) = happyGoto action_27
action_93 (20) = happyGoto action_28
action_93 (21) = happyGoto action_29
action_93 (22) = happyGoto action_30
action_93 (23) = happyGoto action_31
action_93 (24) = happyGoto action_97
action_93 (25) = happyGoto action_33
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (34) = happyShift action_96
action_94 _ = happyFail (happyExpListPerState 94)

action_95 _ = happyReduce_18

action_96 (30) = happyShift action_34
action_96 (34) = happyShift action_35
action_96 (40) = happyShift action_36
action_96 (55) = happyShift action_37
action_96 (62) = happyShift action_38
action_96 (68) = happyShift action_2
action_96 (69) = happyShift action_39
action_96 (70) = happyShift action_40
action_96 (4) = happyGoto action_24
action_96 (5) = happyGoto action_25
action_96 (6) = happyGoto action_26
action_96 (19) = happyGoto action_27
action_96 (20) = happyGoto action_28
action_96 (21) = happyGoto action_29
action_96 (22) = happyGoto action_30
action_96 (23) = happyGoto action_31
action_96 (24) = happyGoto action_113
action_96 (25) = happyGoto action_33
action_96 _ = happyFail (happyExpListPerState 96)

action_97 (43) = happyShift action_112
action_97 _ = happyFail (happyExpListPerState 97)

action_98 _ = happyReduce_27

action_99 (30) = happyShift action_34
action_99 (34) = happyShift action_35
action_99 (40) = happyShift action_36
action_99 (55) = happyShift action_37
action_99 (62) = happyShift action_38
action_99 (68) = happyShift action_2
action_99 (69) = happyShift action_39
action_99 (70) = happyShift action_40
action_99 (4) = happyGoto action_24
action_99 (5) = happyGoto action_25
action_99 (6) = happyGoto action_26
action_99 (19) = happyGoto action_27
action_99 (20) = happyGoto action_28
action_99 (21) = happyGoto action_29
action_99 (22) = happyGoto action_30
action_99 (23) = happyGoto action_31
action_99 (24) = happyGoto action_111
action_99 (25) = happyGoto action_33
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (68) = happyShift action_2
action_100 (4) = happyGoto action_110
action_100 _ = happyFail (happyExpListPerState 100)

action_101 _ = happyReduce_33

action_102 _ = happyReduce_32

action_103 _ = happyReduce_34

action_104 (43) = happyShift action_109
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (43) = happyShift action_108
action_105 _ = happyFail (happyExpListPerState 105)

action_106 (30) = happyShift action_34
action_106 (34) = happyShift action_35
action_106 (40) = happyShift action_36
action_106 (55) = happyShift action_37
action_106 (62) = happyShift action_38
action_106 (68) = happyShift action_2
action_106 (69) = happyShift action_39
action_106 (70) = happyShift action_40
action_106 (4) = happyGoto action_24
action_106 (5) = happyGoto action_25
action_106 (6) = happyGoto action_26
action_106 (19) = happyGoto action_27
action_106 (20) = happyGoto action_28
action_106 (21) = happyGoto action_29
action_106 (22) = happyGoto action_30
action_106 (23) = happyGoto action_31
action_106 (24) = happyGoto action_107
action_106 (25) = happyGoto action_33
action_106 _ = happyFail (happyExpListPerState 106)

action_107 (43) = happyShift action_117
action_107 _ = happyFail (happyExpListPerState 107)

action_108 _ = happyReduce_25

action_109 _ = happyReduce_24

action_110 (46) = happyShift action_116
action_110 _ = happyFail (happyExpListPerState 110)

action_111 (35) = happyShift action_115
action_111 _ = happyFail (happyExpListPerState 111)

action_112 _ = happyReduce_26

action_113 (35) = happyShift action_114
action_113 _ = happyFail (happyExpListPerState 113)

action_114 (30) = happyShift action_34
action_114 (34) = happyShift action_35
action_114 (40) = happyShift action_36
action_114 (43) = happyShift action_88
action_114 (50) = happyShift action_7
action_114 (51) = happyShift action_89
action_114 (52) = happyShift action_8
action_114 (53) = happyShift action_90
action_114 (55) = happyShift action_37
action_114 (56) = happyShift action_91
action_114 (57) = happyShift action_92
action_114 (58) = happyShift action_9
action_114 (59) = happyShift action_93
action_114 (60) = happyShift action_10
action_114 (62) = happyShift action_38
action_114 (63) = happyShift action_11
action_114 (64) = happyShift action_94
action_114 (65) = happyShift action_78
action_114 (68) = happyShift action_2
action_114 (69) = happyShift action_39
action_114 (70) = happyShift action_40
action_114 (4) = happyGoto action_83
action_114 (5) = happyGoto action_25
action_114 (6) = happyGoto action_26
action_114 (8) = happyGoto action_84
action_114 (14) = happyGoto action_85
action_114 (16) = happyGoto action_120
action_114 (17) = happyGoto action_6
action_114 (19) = happyGoto action_27
action_114 (20) = happyGoto action_28
action_114 (21) = happyGoto action_29
action_114 (22) = happyGoto action_30
action_114 (23) = happyGoto action_31
action_114 (24) = happyGoto action_87
action_114 (25) = happyGoto action_33
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (30) = happyShift action_34
action_115 (34) = happyShift action_35
action_115 (40) = happyShift action_36
action_115 (43) = happyShift action_88
action_115 (50) = happyShift action_7
action_115 (51) = happyShift action_89
action_115 (52) = happyShift action_8
action_115 (53) = happyShift action_90
action_115 (55) = happyShift action_37
action_115 (56) = happyShift action_91
action_115 (57) = happyShift action_92
action_115 (58) = happyShift action_9
action_115 (59) = happyShift action_93
action_115 (60) = happyShift action_10
action_115 (62) = happyShift action_38
action_115 (63) = happyShift action_11
action_115 (64) = happyShift action_94
action_115 (65) = happyShift action_78
action_115 (68) = happyShift action_2
action_115 (69) = happyShift action_39
action_115 (70) = happyShift action_40
action_115 (4) = happyGoto action_83
action_115 (5) = happyGoto action_25
action_115 (6) = happyGoto action_26
action_115 (8) = happyGoto action_84
action_115 (14) = happyGoto action_85
action_115 (16) = happyGoto action_119
action_115 (17) = happyGoto action_6
action_115 (19) = happyGoto action_27
action_115 (20) = happyGoto action_28
action_115 (21) = happyGoto action_29
action_115 (22) = happyGoto action_30
action_115 (23) = happyGoto action_31
action_115 (24) = happyGoto action_87
action_115 (25) = happyGoto action_33
action_115 _ = happyFail (happyExpListPerState 115)

action_116 (30) = happyShift action_34
action_116 (34) = happyShift action_35
action_116 (40) = happyShift action_36
action_116 (55) = happyShift action_37
action_116 (62) = happyShift action_38
action_116 (68) = happyShift action_2
action_116 (69) = happyShift action_39
action_116 (70) = happyShift action_40
action_116 (4) = happyGoto action_24
action_116 (5) = happyGoto action_25
action_116 (6) = happyGoto action_26
action_116 (19) = happyGoto action_27
action_116 (20) = happyGoto action_28
action_116 (21) = happyGoto action_29
action_116 (22) = happyGoto action_30
action_116 (23) = happyGoto action_31
action_116 (24) = happyGoto action_118
action_116 (25) = happyGoto action_33
action_116 _ = happyFail (happyExpListPerState 116)

action_117 _ = happyReduce_23

action_118 (61) = happyShift action_122
action_118 _ = happyFail (happyExpListPerState 118)

action_119 (54) = happyShift action_121
action_119 _ = happyReduce_28

action_120 _ = happyReduce_30

action_121 (30) = happyShift action_34
action_121 (34) = happyShift action_35
action_121 (40) = happyShift action_36
action_121 (43) = happyShift action_88
action_121 (50) = happyShift action_7
action_121 (51) = happyShift action_89
action_121 (52) = happyShift action_8
action_121 (53) = happyShift action_90
action_121 (55) = happyShift action_37
action_121 (56) = happyShift action_91
action_121 (57) = happyShift action_92
action_121 (58) = happyShift action_9
action_121 (59) = happyShift action_93
action_121 (60) = happyShift action_10
action_121 (62) = happyShift action_38
action_121 (63) = happyShift action_11
action_121 (64) = happyShift action_94
action_121 (65) = happyShift action_78
action_121 (68) = happyShift action_2
action_121 (69) = happyShift action_39
action_121 (70) = happyShift action_40
action_121 (4) = happyGoto action_83
action_121 (5) = happyGoto action_25
action_121 (6) = happyGoto action_26
action_121 (8) = happyGoto action_84
action_121 (14) = happyGoto action_85
action_121 (16) = happyGoto action_124
action_121 (17) = happyGoto action_6
action_121 (19) = happyGoto action_27
action_121 (20) = happyGoto action_28
action_121 (21) = happyGoto action_29
action_121 (22) = happyGoto action_30
action_121 (23) = happyGoto action_31
action_121 (24) = happyGoto action_87
action_121 (25) = happyGoto action_33
action_121 _ = happyFail (happyExpListPerState 121)

action_122 (30) = happyShift action_34
action_122 (34) = happyShift action_35
action_122 (40) = happyShift action_36
action_122 (55) = happyShift action_37
action_122 (62) = happyShift action_38
action_122 (68) = happyShift action_2
action_122 (69) = happyShift action_39
action_122 (70) = happyShift action_40
action_122 (4) = happyGoto action_24
action_122 (5) = happyGoto action_25
action_122 (6) = happyGoto action_26
action_122 (19) = happyGoto action_27
action_122 (20) = happyGoto action_28
action_122 (21) = happyGoto action_29
action_122 (22) = happyGoto action_30
action_122 (23) = happyGoto action_31
action_122 (24) = happyGoto action_123
action_122 (25) = happyGoto action_33
action_122 _ = happyFail (happyExpListPerState 122)

action_123 (35) = happyShift action_125
action_123 _ = happyFail (happyExpListPerState 123)

action_124 _ = happyReduce_29

action_125 (30) = happyShift action_34
action_125 (34) = happyShift action_35
action_125 (40) = happyShift action_36
action_125 (43) = happyShift action_88
action_125 (50) = happyShift action_7
action_125 (51) = happyShift action_89
action_125 (52) = happyShift action_8
action_125 (53) = happyShift action_90
action_125 (55) = happyShift action_37
action_125 (56) = happyShift action_91
action_125 (57) = happyShift action_92
action_125 (58) = happyShift action_9
action_125 (59) = happyShift action_93
action_125 (60) = happyShift action_10
action_125 (62) = happyShift action_38
action_125 (63) = happyShift action_11
action_125 (64) = happyShift action_94
action_125 (65) = happyShift action_78
action_125 (68) = happyShift action_2
action_125 (69) = happyShift action_39
action_125 (70) = happyShift action_40
action_125 (4) = happyGoto action_83
action_125 (5) = happyGoto action_25
action_125 (6) = happyGoto action_26
action_125 (8) = happyGoto action_84
action_125 (14) = happyGoto action_85
action_125 (16) = happyGoto action_126
action_125 (17) = happyGoto action_6
action_125 (19) = happyGoto action_27
action_125 (20) = happyGoto action_28
action_125 (21) = happyGoto action_29
action_125 (22) = happyGoto action_30
action_125 (23) = happyGoto action_31
action_125 (24) = happyGoto action_87
action_125 (25) = happyGoto action_33
action_125 _ = happyFail (happyExpListPerState 125)

action_126 _ = happyReduce_31

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyTerminal (PT _ (TV happy_var_1)))
	 =  HappyAbsSyn4
		 (Ident happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyTerminal (PT _ (TI happy_var_1)))
	 =  HappyAbsSyn5
		 (read happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  6 happyReduction_3
happyReduction_3 (HappyTerminal (PT _ (TL happy_var_1)))
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  7 happyReduction_4
happyReduction_4 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn7
		 (AbsGrammar.Program happy_var_1
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happyReduce 6 8 happyReduction_5
happyReduction_5 ((HappyAbsSyn14  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	(HappyAbsSyn17  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (AbsGrammar.FnDecl happy_var_1 happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_3  8 happyReduction_6
happyReduction_6 _
	(HappyAbsSyn10  happy_var_2)
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn8
		 (AbsGrammar.VarDecl happy_var_1 happy_var_2
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happyReduce 4 8 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	(HappyAbsSyn17  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (AbsGrammar.ConstDecl happy_var_2 happy_var_3
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_1  9 happyReduction_8
happyReduction_8 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn9
		 (AbsGrammar.NoInit happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  9 happyReduction_9
happyReduction_9 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn9
		 (AbsGrammar.Init happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  10 happyReduction_10
happyReduction_10 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 ((:[]) happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  10 happyReduction_11
happyReduction_11 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  11 happyReduction_12
happyReduction_12 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn11
		 ((:[]) happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_2  11 happyReduction_13
happyReduction_13 (HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn11
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_13 _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  12 happyReduction_14
happyReduction_14 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn12
		 (AbsGrammar.Arg happy_var_1 happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_0  13 happyReduction_15
happyReduction_15  =  HappyAbsSyn13
		 ([]
	)

happyReduce_16 = happySpecReduce_1  13 happyReduction_16
happyReduction_16 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn13
		 ((:[]) happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  13 happyReduction_17
happyReduction_17 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn13
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  14 happyReduction_18
happyReduction_18 _
	(HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (AbsGrammar.Block (reverse happy_var_2)
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_0  15 happyReduction_19
happyReduction_19  =  HappyAbsSyn15
		 ([]
	)

happyReduce_20 = happySpecReduce_2  15 happyReduction_20
happyReduction_20 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (flip (:) happy_var_1 happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  16 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn16
		 (AbsGrammar.Empty
	)

happyReduce_22 = happySpecReduce_1  16 happyReduction_22
happyReduction_22 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn16
		 (AbsGrammar.BStmt happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happyReduce 4 16 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn19  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (AbsGrammar.Ass happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_24 = happySpecReduce_3  16 happyReduction_24
happyReduction_24 _
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn16
		 (AbsGrammar.Incr happy_var_1
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  16 happyReduction_25
happyReduction_25 _
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn16
		 (AbsGrammar.Decr happy_var_1
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  16 happyReduction_26
happyReduction_26 _
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn16
		 (AbsGrammar.Ret happy_var_2
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  16 happyReduction_27
happyReduction_27 _
	_
	 =  HappyAbsSyn16
		 (AbsGrammar.VRet
	)

happyReduce_28 = happyReduce 5 16 happyReduction_28
happyReduction_28 ((HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn19  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (AbsGrammar.Cond happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_29 = happyReduce 7 16 happyReduction_29
happyReduction_29 ((HappyAbsSyn16  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn19  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (AbsGrammar.ElseCond happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_30 = happyReduce 5 16 happyReduction_30
happyReduction_30 ((HappyAbsSyn16  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn19  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (AbsGrammar.While happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_31 = happyReduce 9 16 happyReduction_31
happyReduction_31 ((HappyAbsSyn16  happy_var_9) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn19  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn19  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (AbsGrammar.For happy_var_3 happy_var_5 happy_var_7 happy_var_9
	) `HappyStk` happyRest

happyReduce_32 = happySpecReduce_2  16 happyReduction_32
happyReduction_32 _
	_
	 =  HappyAbsSyn16
		 (AbsGrammar.Break
	)

happyReduce_33 = happySpecReduce_2  16 happyReduction_33
happyReduction_33 _
	_
	 =  HappyAbsSyn16
		 (AbsGrammar.Continue
	)

happyReduce_34 = happySpecReduce_2  16 happyReduction_34
happyReduction_34 _
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn16
		 (AbsGrammar.StmtExp happy_var_1
	)
happyReduction_34 _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  16 happyReduction_35
happyReduction_35 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn16
		 (AbsGrammar.StmtDecl happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  17 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn17
		 (AbsGrammar.Int
	)

happyReduce_37 = happySpecReduce_1  17 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn17
		 (AbsGrammar.Str
	)

happyReduce_38 = happySpecReduce_1  17 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn17
		 (AbsGrammar.Bool
	)

happyReduce_39 = happySpecReduce_1  17 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn17
		 (AbsGrammar.Void
	)

happyReduce_40 = happySpecReduce_0  18 happyReduction_40
happyReduction_40  =  HappyAbsSyn18
		 ([]
	)

happyReduce_41 = happySpecReduce_1  18 happyReduction_41
happyReduction_41 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn18
		 ((:[]) happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  18 happyReduction_42
happyReduction_42 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn18
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  19 happyReduction_43
happyReduction_43 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn19
		 (AbsGrammar.EVar happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  19 happyReduction_44
happyReduction_44 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn19
		 (AbsGrammar.EInt happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  19 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn19
		 (AbsGrammar.ETrue
	)

happyReduce_46 = happySpecReduce_1  19 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn19
		 (AbsGrammar.EFalse
	)

happyReduce_47 = happyReduce 4 19 happyReduction_47
happyReduction_47 (_ `HappyStk`
	(HappyAbsSyn26  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (AbsGrammar.EApp happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_48 = happySpecReduce_1  19 happyReduction_48
happyReduction_48 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn19
		 (AbsGrammar.EString happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_2  19 happyReduction_49
happyReduction_49 (HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (AbsGrammar.Neg happy_var_2
	)
happyReduction_49 _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_2  19 happyReduction_50
happyReduction_50 (HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (AbsGrammar.Not happy_var_2
	)
happyReduction_50 _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  19 happyReduction_51
happyReduction_51 _
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (happy_var_2
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_3  20 happyReduction_52
happyReduction_52 (HappyAbsSyn19  happy_var_3)
	(HappyAbsSyn28  happy_var_2)
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (AbsGrammar.EMul happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_52 _ _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_1  20 happyReduction_53
happyReduction_53 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_53 _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  21 happyReduction_54
happyReduction_54 (HappyAbsSyn19  happy_var_3)
	(HappyAbsSyn27  happy_var_2)
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (AbsGrammar.EAdd happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  21 happyReduction_55
happyReduction_55 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  22 happyReduction_56
happyReduction_56 (HappyAbsSyn19  happy_var_3)
	(HappyAbsSyn29  happy_var_2)
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (AbsGrammar.ERel happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  22 happyReduction_57
happyReduction_57 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_3  23 happyReduction_58
happyReduction_58 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (AbsGrammar.EAnd happy_var_1 happy_var_3
	)
happyReduction_58 _ _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  23 happyReduction_59
happyReduction_59 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_3  24 happyReduction_60
happyReduction_60 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (AbsGrammar.EOr happy_var_1 happy_var_3
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  24 happyReduction_61
happyReduction_61 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_1  25 happyReduction_62
happyReduction_62 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_62 _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_0  26 happyReduction_63
happyReduction_63  =  HappyAbsSyn26
		 ([]
	)

happyReduce_64 = happySpecReduce_1  26 happyReduction_64
happyReduction_64 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn26
		 ((:[]) happy_var_1
	)
happyReduction_64 _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_3  26 happyReduction_65
happyReduction_65 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn26
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_65 _ _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_1  27 happyReduction_66
happyReduction_66 _
	 =  HappyAbsSyn27
		 (AbsGrammar.Plus
	)

happyReduce_67 = happySpecReduce_1  27 happyReduction_67
happyReduction_67 _
	 =  HappyAbsSyn27
		 (AbsGrammar.Minus
	)

happyReduce_68 = happySpecReduce_1  28 happyReduction_68
happyReduction_68 _
	 =  HappyAbsSyn28
		 (AbsGrammar.Mul
	)

happyReduce_69 = happySpecReduce_1  28 happyReduction_69
happyReduction_69 _
	 =  HappyAbsSyn28
		 (AbsGrammar.Div
	)

happyReduce_70 = happySpecReduce_1  28 happyReduction_70
happyReduction_70 _
	 =  HappyAbsSyn28
		 (AbsGrammar.Mod
	)

happyReduce_71 = happySpecReduce_1  29 happyReduction_71
happyReduction_71 _
	 =  HappyAbsSyn29
		 (AbsGrammar.Lth
	)

happyReduce_72 = happySpecReduce_1  29 happyReduction_72
happyReduction_72 _
	 =  HappyAbsSyn29
		 (AbsGrammar.Le
	)

happyReduce_73 = happySpecReduce_1  29 happyReduction_73
happyReduction_73 _
	 =  HappyAbsSyn29
		 (AbsGrammar.Gth
	)

happyReduce_74 = happySpecReduce_1  29 happyReduction_74
happyReduction_74 _
	 =  HappyAbsSyn29
		 (AbsGrammar.Ge
	)

happyReduce_75 = happySpecReduce_1  29 happyReduction_75
happyReduction_75 _
	 =  HappyAbsSyn29
		 (AbsGrammar.Eq
	)

happyReduce_76 = happySpecReduce_1  29 happyReduction_76
happyReduction_76 _
	 =  HappyAbsSyn29
		 (AbsGrammar.Ne
	)

happyNewToken action sts stk [] =
	action 71 71 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 30;
	PT _ (TS _ 2) -> cont 31;
	PT _ (TS _ 3) -> cont 32;
	PT _ (TS _ 4) -> cont 33;
	PT _ (TS _ 5) -> cont 34;
	PT _ (TS _ 6) -> cont 35;
	PT _ (TS _ 7) -> cont 36;
	PT _ (TS _ 8) -> cont 37;
	PT _ (TS _ 9) -> cont 38;
	PT _ (TS _ 10) -> cont 39;
	PT _ (TS _ 11) -> cont 40;
	PT _ (TS _ 12) -> cont 41;
	PT _ (TS _ 13) -> cont 42;
	PT _ (TS _ 14) -> cont 43;
	PT _ (TS _ 15) -> cont 44;
	PT _ (TS _ 16) -> cont 45;
	PT _ (TS _ 17) -> cont 46;
	PT _ (TS _ 18) -> cont 47;
	PT _ (TS _ 19) -> cont 48;
	PT _ (TS _ 20) -> cont 49;
	PT _ (TS _ 21) -> cont 50;
	PT _ (TS _ 22) -> cont 51;
	PT _ (TS _ 23) -> cont 52;
	PT _ (TS _ 24) -> cont 53;
	PT _ (TS _ 25) -> cont 54;
	PT _ (TS _ 26) -> cont 55;
	PT _ (TS _ 27) -> cont 56;
	PT _ (TS _ 28) -> cont 57;
	PT _ (TS _ 29) -> cont 58;
	PT _ (TS _ 30) -> cont 59;
	PT _ (TS _ 31) -> cont 60;
	PT _ (TS _ 32) -> cont 61;
	PT _ (TS _ 33) -> cont 62;
	PT _ (TS _ 34) -> cont 63;
	PT _ (TS _ 35) -> cont 64;
	PT _ (TS _ 36) -> cont 65;
	PT _ (TS _ 37) -> cont 66;
	PT _ (TS _ 38) -> cont 67;
	PT _ (TV happy_dollar_dollar) -> cont 68;
	PT _ (TI happy_dollar_dollar) -> cont 69;
	PT _ (TL happy_dollar_dollar) -> cont 70;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 71 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

happyThen :: () => Err a -> (a -> Err b) -> Err b
happyThen = (thenM)
happyReturn :: () => a -> Err a
happyReturn = (returnM)
happyThen1 m k tks = (thenM) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Err a
happyReturn1 = \a tks -> (returnM) a
happyError' :: () => ([(Token)], [String]) -> Err a
happyError' = (\(tokens, _) -> happyError tokens)
pProgram tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn7 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


returnM :: a -> Err a
returnM = return

thenM :: Err a -> (a -> Err b) -> Err b
thenM = (>>=)

happyError :: [Token] -> Err a
happyError ts =
  Bad $ "syntax error at " ++ tokenPos ts ++ 
  case ts of
    [] -> []
    [Err _] -> " due to lexer error"
    t:_ -> " before `" ++ id(prToken t) ++ "'"

myLexer = tokens
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}







# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4














































{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc/include/ghcversion.h" #-}















{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "/tmp/ghc8814_0/ghc_2.h" #-}








































































































































































{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates/GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates/GenericTemplate.hs" #-}

{-# LINE 75 "templates/GenericTemplate.hs" #-}

{-# LINE 84 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates/GenericTemplate.hs" #-}

{-# LINE 147 "templates/GenericTemplate.hs" #-}
indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 333 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
