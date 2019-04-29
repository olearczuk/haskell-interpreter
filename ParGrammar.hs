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
 action_124 :: () => Int -> ({-HappyReduction (Err) = -}
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
happyExpList = Happy_Data_Array.listArray (0,456) ([0,0,0,0,0,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,8704,57416,40701,3,0,2320,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,17408,16,0,0,0,576,0,0,0,640,944,0,0,0,0,0,2,0,0,2,0,0,0,0,0,0,0,4164,2048,1796,0,8704,8,33284,3,0,1041,512,449,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,9473,0,0,0,1,0,0,0,0,0,0,0,32,0,0,0,4096,0,0,0,0,0,0,0,0,1088,32777,28736,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,2308,57276,123,0,33312,16384,14368,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,2082,1024,898,0,0,0,16384,0,0,0,0,0,0,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1041,512,449,0,2176,2,57473,0,0,0,0,0,0,33312,16384,14368,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,520,33024,224,0,0,0,0,0,0,0,0,0,0,16656,8192,7184,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,1,0,0,0,1,0,0,0,2048,0,0,0,33312,16384,14368,0,0,512,0,0,0,0,1,0,0,17408,16,1032,7,0,16384,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,2,0,0,16448,9,0,8704,8,33284,3,0,0,0,0,0,8704,8,0,0,0,0,0,0,0,36864,0,0,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,16384,0,0,0,0,256,0,0,0,16,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,34816,33056,31735,14,0,36932,64448,1853,0,8704,8,33284,3,0,0,0,0,0,0,0,0,0,0,128,0,0,0,1024,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,2082,1024,898,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,256,37,0,0,0,1024,0,0,0,0,0,0,0,0,0,0,0,9233,32496,463,0,2176,2,57473,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,17408,49296,15867,7,0,0,0,0,0
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

action_0 (7) = happyGoto action_3
action_0 (15) = happyGoto action_4
action_0 _ = happyReduce_19

action_1 (68) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (71) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (30) = happyShift action_19
action_4 (34) = happyShift action_20
action_4 (40) = happyShift action_21
action_4 (43) = happyShift action_22
action_4 (50) = happyShift action_23
action_4 (51) = happyShift action_24
action_4 (52) = happyShift action_25
action_4 (53) = happyShift action_26
action_4 (55) = happyShift action_27
action_4 (56) = happyShift action_28
action_4 (57) = happyShift action_29
action_4 (58) = happyShift action_30
action_4 (59) = happyShift action_31
action_4 (60) = happyShift action_32
action_4 (62) = happyShift action_33
action_4 (63) = happyShift action_34
action_4 (64) = happyShift action_35
action_4 (65) = happyShift action_36
action_4 (68) = happyShift action_2
action_4 (69) = happyShift action_37
action_4 (70) = happyShift action_38
action_4 (4) = happyGoto action_5
action_4 (5) = happyGoto action_6
action_4 (6) = happyGoto action_7
action_4 (8) = happyGoto action_8
action_4 (14) = happyGoto action_9
action_4 (16) = happyGoto action_10
action_4 (17) = happyGoto action_11
action_4 (19) = happyGoto action_12
action_4 (20) = happyGoto action_13
action_4 (21) = happyGoto action_14
action_4 (22) = happyGoto action_15
action_4 (23) = happyGoto action_16
action_4 (24) = happyGoto action_17
action_4 (25) = happyGoto action_18
action_4 _ = happyReduce_4

action_5 (34) = happyShift action_72
action_5 (38) = happyShift action_73
action_5 (41) = happyShift action_74
action_5 (46) = happyShift action_75
action_5 _ = happyReduce_43

action_6 _ = happyReduce_44

action_7 _ = happyReduce_48

action_8 _ = happyReduce_35

action_9 _ = happyReduce_22

action_10 _ = happyReduce_20

action_11 (68) = happyShift action_2
action_11 (4) = happyGoto action_69
action_11 (9) = happyGoto action_70
action_11 (10) = happyGoto action_71
action_11 _ = happyFail (happyExpListPerState 11)

action_12 _ = happyReduce_62

action_13 (32) = happyShift action_66
action_13 (36) = happyShift action_67
action_13 (42) = happyShift action_68
action_13 (28) = happyGoto action_65
action_13 _ = happyReduce_55

action_14 (37) = happyShift action_63
action_14 (40) = happyShift action_64
action_14 (27) = happyGoto action_62
action_14 _ = happyReduce_57

action_15 (31) = happyShift action_55
action_15 (33) = happyShift action_56
action_15 (44) = happyShift action_57
action_15 (45) = happyShift action_58
action_15 (47) = happyShift action_59
action_15 (48) = happyShift action_60
action_15 (49) = happyShift action_61
action_15 (29) = happyGoto action_54
action_15 _ = happyReduce_59

action_16 (66) = happyShift action_53
action_16 _ = happyReduce_61

action_17 (43) = happyShift action_52
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_53

action_19 (30) = happyShift action_19
action_19 (34) = happyShift action_20
action_19 (40) = happyShift action_21
action_19 (55) = happyShift action_27
action_19 (62) = happyShift action_33
action_19 (68) = happyShift action_2
action_19 (69) = happyShift action_37
action_19 (70) = happyShift action_38
action_19 (4) = happyGoto action_41
action_19 (5) = happyGoto action_6
action_19 (6) = happyGoto action_7
action_19 (19) = happyGoto action_51
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (30) = happyShift action_19
action_20 (34) = happyShift action_20
action_20 (40) = happyShift action_21
action_20 (55) = happyShift action_27
action_20 (62) = happyShift action_33
action_20 (68) = happyShift action_2
action_20 (69) = happyShift action_37
action_20 (70) = happyShift action_38
action_20 (4) = happyGoto action_41
action_20 (5) = happyGoto action_6
action_20 (6) = happyGoto action_7
action_20 (19) = happyGoto action_12
action_20 (20) = happyGoto action_13
action_20 (21) = happyGoto action_14
action_20 (22) = happyGoto action_15
action_20 (23) = happyGoto action_16
action_20 (24) = happyGoto action_50
action_20 (25) = happyGoto action_18
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (30) = happyShift action_19
action_21 (34) = happyShift action_20
action_21 (40) = happyShift action_21
action_21 (55) = happyShift action_27
action_21 (62) = happyShift action_33
action_21 (68) = happyShift action_2
action_21 (69) = happyShift action_37
action_21 (70) = happyShift action_38
action_21 (4) = happyGoto action_41
action_21 (5) = happyGoto action_6
action_21 (6) = happyGoto action_7
action_21 (19) = happyGoto action_49
action_21 _ = happyFail (happyExpListPerState 21)

action_22 _ = happyReduce_21

action_23 _ = happyReduce_38

action_24 (43) = happyShift action_48
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (50) = happyShift action_23
action_25 (58) = happyShift action_30
action_25 (60) = happyShift action_32
action_25 (63) = happyShift action_34
action_25 (17) = happyGoto action_47
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (43) = happyShift action_46
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_46

action_28 (34) = happyShift action_45
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (34) = happyShift action_44
action_29 _ = happyFail (happyExpListPerState 29)

action_30 _ = happyReduce_36

action_31 (30) = happyShift action_19
action_31 (34) = happyShift action_20
action_31 (40) = happyShift action_21
action_31 (43) = happyShift action_43
action_31 (55) = happyShift action_27
action_31 (62) = happyShift action_33
action_31 (68) = happyShift action_2
action_31 (69) = happyShift action_37
action_31 (70) = happyShift action_38
action_31 (4) = happyGoto action_41
action_31 (5) = happyGoto action_6
action_31 (6) = happyGoto action_7
action_31 (19) = happyGoto action_12
action_31 (20) = happyGoto action_13
action_31 (21) = happyGoto action_14
action_31 (22) = happyGoto action_15
action_31 (23) = happyGoto action_16
action_31 (24) = happyGoto action_42
action_31 (25) = happyGoto action_18
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_37

action_33 _ = happyReduce_45

action_34 _ = happyReduce_39

action_35 (34) = happyShift action_40
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (15) = happyGoto action_39
action_36 _ = happyReduce_19

action_37 _ = happyReduce_2

action_38 _ = happyReduce_3

action_39 (30) = happyShift action_19
action_39 (34) = happyShift action_20
action_39 (40) = happyShift action_21
action_39 (43) = happyShift action_22
action_39 (50) = happyShift action_23
action_39 (51) = happyShift action_24
action_39 (52) = happyShift action_25
action_39 (53) = happyShift action_26
action_39 (55) = happyShift action_27
action_39 (56) = happyShift action_28
action_39 (57) = happyShift action_29
action_39 (58) = happyShift action_30
action_39 (59) = happyShift action_31
action_39 (60) = happyShift action_32
action_39 (62) = happyShift action_33
action_39 (63) = happyShift action_34
action_39 (64) = happyShift action_35
action_39 (65) = happyShift action_36
action_39 (67) = happyShift action_97
action_39 (68) = happyShift action_2
action_39 (69) = happyShift action_37
action_39 (70) = happyShift action_38
action_39 (4) = happyGoto action_5
action_39 (5) = happyGoto action_6
action_39 (6) = happyGoto action_7
action_39 (8) = happyGoto action_8
action_39 (14) = happyGoto action_9
action_39 (16) = happyGoto action_10
action_39 (17) = happyGoto action_11
action_39 (19) = happyGoto action_12
action_39 (20) = happyGoto action_13
action_39 (21) = happyGoto action_14
action_39 (22) = happyGoto action_15
action_39 (23) = happyGoto action_16
action_39 (24) = happyGoto action_17
action_39 (25) = happyGoto action_18
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (30) = happyShift action_19
action_40 (34) = happyShift action_20
action_40 (40) = happyShift action_21
action_40 (55) = happyShift action_27
action_40 (62) = happyShift action_33
action_40 (68) = happyShift action_2
action_40 (69) = happyShift action_37
action_40 (70) = happyShift action_38
action_40 (4) = happyGoto action_41
action_40 (5) = happyGoto action_6
action_40 (6) = happyGoto action_7
action_40 (19) = happyGoto action_12
action_40 (20) = happyGoto action_13
action_40 (21) = happyGoto action_14
action_40 (22) = happyGoto action_15
action_40 (23) = happyGoto action_16
action_40 (24) = happyGoto action_96
action_40 (25) = happyGoto action_18
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (34) = happyShift action_72
action_41 _ = happyReduce_43

action_42 (43) = happyShift action_95
action_42 _ = happyFail (happyExpListPerState 42)

action_43 _ = happyReduce_27

action_44 (30) = happyShift action_19
action_44 (34) = happyShift action_20
action_44 (40) = happyShift action_21
action_44 (55) = happyShift action_27
action_44 (62) = happyShift action_33
action_44 (68) = happyShift action_2
action_44 (69) = happyShift action_37
action_44 (70) = happyShift action_38
action_44 (4) = happyGoto action_41
action_44 (5) = happyGoto action_6
action_44 (6) = happyGoto action_7
action_44 (19) = happyGoto action_12
action_44 (20) = happyGoto action_13
action_44 (21) = happyGoto action_14
action_44 (22) = happyGoto action_15
action_44 (23) = happyGoto action_16
action_44 (24) = happyGoto action_94
action_44 (25) = happyGoto action_18
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (68) = happyShift action_2
action_45 (4) = happyGoto action_93
action_45 _ = happyFail (happyExpListPerState 45)

action_46 _ = happyReduce_33

action_47 (68) = happyShift action_2
action_47 (4) = happyGoto action_91
action_47 (9) = happyGoto action_70
action_47 (10) = happyGoto action_92
action_47 _ = happyFail (happyExpListPerState 47)

action_48 _ = happyReduce_32

action_49 _ = happyReduce_49

action_50 (35) = happyShift action_90
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_50

action_52 _ = happyReduce_34

action_53 (30) = happyShift action_19
action_53 (34) = happyShift action_20
action_53 (40) = happyShift action_21
action_53 (55) = happyShift action_27
action_53 (62) = happyShift action_33
action_53 (68) = happyShift action_2
action_53 (69) = happyShift action_37
action_53 (70) = happyShift action_38
action_53 (4) = happyGoto action_41
action_53 (5) = happyGoto action_6
action_53 (6) = happyGoto action_7
action_53 (19) = happyGoto action_12
action_53 (20) = happyGoto action_13
action_53 (21) = happyGoto action_14
action_53 (22) = happyGoto action_15
action_53 (23) = happyGoto action_16
action_53 (24) = happyGoto action_89
action_53 (25) = happyGoto action_18
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (30) = happyShift action_19
action_54 (34) = happyShift action_20
action_54 (40) = happyShift action_21
action_54 (55) = happyShift action_27
action_54 (62) = happyShift action_33
action_54 (68) = happyShift action_2
action_54 (69) = happyShift action_37
action_54 (70) = happyShift action_38
action_54 (4) = happyGoto action_41
action_54 (5) = happyGoto action_6
action_54 (6) = happyGoto action_7
action_54 (19) = happyGoto action_12
action_54 (20) = happyGoto action_13
action_54 (21) = happyGoto action_88
action_54 (25) = happyGoto action_18
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_76

action_56 (30) = happyShift action_19
action_56 (34) = happyShift action_20
action_56 (40) = happyShift action_21
action_56 (55) = happyShift action_27
action_56 (62) = happyShift action_33
action_56 (68) = happyShift action_2
action_56 (69) = happyShift action_37
action_56 (70) = happyShift action_38
action_56 (4) = happyGoto action_41
action_56 (5) = happyGoto action_6
action_56 (6) = happyGoto action_7
action_56 (19) = happyGoto action_12
action_56 (20) = happyGoto action_13
action_56 (21) = happyGoto action_14
action_56 (22) = happyGoto action_15
action_56 (23) = happyGoto action_87
action_56 (25) = happyGoto action_18
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_71

action_58 _ = happyReduce_72

action_59 _ = happyReduce_75

action_60 _ = happyReduce_73

action_61 _ = happyReduce_74

action_62 (30) = happyShift action_19
action_62 (34) = happyShift action_20
action_62 (40) = happyShift action_21
action_62 (55) = happyShift action_27
action_62 (62) = happyShift action_33
action_62 (68) = happyShift action_2
action_62 (69) = happyShift action_37
action_62 (70) = happyShift action_38
action_62 (4) = happyGoto action_41
action_62 (5) = happyGoto action_6
action_62 (6) = happyGoto action_7
action_62 (19) = happyGoto action_12
action_62 (20) = happyGoto action_86
action_62 (25) = happyGoto action_18
action_62 _ = happyFail (happyExpListPerState 62)

action_63 _ = happyReduce_66

action_64 _ = happyReduce_67

action_65 (30) = happyShift action_19
action_65 (34) = happyShift action_20
action_65 (40) = happyShift action_21
action_65 (55) = happyShift action_27
action_65 (62) = happyShift action_33
action_65 (68) = happyShift action_2
action_65 (69) = happyShift action_37
action_65 (70) = happyShift action_38
action_65 (4) = happyGoto action_41
action_65 (5) = happyGoto action_6
action_65 (6) = happyGoto action_7
action_65 (19) = happyGoto action_12
action_65 (25) = happyGoto action_85
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_70

action_67 _ = happyReduce_68

action_68 _ = happyReduce_69

action_69 (34) = happyShift action_83
action_69 (46) = happyShift action_84
action_69 _ = happyReduce_8

action_70 (39) = happyShift action_82
action_70 _ = happyReduce_10

action_71 (43) = happyShift action_81
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (30) = happyShift action_19
action_72 (34) = happyShift action_20
action_72 (40) = happyShift action_21
action_72 (55) = happyShift action_27
action_72 (62) = happyShift action_33
action_72 (68) = happyShift action_2
action_72 (69) = happyShift action_37
action_72 (70) = happyShift action_38
action_72 (4) = happyGoto action_41
action_72 (5) = happyGoto action_6
action_72 (6) = happyGoto action_7
action_72 (19) = happyGoto action_12
action_72 (20) = happyGoto action_13
action_72 (21) = happyGoto action_14
action_72 (22) = happyGoto action_15
action_72 (23) = happyGoto action_16
action_72 (24) = happyGoto action_79
action_72 (25) = happyGoto action_18
action_72 (26) = happyGoto action_80
action_72 _ = happyReduce_63

action_73 (43) = happyShift action_78
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (43) = happyShift action_77
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (30) = happyShift action_19
action_75 (34) = happyShift action_20
action_75 (40) = happyShift action_21
action_75 (55) = happyShift action_27
action_75 (62) = happyShift action_33
action_75 (68) = happyShift action_2
action_75 (69) = happyShift action_37
action_75 (70) = happyShift action_38
action_75 (4) = happyGoto action_41
action_75 (5) = happyGoto action_6
action_75 (6) = happyGoto action_7
action_75 (19) = happyGoto action_12
action_75 (20) = happyGoto action_13
action_75 (21) = happyGoto action_14
action_75 (22) = happyGoto action_15
action_75 (23) = happyGoto action_16
action_75 (24) = happyGoto action_76
action_75 (25) = happyGoto action_18
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (43) = happyShift action_109
action_76 _ = happyFail (happyExpListPerState 76)

action_77 _ = happyReduce_25

action_78 _ = happyReduce_24

action_79 (39) = happyShift action_108
action_79 _ = happyReduce_64

action_80 (35) = happyShift action_107
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_6

action_82 (68) = happyShift action_2
action_82 (4) = happyGoto action_91
action_82 (9) = happyGoto action_70
action_82 (10) = happyGoto action_106
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (50) = happyShift action_23
action_83 (58) = happyShift action_30
action_83 (60) = happyShift action_32
action_83 (63) = happyShift action_34
action_83 (12) = happyGoto action_103
action_83 (13) = happyGoto action_104
action_83 (17) = happyGoto action_105
action_83 _ = happyReduce_15

action_84 (30) = happyShift action_19
action_84 (34) = happyShift action_20
action_84 (40) = happyShift action_21
action_84 (55) = happyShift action_27
action_84 (62) = happyShift action_33
action_84 (68) = happyShift action_2
action_84 (69) = happyShift action_37
action_84 (70) = happyShift action_38
action_84 (4) = happyGoto action_41
action_84 (5) = happyGoto action_6
action_84 (6) = happyGoto action_7
action_84 (19) = happyGoto action_12
action_84 (20) = happyGoto action_13
action_84 (21) = happyGoto action_14
action_84 (22) = happyGoto action_15
action_84 (23) = happyGoto action_16
action_84 (24) = happyGoto action_102
action_84 (25) = happyGoto action_18
action_84 _ = happyFail (happyExpListPerState 84)

action_85 _ = happyReduce_52

action_86 (32) = happyShift action_66
action_86 (36) = happyShift action_67
action_86 (42) = happyShift action_68
action_86 (28) = happyGoto action_65
action_86 _ = happyReduce_54

action_87 _ = happyReduce_58

action_88 (37) = happyShift action_63
action_88 (40) = happyShift action_64
action_88 (27) = happyGoto action_62
action_88 _ = happyReduce_56

action_89 _ = happyReduce_60

action_90 _ = happyReduce_51

action_91 (46) = happyShift action_84
action_91 _ = happyReduce_8

action_92 (43) = happyShift action_101
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (46) = happyShift action_100
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (35) = happyShift action_99
action_94 _ = happyFail (happyExpListPerState 94)

action_95 _ = happyReduce_26

action_96 (35) = happyShift action_98
action_96 _ = happyFail (happyExpListPerState 96)

action_97 _ = happyReduce_18

action_98 (30) = happyShift action_19
action_98 (34) = happyShift action_20
action_98 (40) = happyShift action_21
action_98 (43) = happyShift action_22
action_98 (50) = happyShift action_23
action_98 (51) = happyShift action_24
action_98 (52) = happyShift action_25
action_98 (53) = happyShift action_26
action_98 (55) = happyShift action_27
action_98 (56) = happyShift action_28
action_98 (57) = happyShift action_29
action_98 (58) = happyShift action_30
action_98 (59) = happyShift action_31
action_98 (60) = happyShift action_32
action_98 (62) = happyShift action_33
action_98 (63) = happyShift action_34
action_98 (64) = happyShift action_35
action_98 (65) = happyShift action_36
action_98 (68) = happyShift action_2
action_98 (69) = happyShift action_37
action_98 (70) = happyShift action_38
action_98 (4) = happyGoto action_5
action_98 (5) = happyGoto action_6
action_98 (6) = happyGoto action_7
action_98 (8) = happyGoto action_8
action_98 (14) = happyGoto action_9
action_98 (16) = happyGoto action_116
action_98 (17) = happyGoto action_11
action_98 (19) = happyGoto action_12
action_98 (20) = happyGoto action_13
action_98 (21) = happyGoto action_14
action_98 (22) = happyGoto action_15
action_98 (23) = happyGoto action_16
action_98 (24) = happyGoto action_17
action_98 (25) = happyGoto action_18
action_98 _ = happyFail (happyExpListPerState 98)

action_99 (30) = happyShift action_19
action_99 (34) = happyShift action_20
action_99 (40) = happyShift action_21
action_99 (43) = happyShift action_22
action_99 (50) = happyShift action_23
action_99 (51) = happyShift action_24
action_99 (52) = happyShift action_25
action_99 (53) = happyShift action_26
action_99 (55) = happyShift action_27
action_99 (56) = happyShift action_28
action_99 (57) = happyShift action_29
action_99 (58) = happyShift action_30
action_99 (59) = happyShift action_31
action_99 (60) = happyShift action_32
action_99 (62) = happyShift action_33
action_99 (63) = happyShift action_34
action_99 (64) = happyShift action_35
action_99 (65) = happyShift action_36
action_99 (68) = happyShift action_2
action_99 (69) = happyShift action_37
action_99 (70) = happyShift action_38
action_99 (4) = happyGoto action_5
action_99 (5) = happyGoto action_6
action_99 (6) = happyGoto action_7
action_99 (8) = happyGoto action_8
action_99 (14) = happyGoto action_9
action_99 (16) = happyGoto action_115
action_99 (17) = happyGoto action_11
action_99 (19) = happyGoto action_12
action_99 (20) = happyGoto action_13
action_99 (21) = happyGoto action_14
action_99 (22) = happyGoto action_15
action_99 (23) = happyGoto action_16
action_99 (24) = happyGoto action_17
action_99 (25) = happyGoto action_18
action_99 _ = happyFail (happyExpListPerState 99)

action_100 (30) = happyShift action_19
action_100 (34) = happyShift action_20
action_100 (40) = happyShift action_21
action_100 (55) = happyShift action_27
action_100 (62) = happyShift action_33
action_100 (68) = happyShift action_2
action_100 (69) = happyShift action_37
action_100 (70) = happyShift action_38
action_100 (4) = happyGoto action_41
action_100 (5) = happyGoto action_6
action_100 (6) = happyGoto action_7
action_100 (19) = happyGoto action_12
action_100 (20) = happyGoto action_13
action_100 (21) = happyGoto action_14
action_100 (22) = happyGoto action_15
action_100 (23) = happyGoto action_16
action_100 (24) = happyGoto action_114
action_100 (25) = happyGoto action_18
action_100 _ = happyFail (happyExpListPerState 100)

action_101 _ = happyReduce_7

action_102 _ = happyReduce_9

action_103 (39) = happyShift action_113
action_103 _ = happyReduce_16

action_104 (35) = happyShift action_112
action_104 _ = happyFail (happyExpListPerState 104)

action_105 (68) = happyShift action_2
action_105 (4) = happyGoto action_111
action_105 _ = happyFail (happyExpListPerState 105)

action_106 _ = happyReduce_11

action_107 _ = happyReduce_47

action_108 (30) = happyShift action_19
action_108 (34) = happyShift action_20
action_108 (40) = happyShift action_21
action_108 (55) = happyShift action_27
action_108 (62) = happyShift action_33
action_108 (68) = happyShift action_2
action_108 (69) = happyShift action_37
action_108 (70) = happyShift action_38
action_108 (4) = happyGoto action_41
action_108 (5) = happyGoto action_6
action_108 (6) = happyGoto action_7
action_108 (19) = happyGoto action_12
action_108 (20) = happyGoto action_13
action_108 (21) = happyGoto action_14
action_108 (22) = happyGoto action_15
action_108 (23) = happyGoto action_16
action_108 (24) = happyGoto action_79
action_108 (25) = happyGoto action_18
action_108 (26) = happyGoto action_110
action_108 _ = happyReduce_63

action_109 _ = happyReduce_23

action_110 _ = happyReduce_65

action_111 _ = happyReduce_14

action_112 (65) = happyShift action_36
action_112 (14) = happyGoto action_120
action_112 _ = happyFail (happyExpListPerState 112)

action_113 (50) = happyShift action_23
action_113 (58) = happyShift action_30
action_113 (60) = happyShift action_32
action_113 (63) = happyShift action_34
action_113 (12) = happyGoto action_103
action_113 (13) = happyGoto action_119
action_113 (17) = happyGoto action_105
action_113 _ = happyReduce_15

action_114 (61) = happyShift action_118
action_114 _ = happyFail (happyExpListPerState 114)

action_115 (54) = happyShift action_117
action_115 _ = happyReduce_28

action_116 _ = happyReduce_30

action_117 (30) = happyShift action_19
action_117 (34) = happyShift action_20
action_117 (40) = happyShift action_21
action_117 (43) = happyShift action_22
action_117 (50) = happyShift action_23
action_117 (51) = happyShift action_24
action_117 (52) = happyShift action_25
action_117 (53) = happyShift action_26
action_117 (55) = happyShift action_27
action_117 (56) = happyShift action_28
action_117 (57) = happyShift action_29
action_117 (58) = happyShift action_30
action_117 (59) = happyShift action_31
action_117 (60) = happyShift action_32
action_117 (62) = happyShift action_33
action_117 (63) = happyShift action_34
action_117 (64) = happyShift action_35
action_117 (65) = happyShift action_36
action_117 (68) = happyShift action_2
action_117 (69) = happyShift action_37
action_117 (70) = happyShift action_38
action_117 (4) = happyGoto action_5
action_117 (5) = happyGoto action_6
action_117 (6) = happyGoto action_7
action_117 (8) = happyGoto action_8
action_117 (14) = happyGoto action_9
action_117 (16) = happyGoto action_122
action_117 (17) = happyGoto action_11
action_117 (19) = happyGoto action_12
action_117 (20) = happyGoto action_13
action_117 (21) = happyGoto action_14
action_117 (22) = happyGoto action_15
action_117 (23) = happyGoto action_16
action_117 (24) = happyGoto action_17
action_117 (25) = happyGoto action_18
action_117 _ = happyFail (happyExpListPerState 117)

action_118 (30) = happyShift action_19
action_118 (34) = happyShift action_20
action_118 (40) = happyShift action_21
action_118 (55) = happyShift action_27
action_118 (62) = happyShift action_33
action_118 (68) = happyShift action_2
action_118 (69) = happyShift action_37
action_118 (70) = happyShift action_38
action_118 (4) = happyGoto action_41
action_118 (5) = happyGoto action_6
action_118 (6) = happyGoto action_7
action_118 (19) = happyGoto action_12
action_118 (20) = happyGoto action_13
action_118 (21) = happyGoto action_14
action_118 (22) = happyGoto action_15
action_118 (23) = happyGoto action_16
action_118 (24) = happyGoto action_121
action_118 (25) = happyGoto action_18
action_118 _ = happyFail (happyExpListPerState 118)

action_119 _ = happyReduce_17

action_120 _ = happyReduce_5

action_121 (35) = happyShift action_123
action_121 _ = happyFail (happyExpListPerState 121)

action_122 _ = happyReduce_29

action_123 (30) = happyShift action_19
action_123 (34) = happyShift action_20
action_123 (40) = happyShift action_21
action_123 (43) = happyShift action_22
action_123 (50) = happyShift action_23
action_123 (51) = happyShift action_24
action_123 (52) = happyShift action_25
action_123 (53) = happyShift action_26
action_123 (55) = happyShift action_27
action_123 (56) = happyShift action_28
action_123 (57) = happyShift action_29
action_123 (58) = happyShift action_30
action_123 (59) = happyShift action_31
action_123 (60) = happyShift action_32
action_123 (62) = happyShift action_33
action_123 (63) = happyShift action_34
action_123 (64) = happyShift action_35
action_123 (65) = happyShift action_36
action_123 (68) = happyShift action_2
action_123 (69) = happyShift action_37
action_123 (70) = happyShift action_38
action_123 (4) = happyGoto action_5
action_123 (5) = happyGoto action_6
action_123 (6) = happyGoto action_7
action_123 (8) = happyGoto action_8
action_123 (14) = happyGoto action_9
action_123 (16) = happyGoto action_124
action_123 (17) = happyGoto action_11
action_123 (19) = happyGoto action_12
action_123 (20) = happyGoto action_13
action_123 (21) = happyGoto action_14
action_123 (22) = happyGoto action_15
action_123 (23) = happyGoto action_16
action_123 (24) = happyGoto action_17
action_123 (25) = happyGoto action_18
action_123 _ = happyFail (happyExpListPerState 123)

action_124 _ = happyReduce_31

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
happyReduction_4 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn7
		 (AbsGrammar.Program (reverse happy_var_1)
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
