open Prelude
open Constants
open Constants.K
module Def = struct
let freshFunction (sort: string) (config: k) (counter: Z.t) : k = interned_bottom
let eval'Hash'argv (c: unit) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'argv and sort = 
SortList in match c with 
| _ -> try KREFLECTION.hook_argv c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let const'Hash'argv : k Lazy.t = lazy (eval'Hash'argv () interned_bottom (-1))
let evalisBool (c: k) (config: k) (guard: int) : k = let lbl = 
LblisBool and sort = 
SortBool in match c with 
| [Bool _] -> [Bool true]
(*{| rule ``isBool(#KToken(#token("Bool","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortBool, var__0) :: [])) -> ((Bool true) :: [])
(*{| rule ``isBool(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_1)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_andBool_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_andBool_ and sort = 
SortBool in match c with 
| _ -> try BOOL.hook_and c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_andBool_`(_8,#token("false","Bool"))=>#token("false","Bool")`` requires isBool(_8) ensures #token("true","Bool") [UNIQUE_ID(1a7512841ede635d09556466797d23f3f3cec57fe0fb6a68ce0c3a1cccb0b68f) contentStartColumn(8) contentStartLine(305) org.kframework.attributes.Location(Location(305,8,305,37)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool _ as var_8_2) :: []),((Bool false) :: [])) when true && (true) -> ((Bool false) :: [])
(*{| rule `` `_andBool_`(#token("false","Bool"),_0)=>#token("false","Bool")`` requires isBool(_0) ensures #token("true","Bool") [UNIQUE_ID(e6ebe927ba416a1602679eb0166f22d394adf70452e0505c00f11c036a896253) contentStartColumn(8) contentStartLine(304) org.kframework.attributes.Location(Location(304,8,304,37)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool false) :: []),((Bool _ as var_0_3) :: [])) when true && (true) -> ((Bool false) :: [])
(*{| rule `` `_andBool_`(#token("true","Bool"),B)=>B`` requires isBool(B) ensures #token("true","Bool") [UNIQUE_ID(cd0a9b340fae24c9a05126d8df860cb7145fc64875711e36efaa694085559dc0) contentStartColumn(8) contentStartLine(302) org.kframework.attributes.Location(Location(302,8,302,37)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool true) :: []),((Bool _ as varB_4) :: [])) when true && (true) -> (varB_4 :: [])
(*{| rule `` `_andBool_`(B,#token("true","Bool"))=>B`` requires isBool(B) ensures #token("true","Bool") [UNIQUE_ID(b598bf51d1c959b7112e06b7f85a391ee5a18108acd52bb65ea27ef0381ed0e0) contentStartColumn(8) contentStartLine(303) org.kframework.attributes.Location(Location(303,8,303,37)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool _ as varB_5) :: []),((Bool true) :: [])) when true && (true) -> (varB_5 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisId (c: k) (config: k) (guard: int) : k = let lbl = 
LblisId and sort = 
SortBool in match c with 
(*{| rule ``isId(#KToken(#token("Id","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortId, var__6) :: [])) -> ((Bool true) :: [])
(*{| rule ``isId(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_7)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let rec evalisInt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisInt and sort = 
SortBool in match c with 
| [Int _] -> [Bool true]
(*{| rule ``isInt(#KToken(#token("Int","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortInt, var__8) :: [])) -> ((Bool true) :: [])
(*{| rule ``isInt(#cint(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isInt(K0),isInt(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'Hash'cint,((Int _ as varK0_9) :: []),((Int _ as varK1_10) :: [])) :: [])) when ((true) && (true)) && (true) -> ((Bool true) :: [])
(*{| rule ``isInt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_11)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisLifetime (c: k) (config: k) (guard: int) : k = let lbl = 
LblisLifetime and sort = 
SortBool in match c with 
| [Int _] -> [Bool true]
(*{| rule ``isLifetime(#KToken(#token("Lifetime","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortLifetime, var__12) :: [])) -> ((Bool true) :: [])
(*{| rule ``isLifetime(`'__OSL-SYNTAX`(K0))=>#token("true","Bool")`` requires isId(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Apos'__OSL'Hyph'SYNTAX,(varK0_13 :: [])) :: [])) when (isTrue (evalisId((varK0_13 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isLifetime(#cint(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isInt(K0),isInt(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'Hash'cint,((Int _ as varK0_14) :: []),((Int _ as varK1_15) :: [])) :: [])) when ((true) && (true)) && (true) -> ((Bool true) :: [])
(*{| rule ``isLifetime(#KToken(#token("Int","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortInt, var__16) :: [])) -> ((Bool true) :: [])
(*{| rule ``isLifetime(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_17)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisProp (c: k) (config: k) (guard: int) : k = let lbl = 
LblisProp and sort = 
SortBool in match c with 
(*{| rule ``isProp(`mut_OSL-SYNTAX`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lblmut_OSL'Hyph'SYNTAX) :: [])) -> ((Bool true) :: [])
(*{| rule ``isProp(`copy_OSL-SYNTAX`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lblcopy_OSL'Hyph'SYNTAX) :: [])) -> ((Bool true) :: [])
(*{| rule ``isProp(#KToken(#token("Prop","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortProp, var__18) :: [])) -> ((Bool true) :: [])
(*{| rule ``isProp(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_19)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let rec evalisProps (c: k) (config: k) (guard: int) : k = let lbl = 
LblisProps and sort = 
SortBool in match c with 
(*{| rule ``isProps(#props(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isProp(K0),isProps(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'Hash'props,(varK0_20 :: []),(varK1_21 :: [])) :: [])) when (((isTrue (evalisProp((varK0_20 :: [])) config (-1)))) && ((isTrue (evalisProps((varK1_21 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isProps(#KToken(#token("Props","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortProps, var__22) :: [])) -> ((Bool true) :: [])
(*{| rule ``isProps(`.List{"#props"}`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Stop'List'LBraQuotHash'props'QuotRBra') :: [])) -> ((Bool true) :: [])
(*{| rule ``isProps(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_23)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let rec evalisType (c: k) (config: k) (guard: int) : k = let lbl = 
LblisType and sort = 
SortBool in match c with 
(*{| rule ``isType(#KToken(#token("Type","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortType, var__24) :: [])) -> ((Bool true) :: [])
(*{| rule ``isType(`#voidTy_OSL-SYNTAX`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'voidTy_OSL'Hyph'SYNTAX) :: [])) -> ((Bool true) :: [])
(*{| rule ``isType(#ref(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isLifetime(K0),isType(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'Hash'ref,(varK0_25 :: []),(varK1_26 :: [])) :: [])) when (((isTrue (evalisLifetime((varK0_25 :: [])) config (-1)))) && ((isTrue (evalisType((varK1_26 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isType(#own(K0))=>#token("true","Bool")`` requires isProps(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'own,(varK0_27 :: [])) :: [])) when (isTrue (evalisProps((varK0_27 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isType(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_28)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisParameter (c: k) (config: k) (guard: int) : k = let lbl = 
LblisParameter and sort = 
SortBool in match c with 
(*{| rule ``isParameter(#KToken(#token("Parameter","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortParameter, var__29) :: [])) -> ((Bool true) :: [])
(*{| rule ``isParameter(#parameter(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isId(K0),isType(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'Hash'parameter,(varK0_30 :: []),(varK1_31 :: [])) :: [])) when (((isTrue (evalisId((varK0_30 :: [])) config (-1)))) && ((isTrue (evalisType((varK1_31 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isParameter(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_32)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let rec evalisParameters (c: k) (config: k) (guard: int) : k = let lbl = 
LblisParameters and sort = 
SortBool in match c with 
(*{| rule ``isParameters(`.List{"_,__OSL-SYNTAX"}`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Stop'List'LBraQuot'_'Comm'__OSL'Hyph'SYNTAX'QuotRBra') :: [])) -> ((Bool true) :: [])
(*{| rule ``isParameters(#KToken(#token("Parameters","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortParameters, var__33) :: [])) -> ((Bool true) :: [])
(*{| rule ``isParameters(`_,__OSL-SYNTAX`(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isParameter(K0),isParameters(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl_'Comm'__OSL'Hyph'SYNTAX,(varK0_34 :: []),(varK1_35 :: [])) :: [])) when (((isTrue (evalisParameter((varK0_34 :: [])) config (-1)))) && ((isTrue (evalisParameters((varK1_35 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isParameters(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_36)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisFparamsCellOpt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisFparamsCellOpt and sort = 
SortBool in match c with 
(*{| rule ``isFparamsCellOpt(noFparamsCell(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(LblnoFparamsCell) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFparamsCellOpt(`<fparams>`(K0))=>#token("true","Bool")`` requires isParameters(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'fparams'_GT_',(varK0_37 :: [])) :: [])) when (isTrue (evalisParameters((varK0_37 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isFparamsCellOpt(#KToken(#token("FparamsCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFparamsCell, var__38) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFparamsCellOpt(#KToken(#token("FparamsCellOpt","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFparamsCellOpt, var__39) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFparamsCellOpt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_40)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisK (c: k) (config: k) (guard: int) : k = let lbl = 
LblisK and sort = 
SortBool in match c with 
| [_] -> [Bool true] | _ -> [Bool false]
| [List (s,_,_)] when (s = SortList) -> [Bool true]
| [String _] -> [Bool true]
| [Map (s,_,_)] when (s = SortFunDefCellMap) -> [Bool true]
| [Bool _] -> [Bool true]
| _ -> [Bool true]
| [Map (s,_,_)] when (s = SortMap) -> [Bool true]
| [Int _] -> [Bool true]
| [Float _] -> [Bool true]
| [Map (s,_,_)] when (s = SortStateCellMap) -> [Bool true]
| [Set (s,_,_)] when (s = SortSet) -> [Bool true]
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisFbodyCellOpt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisFbodyCellOpt and sort = 
SortBool in match c with 
(*{| rule ``isFbodyCellOpt(#KToken(#token("FbodyCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFbodyCell, var__41) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFbodyCellOpt(noFbodyCell(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(LblnoFbodyCell) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFbodyCellOpt(`<fbody>`(K0))=>#token("true","Bool")`` requires isK(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'fbody'_GT_',(varK0_42)) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isFbodyCellOpt(#KToken(#token("FbodyCellOpt","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFbodyCellOpt, var__43) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFbodyCellOpt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_44)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalnotBool_ (c: k) (config: k) (guard: int) : k = let lbl = 
LblnotBool_ and sort = 
SortBool in match c with 
| _ -> try BOOL.hook_not c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `notBool_`(#token("false","Bool"))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(dbe4d83961158619e994f90623f08be11020d80c56685ef1ec2dd2b15760c474) contentStartColumn(8) contentStartLine(300) org.kframework.attributes.Location(Location(300,8,300,29)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool false) :: [])) -> ((Bool true) :: [])
(*{| rule `` `notBool_`(#token("true","Bool"))=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(de18dba5cb1b6e56941a63279edb1d16da29d7a997a3e82cbc2b81b066eadf47) contentStartColumn(8) contentStartLine(299) org.kframework.attributes.Location(Location(299,8,299,29)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool true) :: [])) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'_LT_Eqls'Int__INT (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_LT_Eqls'Int__INT and sort = 
SortBool in match c with 
| _ -> try INT.hook_le c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalMap'Coln'lookup (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblMap'Coln'lookup and sort = 
SortKItem in match c with 
| _ -> try MAP.hook_lookup c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval'Hash'stderr_K'Hyph'IO (c: unit) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'stderr_K'Hyph'IO and sort = 
SortInt in match c with 
(*{| rule `` `#stderr_K-IO`(.KList)=>#token("2","Int")`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(11ef087f50cc8e9fe0fe6a8b028370816f2f2a3573af358ab6ca98318723d0e5) contentStartColumn(8) contentStartLine(910) org.kframework.attributes.Location(Location(910,8,910,20)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| () -> ((Lazy.force int2) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let const'Hash'stderr_K'Hyph'IO : k Lazy.t = lazy (eval'Hash'stderr_K'Hyph'IO () interned_bottom (-1))
let eval'Hash'seek'LPar'_'Comm'_'RPar'_K'Hyph'IO (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'seek'LPar'_'Comm'_'RPar'_K'Hyph'IO and sort = 
SortK in match c with 
| _ -> try IO.hook_seek c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'Hyph'Int__INT (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'Hyph'Int__INT and sort = 
SortInt in match c with 
| _ -> try INT.hook_sub c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'Perc'Int__INT (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'Perc'Int__INT and sort = 
SortInt in match c with 
| _ -> try INT.hook_tmod c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'Plus'Int_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'Plus'Int_ and sort = 
SortInt in match c with 
| _ -> try INT.hook_add c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalabsInt (c: k) (config: k) (guard: int) : k = let lbl = 
LblabsInt and sort = 
SortInt in match c with 
| _ -> try INT.hook_abs c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'EqlsEqls'K_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'EqlsEqls'K_ and sort = 
SortBool in match c with 
| _ -> try KEQUAL.hook_eq c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'EqlsEqls'Int_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'EqlsEqls'Int_ and sort = 
SortBool in match c with 
| _ -> try INT.hook_eq c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_==Int_`(I1,I2)=>`_==K_`(I1,I2)`` requires `_andBool_`(isInt(I1),isInt(I2)) ensures #token("true","Bool") [UNIQUE_ID(e92e4aa4a18bee70f2627cdafb8687e2dfcc0dd6a7f8cbb8d1bd17d751c2da2a) contentStartColumn(8) contentStartLine(407) org.kframework.attributes.Location(Location(407,8,407,40)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Int _ as varI1_45) :: []),((Int _ as varI2_46) :: [])) when ((true) && (true)) && (true) -> ((eval_'EqlsEqls'K_((varI1_45 :: []),(varI2_46 :: [])) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'EqlsSlshEqls'Int__INT (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'EqlsSlshEqls'Int__INT and sort = 
SortBool in match c with 
| _ -> try INT.hook_ne c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_=/=Int__INT`(I1,I2)=>`notBool_`(`_==Int_`(I1,I2))`` requires `_andBool_`(isInt(I1),isInt(I2)) ensures #token("true","Bool") [UNIQUE_ID(59ca895589d5fc7fa573380dac68ddd6602f6fa8b2761530a861aa894455f27e) contentStartColumn(8) contentStartLine(408) org.kframework.attributes.Location(Location(408,8,408,53)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Int _ as varI1_47) :: []),((Int _ as varI2_48) :: [])) when ((true) && (true)) && (true) -> ([Bool ((not ((isTrue (eval_'EqlsEqls'Int_((varI1_47 :: []),(varI2_48 :: [])) config (-1))))))])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_modInt__INT (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_modInt__INT and sort = 
SortInt in match c with 
| _ -> try INT.hook_emod c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_modInt__INT`(I1,I2)=>`_%Int__INT`(`_+Int_`(`_%Int__INT`(I1,absInt(I2)),absInt(I2)),absInt(I2))`` requires `_andBool_`(`_andBool_`(isInt(I1),isInt(I2)),`_=/=Int__INT`(I2,#token("0","Int"))) ensures #token("true","Bool") [UNIQUE_ID(fb4bf5b2f12862af75611e525d51d7e1966bcc322ee8456d2ed1cdaadf02f6f5) concrete() contentStartColumn(5) contentStartLine(391) org.kframework.attributes.Location(Location(391,5,394,23)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (((Int _ as varI1_49) :: []),((Int _ as varI2_50) :: [])) when ((((true) && (true))) && ((isTrue (eval_'EqlsSlshEqls'Int__INT((varI2_50 :: []),((Lazy.force int0) :: [])) config (-1))))) && (true) -> ((eval_'Perc'Int__INT(((eval_'Plus'Int_(((eval_'Perc'Int__INT((varI1_49 :: []),((evalabsInt((varI2_50 :: [])) config (-1)))) config (-1))),((evalabsInt((varI2_50 :: [])) config (-1)))) config (-1))),((evalabsInt((varI2_50 :: [])) config (-1)))) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'_GT__GT_'Int__INT (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_GT__GT_'Int__INT and sort = 
SortInt in match c with 
| _ -> try INT.hook_shr c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'_LT__LT_'Int__INT (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_LT__LT_'Int__INT and sort = 
SortInt in match c with 
| _ -> try INT.hook_shl c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalbitRangeInt (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblbitRangeInt and sort = 
SortInt in match c with 
| _ -> try INT.hook_bitRange c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule ``bitRangeInt(I,IDX,LEN)=>`_modInt__INT`(`_>>Int__INT`(I,IDX),`_<<Int__INT`(#token("1","Int"),LEN))`` requires `_andBool_`(`_andBool_`(isInt(I),isInt(LEN)),isInt(IDX)) ensures #token("true","Bool") [UNIQUE_ID(08ec18eb216a86553c22eacaaf8b628b19097a5f4dbbbbb68a5daa77c9337449) contentStartColumn(8) contentStartLine(384) org.kframework.attributes.Location(Location(384,8,384,70)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Int _ as varI_51) :: []),((Int _ as varIDX_52) :: []),((Int _ as varLEN_53) :: [])) when ((((true) && (true))) && (true)) && (true) -> ((eval_modInt__INT(((eval_'_GT__GT_'Int__INT((varI_51 :: []),(varIDX_52 :: [])) config (-1))),((eval_'_LT__LT_'Int__INT(((Lazy.force int1) :: []),(varLEN_53 :: [])) config (-1)))) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalsignExtendBitRangeInt (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblsignExtendBitRangeInt and sort = 
SortInt in match c with 
| _ -> try INT.hook_signExtendBitRange c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule ``signExtendBitRangeInt(I,IDX,LEN)=>`_-Int__INT`(`_modInt__INT`(`_+Int_`(bitRangeInt(I,IDX,LEN),`_<<Int__INT`(#token("1","Int"),`_-Int__INT`(LEN,#token("1","Int")))),`_<<Int__INT`(#token("1","Int"),LEN)),`_<<Int__INT`(#token("1","Int"),`_-Int__INT`(LEN,#token("1","Int"))))`` requires `_andBool_`(`_andBool_`(isInt(I),isInt(LEN)),isInt(IDX)) ensures #token("true","Bool") [UNIQUE_ID(b413c3f4500443aec69bee9b10feb030330d60bd136c698a9947546393728a00) contentStartColumn(8) contentStartLine(386) org.kframework.attributes.Location(Location(386,8,386,149)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Int _ as varI_54) :: []),((Int _ as varIDX_55) :: []),((Int _ as varLEN_56) :: [])) when ((((true) && (true))) && (true)) && (true) -> ((eval_'Hyph'Int__INT(((eval_modInt__INT(((eval_'Plus'Int_(((evalbitRangeInt((varI_54 :: []),(varIDX_55 :: []),(varLEN_56 :: [])) config (-1))),((eval_'_LT__LT_'Int__INT(((Lazy.force int1) :: []),((eval_'Hyph'Int__INT((varLEN_56 :: []),((Lazy.force int1) :: [])) config (-1)))) config (-1)))) config (-1))),((eval_'_LT__LT_'Int__INT(((Lazy.force int1) :: []),(varLEN_56 :: [])) config (-1)))) config (-1))),((eval_'_LT__LT_'Int__INT(((Lazy.force int1) :: []),((eval_'Hyph'Int__INT((varLEN_56 :: []),((Lazy.force int1) :: [])) config (-1)))) config (-1)))) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let eval_'EqlsEqls'Bool__BOOL (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'EqlsEqls'Bool__BOOL and sort = 
SortBool in match c with 
| _ -> try BOOL.hook_eq c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_==Bool__BOOL`(K1,K2)=>`_==K_`(K1,K2)`` requires `_andBool_`(isBool(K1),isBool(K2)) ensures #token("true","Bool") [UNIQUE_ID(a17699668426366833f88851c95d611be854ecef7a676d2061669bf689f05fd1) contentStartColumn(8) contentStartLine(765) org.kframework.attributes.Location(Location(765,8,765,43)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool _ as varK1_57) :: []),((Bool _ as varK2_58) :: [])) when ((true) && (true)) && (true) -> ((eval_'EqlsEqls'K_((varK1_57 :: []),(varK2_58 :: [])) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisSet (c: k) (config: k) (guard: int) : k = let lbl = 
LblisSet and sort = 
SortBool in match c with 
| [Set (s,_,_)] when (s = SortSet) -> [Bool true]
(*{| rule ``isSet(#KToken(#token("Set","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortSet, var__59) :: [])) -> ((Bool true) :: [])
(*{| rule ``isSet(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_60)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisTimerCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisTimerCell and sort = 
SortBool in match c with 
(*{| rule ``isTimerCell(`<timer>`(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'timer'_GT_',((Int _ as varK0_61) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isTimerCell(#KToken(#token("TimerCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortTimerCell, var__62) :: [])) -> ((Bool true) :: [])
(*{| rule ``isTimerCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_63)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'getenv (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'getenv and sort = 
SortString in match c with 
| _ -> try KREFLECTION.hook_getenv c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalintersectSet (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblintersectSet and sort = 
SortSet in match c with 
| _ -> try SET.hook_intersection c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_in_keys'LPar'_'RPar'_MAP (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_in_keys'LPar'_'RPar'_MAP and sort = 
SortBool in match c with 
| _ -> try MAP.hook_in_keys c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisIndexCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisIndexCell and sort = 
SortBool in match c with 
(*{| rule ``isIndexCell(#KToken(#token("IndexCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortIndexCell, var__64) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIndexCell(`<index>`(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'index'_GT_',((Int _ as varK0_65) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isIndexCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_66)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisKCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisKCell and sort = 
SortBool in match c with 
(*{| rule ``isKCell(`<k>`(K0))=>#token("true","Bool")`` requires isK(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'k'_GT_',(varK0_67)) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isKCell(#KToken(#token("KCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortKCell, var__68) :: [])) -> ((Bool true) :: [])
(*{| rule ``isKCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_69)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisMap (c: k) (config: k) (guard: int) : k = let lbl = 
LblisMap and sort = 
SortBool in match c with 
| [Map (s,_,_)] when (s = SortMap) -> [Bool true]
(*{| rule ``isMap(#KToken(#token("Map","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortMap, var__70) :: [])) -> ((Bool true) :: [])
(*{| rule ``isMap(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_71)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisEnvCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisEnvCell and sort = 
SortBool in match c with 
(*{| rule ``isEnvCell(`<env>`(K0))=>#token("true","Bool")`` requires isMap(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'env'_GT_',((Map (SortMap,_,_) as varK0_72) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isEnvCell(#KToken(#token("EnvCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortEnvCell, var__73) :: [])) -> ((Bool true) :: [])
(*{| rule ``isEnvCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_74)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisStoreCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisStoreCell and sort = 
SortBool in match c with 
(*{| rule ``isStoreCell(#KToken(#token("StoreCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStoreCell, var__75) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStoreCell(`<store>`(K0))=>#token("true","Bool")`` requires isMap(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'store'_GT_',((Map (SortMap,_,_) as varK0_76) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isStoreCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_77)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisList (c: k) (config: k) (guard: int) : k = let lbl = 
LblisList and sort = 
SortBool in match c with 
| [List (s,_,_)] when (s = SortList) -> [Bool true]
(*{| rule ``isList(#KToken(#token("List","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortList, var__78) :: [])) -> ((Bool true) :: [])
(*{| rule ``isList(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_79)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisStackCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisStackCell and sort = 
SortBool in match c with 
(*{| rule ``isStackCell(#KToken(#token("StackCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStackCell, var__80) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStackCell(`<stack>`(K0))=>#token("true","Bool")`` requires isList(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'stack'_GT_',((List (SortList,_,_) as varK0_81) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isStackCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_82)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisWriteCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisWriteCell and sort = 
SortBool in match c with 
(*{| rule ``isWriteCell(#KToken(#token("WriteCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortWriteCell, var__83) :: [])) -> ((Bool true) :: [])
(*{| rule ``isWriteCell(`<write>`(K0))=>#token("true","Bool")`` requires isSet(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'write'_GT_',((Set (SortSet,_,_) as varK0_84) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isWriteCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_85)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisIndexes (c: k) (config: k) (guard: int) : k = let lbl = 
LblisIndexes and sort = 
SortBool in match c with 
(*{| rule ``isIndexes(#indexes(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isInt(K0),isInt(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'Hash'indexes,((Int _ as varK0_86) :: []),((Int _ as varK1_87) :: [])) :: [])) when ((true) && (true)) && (true) -> ((Bool true) :: [])
(*{| rule ``isIndexes(#KToken(#token("Indexes","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortIndexes, var__88) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIndexes(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_89)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisIndexesCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisIndexesCell and sort = 
SortBool in match c with 
(*{| rule ``isIndexesCell(`<indexes>`(K0))=>#token("true","Bool")`` requires isIndexes(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'indexes'_GT_',(varK0_90 :: [])) :: [])) when (isTrue (evalisIndexes((varK0_90 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isIndexesCell(#KToken(#token("IndexesCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortIndexesCell, var__91) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIndexesCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_92)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisStateCellMap (c: k) (config: k) (guard: int) : k = let lbl = 
LblisStateCellMap and sort = 
SortBool in match c with 
| [Map (s,_,_)] when (s = SortStateCellMap) -> [Bool true]
(*{| rule ``isStateCellMap(#KToken(#token("StateCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStateCell, var__93) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStateCellMap(`<state>`(K0,K1,K2,K3,K4,K5,K6,K7))=>#token("true","Bool")`` requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isIndexCell(K0),isKCell(K1)),isEnvCell(K2)),isStoreCell(K3)),isStackCell(K4)),isWriteCell(K5)),isTimerCell(K6)),isIndexesCell(K7)) ensures #token("true","Bool") []|}*)
| ((KApply8(Lbl'_LT_'state'_GT_',(varK0_94 :: []),(varK1_95 :: []),(varK2_96 :: []),(varK3_97 :: []),(varK4_98 :: []),(varK5_99 :: []),(varK6_100 :: []),(varK7_101 :: [])) :: [])) when (((((((((((((((isTrue (evalisIndexCell((varK0_94 :: [])) config (-1)))) && ((isTrue (evalisKCell((varK1_95 :: [])) config (-1)))))) && ((isTrue (evalisEnvCell((varK2_96 :: [])) config (-1)))))) && ((isTrue (evalisStoreCell((varK3_97 :: [])) config (-1)))))) && ((isTrue (evalisStackCell((varK4_98 :: [])) config (-1)))))) && ((isTrue (evalisWriteCell((varK5_99 :: [])) config (-1)))))) && ((isTrue (evalisTimerCell((varK6_100 :: [])) config (-1)))))) && ((isTrue (evalisIndexesCell((varK7_101 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isStateCellMap(#KToken(#token("StateCellMap","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStateCellMap, var__102) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStateCellMap(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_103)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisStatesCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisStatesCell and sort = 
SortBool in match c with 
(*{| rule ``isStatesCell(#KToken(#token("StatesCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStatesCell, var__104) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStatesCell(`<states>`(K0))=>#token("true","Bool")`` requires isStateCellMap(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'states'_GT_',((Map (SortStateCellMap,_,_) as varK0_105) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isStatesCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_106)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisString (c: k) (config: k) (guard: int) : k = let lbl = 
LblisString and sort = 
SortBool in match c with 
| [String _] -> [Bool true]
(*{| rule ``isString(#KToken(#token("String","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortString, var__107) :: [])) -> ((Bool true) :: [])
(*{| rule ``isString(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_108)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'if_'Hash'then_'Hash'else_'Hash'fi_K'Hyph'EQUAL (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'if_'Hash'then_'Hash'else_'Hash'fi_K'Hyph'EQUAL and sort = 
SortK in match c with 
| _ -> try KEQUAL.hook_ite c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `#if_#then_#else_#fi_K-EQUAL`(C,B1,_11)=>B1`` requires `_andBool_`(isBool(C),C) ensures #token("true","Bool") [UNIQUE_ID(0883a4d4051090478d6b8a7ac8d4e0e15e7708308fa24e63137b9ac7e87383aa) contentStartColumn(8) contentStartLine(769) org.kframework.attributes.Location(Location(769,8,769,56)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (((Bool _ as varC_109) :: []),(varB1_110),(var_11_111)) when ((true) && ((isTrue [varC_109]))) && (true) -> (varB1_110)
(*{| rule `` `#if_#then_#else_#fi_K-EQUAL`(C,_10,B2)=>B2`` requires `_andBool_`(isBool(C),`notBool_`(C)) ensures #token("true","Bool") [UNIQUE_ID(d46b5ae094d17de19ef9725da497c32e21813c6e4b5a0d6a2c4b03bd55bb312c) contentStartColumn(8) contentStartLine(770) org.kframework.attributes.Location(Location(770,8,770,64)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (((Bool _ as varC_112) :: []),(var_10_113),(varB2_114)) when ((true) && ((not ((isTrue [varC_112]))))) && (true) -> (varB2_114)
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalfindString (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblfindString and sort = 
SortInt in match c with 
| _ -> try STRING.hook_find c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalsubstrString (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblsubstrString and sort = 
SortString in match c with 
| _ -> try STRING.hook_substr c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evallengthString (c: k) (config: k) (guard: int) : k = let lbl = 
LbllengthString and sort = 
SortInt in match c with 
| _ -> try STRING.hook_length c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'_GT_Eqls'Int__INT (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_GT_Eqls'Int__INT and sort = 
SortBool in match c with 
| _ -> try INT.hook_ge c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalminInt'LPar'_'Comm'_'RPar'_INT (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblminInt'LPar'_'Comm'_'RPar'_INT and sort = 
SortInt in match c with 
| _ -> try INT.hook_min c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `minInt(_,_)_INT`(I1,I2)=>I2`` requires `_andBool_`(`_andBool_`(isInt(I1),isInt(I2)),`_>=Int__INT`(I1,I2)) ensures #token("true","Bool") [UNIQUE_ID(f93c59dd0bdb46ab467898db4ad231d94d30e5b88427054becac14f3969eff8e) contentStartColumn(8) contentStartLine(397) org.kframework.attributes.Location(Location(397,8,397,57)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (((Int _ as varI1_115) :: []),((Int _ as varI2_116) :: [])) when ((((true) && (true))) && ((isTrue (eval_'_GT_Eqls'Int__INT((varI1_115 :: []),(varI2_116 :: [])) config (-1))))) && (true) -> (varI2_116 :: [])
(*{| rule `` `minInt(_,_)_INT`(I1,I2)=>I1`` requires `_andBool_`(`_andBool_`(isInt(I1),isInt(I2)),`_<=Int__INT`(I1,I2)) ensures #token("true","Bool") [UNIQUE_ID(c3daf36ef673ae6ce68430bc5170ec91b3d397f5f3e34aee375a841739bcfc9b) contentStartColumn(8) contentStartLine(396) org.kframework.attributes.Location(Location(396,8,396,57)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (((Int _ as varI1_117) :: []),((Int _ as varI2_118) :: [])) when ((((true) && (true))) && ((isTrue (eval_'_LT_Eqls'Int__INT((varI1_117 :: []),(varI2_118 :: [])) config (-1))))) && (true) -> (varI1_117 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'EqlsEqls'String__STRING (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'EqlsEqls'String__STRING and sort = 
SortBool in match c with 
| _ -> try STRING.hook_eq c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_==String__STRING`(S1,S2)=>`_==K_`(S1,S2)`` requires `_andBool_`(isString(S2),isString(S1)) ensures #token("true","Bool") [UNIQUE_ID(daddd877c886e178648c9a2a7a5b307a0f59225ac211c099829b467bb5ebf98d) contentStartColumn(8) contentStartLine(537) org.kframework.attributes.Location(Location(537,8,537,49)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((String _ as varS1_119) :: []),((String _ as varS2_120) :: [])) when ((true) && (true)) && (true) -> ((eval_'EqlsEqls'K_((varS1_119 :: []),(varS2_120 :: [])) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'EqlsSlshEqls'String__STRING (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'EqlsSlshEqls'String__STRING and sort = 
SortBool in match c with 
| _ -> try STRING.hook_ne c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_=/=String__STRING`(S1,S2)=>`notBool_`(`_==String__STRING`(S1,S2))`` requires `_andBool_`(isString(S2),isString(S1)) ensures #token("true","Bool") [UNIQUE_ID(2a5c8974455ca9cde473273aeca1a4fa8072aa68d104bc94daa71ee7bf52c8a4) contentStartColumn(8) contentStartLine(536) org.kframework.attributes.Location(Location(536,8,536,65)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((String _ as varS1_121) :: []),((String _ as varS2_122) :: [])) when ((true) && (true)) && (true) -> ([Bool ((not ((isTrue (eval_'EqlsEqls'String__STRING((varS1_121 :: []),(varS2_122 :: [])) config (-1))))))])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let rec evalfindChar (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblfindChar and sort = 
SortInt in match c with 
| _ -> try STRING.hook_findChar c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule ``findChar(_12,#token("\"\"","String"),_13)=>#token("-1","Int")`` requires `_andBool_`(isInt(_13),isString(_12)) ensures #token("true","Bool") [UNIQUE_ID(3c92cdc7bbe8b210d199a92b38a24538ca780f801572b653c3cb72d6d89a2adf) contentStartColumn(8) contentStartLine(554) org.kframework.attributes.Location(Location(554,8,554,32)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((String _ as var_12_123) :: []),((String "") :: []),((Int _ as var_13_124) :: [])) when ((true) && (true)) && (true) -> ((Lazy.force int'Hyph'1) :: [])
(*{| rule ``findChar(S1,S2,I)=>`#if_#then_#else_#fi_K-EQUAL`(`_==Int_`(findString(S1,substrString(S2,#token("0","Int"),#token("1","Int")),I),#token("-1","Int")),findChar(S1,substrString(S2,#token("1","Int"),lengthString(S2)),I),`#if_#then_#else_#fi_K-EQUAL`(`_==Int_`(findChar(S1,substrString(S2,#token("1","Int"),lengthString(S2)),I),#token("-1","Int")),findString(S1,substrString(S2,#token("0","Int"),#token("1","Int")),I),`minInt(_,_)_INT`(findString(S1,substrString(S2,#token("0","Int"),#token("1","Int")),I),findChar(S1,substrString(S2,#token("1","Int"),lengthString(S2)),I))))`` requires `_andBool_`(`_andBool_`(`_andBool_`(isInt(I),isString(S2)),isString(S1)),`_=/=String__STRING`(S2,#token("\"\"","String"))) ensures #token("true","Bool") [UNIQUE_ID(5a89a8f3b78438530e84da3913f33203b224f3c348d32f09785edd80c9cfe137) contentStartColumn(8) contentStartLine(553) org.kframework.attributes.Location(Location(553,8,553,431)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (((String _ as varS1_125) :: []),((String _ as varS2_126) :: []),((Int _ as varI_127) :: [])) when ((((((true) && (true))) && (true))) && ((isTrue (eval_'EqlsSlshEqls'String__STRING((varS2_126 :: []),((String "") :: [])) config (-1))))) && (true) -> ((if ((isTrue (eval_'EqlsEqls'Int_(((evalfindString((varS1_125 :: []),((evalsubstrString((varS2_126 :: []),((Lazy.force int0) :: []),((Lazy.force int1) :: [])) config (-1))),(varI_127 :: [])) config (-1))),((Lazy.force int'Hyph'1) :: [])) config (-1)))) then (((evalfindChar((varS1_125 :: []),((evalsubstrString((varS2_126 :: []),((Lazy.force int1) :: []),((evallengthString((varS2_126 :: [])) config (-1)))) config (-1))),(varI_127 :: [])) config (-1)))) else (((if ((isTrue (eval_'EqlsEqls'Int_(((evalfindChar((varS1_125 :: []),((evalsubstrString((varS2_126 :: []),((Lazy.force int1) :: []),((evallengthString((varS2_126 :: [])) config (-1)))) config (-1))),(varI_127 :: [])) config (-1))),((Lazy.force int'Hyph'1) :: [])) config (-1)))) then (((evalfindString((varS1_125 :: []),((evalsubstrString((varS2_126 :: []),((Lazy.force int0) :: []),((Lazy.force int1) :: [])) config (-1))),(varI_127 :: [])) config (-1)))) else (((evalminInt'LPar'_'Comm'_'RPar'_INT(((evalfindString((varS1_125 :: []),((evalsubstrString((varS2_126 :: []),((Lazy.force int0) :: []),((Lazy.force int1) :: [])) config (-1))),(varI_127 :: [])) config (-1))),((evalfindChar((varS1_125 :: []),((evalsubstrString((varS2_126 :: []),((Lazy.force int1) :: []),((evallengthString((varS2_126 :: [])) config (-1)))) config (-1))),(varI_127 :: [])) config (-1)))) config (-1)))))))))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalinitNstateCell (c: unit) (config: k) (guard: int) : k = let lbl = 
LblinitNstateCell and sort = 
SortNstateCell in match c with 
(*{| rule ``initNstateCell(.KList)=>`<nstate>`(#token("1","Int"))`` requires isInt(#token("1","Int")) ensures #token("true","Bool") [UNIQUE_ID(b639d9a907880bf37d6bbd004a2156354c61b268954d5fb2699478df1d2c7b9a) initializer()]|}*)
| () when (isTrue (evalisInt(((Lazy.force int1) :: [])) config (-1))) && (true) -> (KApply1(Lbl'_LT_'nstate'_GT_',((Lazy.force int1) :: [])) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let constinitNstateCell : k Lazy.t = lazy (evalinitNstateCell () interned_bottom (-1))
let evalSet'Coln'in (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblSet'Coln'in and sort = 
SortBool in match c with 
| _ -> try SET.hook_in c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalString2Int (c: k) (config: k) (guard: int) : k = let lbl = 
LblString2Int and sort = 
SortInt in match c with 
| _ -> try STRING.hook_string2int c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalinitFparamsCell (c: unit) (config: k) (guard: int) : k = let lbl = 
LblinitFparamsCell and sort = 
SortFparamsCell in match c with 
(*{| rule ``initFparamsCell(.KList)=>`<fparams>`(`.List{"_,__OSL-SYNTAX"}`(.KList))`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(2e8b30285f0ab90a1929412428a257beea1df5cfa8e8d1aaf03a073896c7a7e2) initializer()]|}*)
| () -> (KApply1(Lbl'_LT_'fparams'_GT_',(const'Stop'List'LBraQuot'_'Comm'__OSL'Hyph'SYNTAX'QuotRBra' :: [])) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let constinitFparamsCell : k Lazy.t = lazy (evalinitFparamsCell () interned_bottom (-1))
let eval_'_LT_Eqls'Set__SET (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_LT_Eqls'Set__SET and sort = 
SortBool in match c with 
| _ -> try SET.hook_inclusion c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisIOError (c: k) (config: k) (guard: int) : k = let lbl = 
LblisIOError and sort = 
SortBool in match c with 
(*{| rule ``isIOError(`#ECONNREFUSED_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ECONNREFUSED_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EPIPE_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPIPE_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ETOOMANYREFS_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ETOOMANYREFS_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ENETUNREACH_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENETUNREACH_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EBUSY_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EBUSY_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EHOSTDOWN_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EHOSTDOWN_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ENOTEMPTY_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTEMPTY_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EFBIG_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EFBIG_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#E2BIG_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'E2BIG_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ENOLCK_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOLCK_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EROFS_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EROFS_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EISCONN_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EISCONN_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ESRCH_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ESRCH_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EINPROGRESS_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EINPROGRESS_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ERANGE_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ERANGE_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#KToken(#token("IOError","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortIOError, var__128) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ENOBUFS_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOBUFS_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ENOSPC_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOSPC_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EADDRINUSE_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EADDRINUSE_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EAFNOSUPPORT_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EAFNOSUPPORT_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EDOM_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EDOM_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EIO_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EIO_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EOPNOTSUPP_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EOPNOTSUPP_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ENAMETOOLONG_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENAMETOOLONG_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EPERM_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPERM_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EPROTONOSUPPORT_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPROTONOSUPPORT_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EMLINK_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EMLINK_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ENOENT_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOENT_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ENOMEM_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOMEM_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ECONNRESET_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ECONNRESET_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EWOULDBLOCK_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EWOULDBLOCK_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ENOEXEC_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOEXEC_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ECONNABORTED_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ECONNABORTED_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ENOSYS_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOSYS_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EHOSTUNREACH_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EHOSTUNREACH_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EEXIST_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EEXIST_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(#unknownIOError(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'unknownIOError,((Int _ as varK0_129) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EDESTADDRREQ_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EDESTADDRREQ_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EBADF_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EBADF_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EXDEV_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EXDEV_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ENOTCONN_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTCONN_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ENFILE_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENFILE_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ENODEV_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENODEV_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ENXIO_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENXIO_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ENETRESET_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENETRESET_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EPFNOSUPPORT_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPFNOSUPPORT_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EISDIR_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EISDIR_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ETIMEDOUT_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ETIMEDOUT_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EINVAL_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EINVAL_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EAGAIN_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EAGAIN_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ESPIPE_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ESPIPE_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EMFILE_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EMFILE_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EFAULT_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EFAULT_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ENETDOWN_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENETDOWN_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EOVERFLOW_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EOVERFLOW_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EACCES_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EACCES_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EOF_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EOF_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EDEADLK_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EDEADLK_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ENOTSOCK_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTSOCK_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ECHILD_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ECHILD_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EPROTOTYPE_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EPROTOTYPE_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ENOPROTOOPT_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOPROTOOPT_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EINTR_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EINTR_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ELOOP_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ELOOP_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ESHUTDOWN_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ESHUTDOWN_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EMSGSIZE_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EMSGSIZE_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ENOTDIR_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTDIR_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EALREADY_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EALREADY_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ENOTTY_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ENOTTY_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#ESOCKTNOSUPPORT_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'ESOCKTNOSUPPORT_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#EADDRNOTAVAIL_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'EADDRNOTAVAIL_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(`#noparse_K-IO`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'noparse_K'Hyph'IO) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIOError(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_130)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'parse (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'parse and sort = 
SortKItem in match c with 
| _ -> try IO.hook_parse c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalmakeList (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblmakeList and sort = 
SortList in match c with 
| _ -> try LIST.hook_make c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisSeparator (c: k) (config: k) (guard: int) : k = let lbl = 
LblisSeparator and sort = 
SortBool in match c with 
(*{| rule ``isSeparator(#KToken(#token("Separator","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortSeparator, var__131) :: [])) -> ((Bool true) :: [])
(*{| rule ``isSeparator(#loopSep(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'loopSep,((Int _ as varK0_132) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isSeparator(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_133)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'LSqB'_'_LT_Hyph'undef'RSqB' (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'LSqB'_'_LT_Hyph'undef'RSqB' and sort = 
SortMap in match c with 
| _ -> try MAP.hook_remove c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalinitIndexesCell (c: unit) (config: k) (guard: int) : k = let lbl = 
LblinitIndexesCell and sort = 
SortIndexesCell in match c with 
(*{| rule ``initIndexesCell(.KList)=>`<indexes>`(#indexes(#token("0","Int"),#token("0","Int")))`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(2a981c24e3bb07c8209ecde526aa94fef1a5617bc52520d9da32abad073aac6c) initializer()]|}*)
| () -> (KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,((Lazy.force int0) :: []),((Lazy.force int0) :: [])) :: [])) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let constinitIndexesCell : k Lazy.t = lazy (evalinitIndexesCell () interned_bottom (-1))
let evalinitFbodyCell (c: unit) (config: k) (guard: int) : k = let lbl = 
LblinitFbodyCell and sort = 
SortFbodyCell in match c with 
(*{| rule ``initFbodyCell(.KList)=>`<fbody>`(.K)`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(1f06a6f24a70654cedcde13edbf88d19c1cbc023b5215cc6d32d89f743fb960d) initializer()]|}*)
| () -> (KApply1(Lbl'_LT_'fbody'_GT_',([])) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let constinitFbodyCell : k Lazy.t = lazy (evalinitFbodyCell () interned_bottom (-1))
let evalisFnameCellOpt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisFnameCellOpt and sort = 
SortBool in match c with 
(*{| rule ``isFnameCellOpt(#KToken(#token("FnameCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFnameCell, var__134) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFnameCellOpt(noFnameCell(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(LblnoFnameCell) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFnameCellOpt(#KToken(#token("FnameCellOpt","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFnameCellOpt, var__135) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFnameCellOpt(`<fname>`(K0))=>#token("true","Bool")`` requires isK(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'fname'_GT_',(varK0_136)) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isFnameCellOpt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_137)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisFretCellOpt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisFretCellOpt and sort = 
SortBool in match c with 
(*{| rule ``isFretCellOpt(noFretCell(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(LblnoFretCell) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFretCellOpt(`<fret>`(K0))=>#token("true","Bool")`` requires isK(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'fret'_GT_',(varK0_138)) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isFretCellOpt(#KToken(#token("FretCellOpt","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFretCellOpt, var__139) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFretCellOpt(#KToken(#token("FretCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFretCell, var__140) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFretCellOpt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_141)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisFunDefCellFragment (c: k) (config: k) (guard: int) : k = let lbl = 
LblisFunDefCellFragment and sort = 
SortBool in match c with 
(*{| rule ``isFunDefCellFragment(#KToken(#token("FunDefCellFragment","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFunDefCellFragment, var__142) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFunDefCellFragment(`<funDef>-fragment`(K0,K1,K2,K3))=>#token("true","Bool")`` requires `_andBool_`(`_andBool_`(`_andBool_`(isFnameCellOpt(K0),isFparamsCellOpt(K1)),isFretCellOpt(K2)),isFbodyCellOpt(K3)) ensures #token("true","Bool") []|}*)
| ((KApply4(Lbl'_LT_'funDef'_GT_Hyph'fragment,(varK0_143 :: []),(varK1_144 :: []),(varK2_145 :: []),(varK3_146 :: [])) :: [])) when (((((((isTrue (evalisFnameCellOpt((varK0_143 :: [])) config (-1)))) && ((isTrue (evalisFparamsCellOpt((varK1_144 :: [])) config (-1)))))) && ((isTrue (evalisFretCellOpt((varK2_145 :: [])) config (-1)))))) && ((isTrue (evalisFbodyCellOpt((varK3_146 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isFunDefCellFragment(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_147)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'unlock'LPar'_'Comm'_'RPar'_K'Hyph'IO (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'unlock'LPar'_'Comm'_'RPar'_K'Hyph'IO and sort = 
SortK in match c with 
| _ -> try IO.hook_unlock c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_andThenBool__BOOL (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_andThenBool__BOOL and sort = 
SortBool in match c with 
| _ -> try BOOL.hook_andThen c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_andThenBool__BOOL`(_1,#token("false","Bool"))=>#token("false","Bool")`` requires isBool(_1) ensures #token("true","Bool") [UNIQUE_ID(d0a6502b90e84545c10a45f7199b2a6d77f52d0841c63dcc792b60073f300e07) contentStartColumn(8) contentStartLine(310) org.kframework.attributes.Location(Location(310,8,310,36)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool _ as var_1_148) :: []),((Bool false) :: [])) when true && (true) -> ((Bool false) :: [])
(*{| rule `` `_andThenBool__BOOL`(#token("true","Bool"),K)=>K`` requires isBool(K) ensures #token("true","Bool") [UNIQUE_ID(b058439c1adf0de5fb7afd07d638d2cda247a4344cbdc14812da46c5db5499df) contentStartColumn(8) contentStartLine(307) org.kframework.attributes.Location(Location(307,8,307,37)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool true) :: []),((Bool _ as varK_149) :: [])) when true && (true) -> (varK_149 :: [])
(*{| rule `` `_andThenBool__BOOL`(#token("false","Bool"),_5)=>#token("false","Bool")`` requires isBool(_5) ensures #token("true","Bool") [UNIQUE_ID(34b51d1bff350ce2cd8b17b3af8effdfcf390962b57189087f3cc3b6bbe59cbc) contentStartColumn(8) contentStartLine(309) org.kframework.attributes.Location(Location(309,8,309,36)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool false) :: []),((Bool _ as var_5_150) :: [])) when true && (true) -> ((Bool false) :: [])
(*{| rule `` `_andThenBool__BOOL`(K,#token("true","Bool"))=>K`` requires isBool(K) ensures #token("true","Bool") [UNIQUE_ID(1aad8125a2ba7fcbd3c40ac487b7dc776993e9d167ac20f0210e14213abec45f) contentStartColumn(8) contentStartLine(308) org.kframework.attributes.Location(Location(308,8,308,37)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool _ as varK_151) :: []),((Bool true) :: [])) when true && (true) -> (varK_151 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalSet'Coln'difference (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblSet'Coln'difference and sort = 
SortSet in match c with 
| _ -> try SET.hook_difference c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalSetItem (c: k) (config: k) (guard: int) : k = let lbl = 
LblSetItem and sort = 
SortSet in match c with 
| _ -> try SET.hook_element c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Stop'Set (c: unit) (config: k) (guard: int) : k = let lbl = 
Lbl'Stop'Set and sort = 
SortSet in match c with 
| _ -> try SET.hook_unit c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let const'Stop'Set : k Lazy.t = lazy (eval'Stop'Set () interned_bottom (-1))
let rec eval'Hash'writeCK (c: k * k * k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'writeCK and sort = 
SortBool in match c with 
| (((Int _ as var_0_152) :: []),((Int _ as var_1_153) :: []),((Int _ as var_2_154) :: []),(var_3_155)) when guard < 0(*{| rule ``#writeCK(L,B,E,_0)=>#token("false","Bool")`` requires `_andBool_`(`_andBool_`(#setChoice(#writev(L,T),_0),#match(RestS,`Set:difference`(_0,`SetItem`(#writev(L,T))))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(B),isInt(T)),isInt(E)),isSet(RestS)),isInt(L)),`_andBool_`(`_<=Int__INT`(B,T),`_<=Int__INT`(T,E)))) ensures #token("true","Bool") [UNIQUE_ID(9b2ac40d3e72d229296772060ce9bc02d42a0c44390764790e8f75fe8d907226) contentStartColumn(6) contentStartLine(190) org.kframework.attributes.Location(Location(190,6,191,47)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
 -> (match (var_3_155) with 
| [Set (_,_,collection)] -> let choice = (KSet.fold (fun e result -> if result == interned_bottom then (match e with | (KApply2(Lbl'Hash'writev,((Int _ as var_0_156) :: []),((Int _ as var_4_157) :: [])) :: []) as e0 -> (let e = ((evalSet'Coln'difference((var_3_155),((evalSetItem(e0) config (-1)))) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| ((Set (SortSet,_,_) as var_5_158) :: []) when ((((true) && (true))) && (((((((((((true) && (true))) && (true))) && (true))) && (true))) && ((((isTrue (eval_'_LT_Eqls'Int__INT((var_1_153 :: []),(var_4_157 :: [])) config (-1)))) && ((isTrue (eval_'_LT_Eqls'Int__INT((var_4_157 :: []),(var_2_154 :: [])) config (-1))))))))) && (((compare_kitem var_0_152 var_0_156) = 0) && true) -> ((Bool false) :: [])| _ -> interned_bottom)| _ -> interned_bottom) else result) collection interned_bottom) in if choice == interned_bottom then (eval'Hash'writeCK c config 0) else choice| _ -> (eval'Hash'writeCK c config 0))
| (((Int _ as var_0_159) :: []),((Int _ as var_1_160) :: []),((Int _ as var_2_161) :: []),(var_3_162)) when guard < 1(*{| rule ``#writeCK(L,B,E,_0)=>#writeCK(L,B,E,RestS)`` requires `_andBool_`(`_andBool_`(#setChoice(#writev(L,T),_0),#match(RestS,`Set:difference`(_0,`SetItem`(#writev(L,T))))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(B),isInt(T)),isInt(E)),isSet(RestS)),isInt(L)),`notBool_`(`_andBool_`(`_<=Int__INT`(B,T),`_<=Int__INT`(T,E))))) ensures #token("true","Bool") [UNIQUE_ID(8f9fa1f03c3395007f040281eacc6f05f64fe3f108328a61a426e71a6725b3ac) contentStartColumn(6) contentStartLine(197) org.kframework.attributes.Location(Location(197,6,198,56)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
 -> (match (var_3_162) with 
| [Set (_,_,collection)] -> let choice = (KSet.fold (fun e result -> if result == interned_bottom then (match e with | (KApply2(Lbl'Hash'writev,((Int _ as var_0_163) :: []),((Int _ as var_5_164) :: [])) :: []) as e1 -> (let e = ((evalSet'Coln'difference((var_3_162),((evalSetItem(e1) config (-1)))) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| ((Set (SortSet,_,_) as var_4_165) :: []) when ((((true) && (true))) && (((((((((((true) && (true))) && (true))) && (true))) && (true))) && ((not ((((isTrue (eval_'_LT_Eqls'Int__INT((var_1_160 :: []),(var_5_164 :: [])) config (-1)))) && ((isTrue (eval_'_LT_Eqls'Int__INT((var_5_164 :: []),(var_2_161 :: [])) config (-1))))))))))) && (((compare_kitem var_0_159 var_0_163) = 0) && true) -> ((eval'Hash'writeCK((var_0_159 :: []),(var_1_160 :: []),(var_2_161 :: []),(var_4_165 :: [])) config (-1)))| _ -> interned_bottom)| _ -> interned_bottom) else result) collection interned_bottom) in if choice == interned_bottom then (eval'Hash'writeCK c config 1) else choice| _ -> (eval'Hash'writeCK c config 1))
(*{| rule ``#writeCK(_79,_80,_81,_0)=>#token("true","Bool")`` requires `_andBool_`(`_==K_`(`.Set`(.KList),_0),`_andBool_`(`_andBool_`(isInt(_81),isInt(_79)),isInt(_80))) ensures #token("true","Bool") [UNIQUE_ID(044edcb2140a98a6bbddeb19f4c97232f8e1f061534f7dc247b944e34cf087e8) contentStartColumn(6) contentStartLine(200) org.kframework.attributes.Location(Location(200,6,200,34)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Int _ as var_79_166) :: []),((Int _ as var_80_167) :: []),((Int _ as var_81_168) :: []),(var_0_169)) when (((isTrue (eval_'EqlsEqls'K_(((Lazy.force const'Stop'Set)),(var_0_169)) config (-1)))) && (((((true) && (true))) && (true)))) && (true) -> ((Bool true) :: [])
| (((Int _ as var_0_170) :: []),((Int _ as var_1_171) :: []),((Int _ as var_2_172) :: []),(var_3_173)) when guard < 3(*{| rule ``#writeCK(L,B,E,_0)=>#writeCK(L,B,E,RestS)`` requires `_andBool_`(`_andBool_`(#setChoice(#writev(L1,T),_0),#match(RestS,`Set:difference`(_0,`SetItem`(#writev(L1,T))))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(B),isInt(T)),isInt(E)),isSet(RestS)),isInt(L)),isInt(L1)),`_=/=Int__INT`(L,L1))) ensures #token("true","Bool") [UNIQUE_ID(f218c1a0a668d947c113a883ef03cc308aed632b82234bd7c155505d8cacd994) contentStartColumn(6) contentStartLine(193) org.kframework.attributes.Location(Location(193,6,194,26)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
 -> (match (var_3_173) with 
| [Set (_,_,collection)] -> let choice = (KSet.fold (fun e result -> if result == interned_bottom then (match e with | (KApply2(Lbl'Hash'writev,((Int _ as var_5_174) :: []),((Int _ as var_6_175) :: [])) :: []) as e2 -> (let e = ((evalSet'Coln'difference((var_3_173),((evalSetItem(e2) config (-1)))) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| ((Set (SortSet,_,_) as var_4_176) :: []) when ((((true) && (true))) && (((((((((((((true) && (true))) && (true))) && (true))) && (true))) && (true))) && ((isTrue (eval_'EqlsSlshEqls'Int__INT((var_0_170 :: []),(var_5_174 :: [])) config (-1))))))) && (true) -> ((eval'Hash'writeCK((var_0_170 :: []),(var_1_171 :: []),(var_2_172 :: []),(var_4_176 :: [])) config (-1)))| _ -> interned_bottom)| _ -> interned_bottom) else result) collection interned_bottom) in if choice == interned_bottom then (eval'Hash'writeCK c config 3) else choice| _ -> (eval'Hash'writeCK c config 3))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize4 c)))])
let eval'Hash'parseInModule (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'parseInModule and sort = 
SortKItem in match c with 
| _ -> try IO.hook_parseInModule c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalisBlockItem (c: k) (config: k) (guard: int) : k = let lbl = 
LblisBlockItem and sort = 
SortBool in match c with 
(*{| rule ``isBlockItem(`#blockend_BLOCK`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'blockend_BLOCK) :: [])) -> ((Bool true) :: [])
(*{| rule ``isBlockItem(#KToken(#token("BlockItem","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortBlockItem, var__177) :: [])) -> ((Bool true) :: [])
(*{| rule ``isBlockItem(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_178)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'system (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'system and sort = 
SortKItem in match c with 
| _ -> try IO.hook_system c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_StateCellMap_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_StateCellMap_ and sort = 
SortStateCellMap in match c with 
| _ -> try MAP.hook_concat c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisTmpCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisTmpCell and sort = 
SortBool in match c with 
(*{| rule ``isTmpCell(#KToken(#token("TmpCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortTmpCell, var__179) :: [])) -> ((Bool true) :: [])
(*{| rule ``isTmpCell(`<tmp>`(K0))=>#token("true","Bool")`` requires isList(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'tmp'_GT_',((List (SortList,_,_) as varK0_180) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isTmpCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_181)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let rec evalisValue (c: k) (config: k) (guard: int) : k = let lbl = 
LblisValue and sort = 
SortBool in match c with 
(*{| rule ``isValue(#Loc(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isValue(K0),isInt(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'Hash'Loc,(varK0_182 :: []),((Int _ as varK1_183) :: [])) :: [])) when (((isTrue (evalisValue((varK0_182 :: [])) config (-1)))) && (true)) && (true) -> ((Bool true) :: [])
(*{| rule ``isValue(#rs(K0))=>#token("true","Bool")`` requires isProps(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'rs,(varK0_184 :: [])) :: [])) when (isTrue (evalisProps((varK0_184 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isValue(#immRef(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'immRef,((Int _ as varK0_185) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isValue(#KToken(#token("Value","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortValue, var__186) :: [])) -> ((Bool true) :: [])
(*{| rule ``isValue(#loc(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'loc,((Int _ as varK0_187) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isValue(#mutRef(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'mutRef,((Int _ as varK0_188) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isValue(`#void_OSL-SYNTAX`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'void_OSL'Hyph'SYNTAX) :: [])) -> ((Bool true) :: [])
(*{| rule ``isValue(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_189)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let rec evalisExps (c: k) (config: k) (guard: int) : k = let lbl = 
LblisExps and sort = 
SortBool in match c with 
(*{| rule ``isExps(#KToken(#token("Exps","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortExps, var__190) :: [])) -> ((Bool true) :: [])
(*{| rule ``isExps(`.List{"_,__OSL-SYNTAX"}`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Stop'List'LBraQuot'_'Comm'__OSL'Hyph'SYNTAX'QuotRBra') :: [])) -> ((Bool true) :: [])
(*{| rule ``isExps(`_,__OSL-SYNTAX`(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isExp(K0),isExps(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl_'Comm'__OSL'Hyph'SYNTAX,(varK0_191 :: []),(varK1_192 :: [])) :: [])) when (((isTrue (evalisExp((varK0_191 :: [])) config (-1)))) && ((isTrue (evalisExps((varK1_192 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isExps(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_193)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
and evalisExp (c: k) (config: k) (guard: int) : k = let lbl = 
LblisExp and sort = 
SortBool in match c with 
(*{| rule ``isExp(`_.__OSL-SYNTAX`(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isExp(K0),isInt(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl_'Stop'__OSL'Hyph'SYNTAX,(varK0_194 :: []),((Int _ as varK1_195) :: [])) :: [])) when (((isTrue (evalisExp((varK0_194 :: [])) config (-1)))) && (true)) && (true) -> ((Bool true) :: [])
(*{| rule ``isExp(`#void_OSL-SYNTAX`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'void_OSL'Hyph'SYNTAX) :: [])) -> ((Bool true) :: [])
(*{| rule ``isExp(#immRef(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'immRef,((Int _ as varK0_196) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isExp(`*__OSL-SYNTAX`(K0))=>#token("true","Bool")`` requires isExp(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Star'__OSL'Hyph'SYNTAX,(varK0_197 :: [])) :: [])) when (isTrue (evalisExp((varK0_197 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isExp(#KToken(#token("Exp","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortExp, var__198) :: [])) -> ((Bool true) :: [])
(*{| rule ``isExp(#TransferMB(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isK(K0),isK(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'Hash'TransferMB,(varK0_199),(varK1_200)) :: [])) when ((true) && (true)) && (true) -> ((Bool true) :: [])
(*{| rule ``isExp(#Transferuninit(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isK(K0),isExp(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'Hash'Transferuninit,(varK0_201),(varK1_202 :: [])) :: [])) when ((true) && ((isTrue (evalisExp((varK1_202 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isExp(#KToken(#token("Value","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortValue, var__203) :: [])) -> ((Bool true) :: [])
(*{| rule ``isExp(#FnCall(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isId(K0),isExps(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'Hash'FnCall,(varK0_204 :: []),(varK1_205 :: [])) :: [])) when (((isTrue (evalisId((varK0_204 :: [])) config (-1)))) && ((isTrue (evalisExps((varK1_205 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isExp(#lv(K0))=>#token("true","Bool")`` requires isExp(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'lv,(varK0_206 :: [])) :: [])) when (isTrue (evalisExp((varK0_206 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isExp(#rs(K0))=>#token("true","Bool")`` requires isProps(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'rs,(varK0_207 :: [])) :: [])) when (isTrue (evalisProps((varK0_207 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isExp(#mutRef(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'mutRef,((Int _ as varK0_208) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isExp(#Transfer(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isK(K0),isExp(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'Hash'Transfer,(varK0_209),(varK1_210 :: [])) :: [])) when ((true) && ((isTrue (evalisExp((varK1_210 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isExp(#uninitialize(K0))=>#token("true","Bool")`` requires isExp(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'uninitialize,(varK0_211 :: [])) :: [])) when (isTrue (evalisExp((varK0_211 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isExp(#read(K0))=>#token("true","Bool")`` requires isExp(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'read,(varK0_212 :: [])) :: [])) when (isTrue (evalisExp((varK0_212 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isExp(`newResource(_)_OSL-SYNTAX`(K0))=>#token("true","Bool")`` requires isProps(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(LblnewResource'LPar'_'RPar'_OSL'Hyph'SYNTAX,(varK0_213 :: [])) :: [])) when (isTrue (evalisProps((varK0_213 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isExp(#Loc(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isValue(K0),isInt(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'Hash'Loc,(varK0_214 :: []),((Int _ as varK1_215) :: [])) :: [])) when (((isTrue (evalisValue((varK0_214 :: [])) config (-1)))) && (true)) && (true) -> ((Bool true) :: [])
(*{| rule ``isExp(#TransferV(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isK(K0),isExp(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'Hash'TransferV,(varK0_216),(varK1_217 :: [])) :: [])) when ((true) && ((isTrue (evalisExp((varK1_217 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isExp(#loc(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'loc,((Int _ as varK0_218) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isExp(#TransferIB(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isK(K0),isK(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'Hash'TransferIB,(varK0_219),(varK1_220)) :: [])) when ((true) && (true)) && (true) -> ((Bool true) :: [])
(*{| rule ``isExp(#lvDref(K0))=>#token("true","Bool")`` requires isExp(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'lvDref,(varK0_221 :: [])) :: [])) when (isTrue (evalisExp((varK0_221 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isExp(#KToken(#token("Id","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortId, var__222) :: [])) -> ((Bool true) :: [])
(*{| rule ``isExp(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_223)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisUninit (c: k) (config: k) (guard: int) : k = let lbl = 
LblisUninit and sort = 
SortBool in match c with 
(*{| rule ``isUninit(#KToken(#token("Uninit","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortUninit, var__224) :: [])) -> ((Bool true) :: [])
(*{| rule ``isUninit(`#uninit_OSL-SYNTAX`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'uninit_OSL'Hyph'SYNTAX) :: [])) -> ((Bool true) :: [])
(*{| rule ``isUninit(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_225)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let rec evalisBlocks (c: k) (config: k) (guard: int) : k = let lbl = 
LblisBlocks and sort = 
SortBool in match c with 
(*{| rule ``isBlocks(#KToken(#token("Blocks","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortBlocks, var__226) :: [])) -> ((Bool true) :: [])
(*{| rule ``isBlocks(`_,__OSL-SYNTAX`(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isBlock(K0),isBlocks(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl_'Comm'__OSL'Hyph'SYNTAX,(varK0_227 :: []),(varK1_228 :: [])) :: [])) when (((isTrue (evalisBlock((varK0_227 :: [])) config (-1)))) && ((isTrue (evalisBlocks((varK1_228 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isBlocks(`.List{"_,__OSL-SYNTAX"}`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Stop'List'LBraQuot'_'Comm'__OSL'Hyph'SYNTAX'QuotRBra') :: [])) -> ((Bool true) :: [])
(*{| rule ``isBlocks(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_229)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
and evalisStmt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisStmt and sort = 
SortBool in match c with 
(*{| rule ``isStmt(#KToken(#token("Block","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortBlock, var__230) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStmt(#KToken(#token("Stmt","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStmt, var__231) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStmt(val(K0))=>#token("true","Bool")`` requires isExp(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lblval,(varK0_232 :: [])) :: [])) when (isTrue (evalisExp((varK0_232 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isStmt(#borrow(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isExp(K0),isExp(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'Hash'borrow,(varK0_233 :: []),(varK1_234 :: [])) :: [])) when (((isTrue (evalisExp((varK0_233 :: [])) config (-1)))) && ((isTrue (evalisExp((varK1_234 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isStmt(#expStmt(K0))=>#token("true","Bool")`` requires isExp(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'expStmt,(varK0_235 :: [])) :: [])) when (isTrue (evalisExp((varK0_235 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isStmt(`_;_OSL-SYNTAX`(K0))=>#token("true","Bool")`` requires isFunction(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl_'SCln'_OSL'Hyph'SYNTAX,(varK0_236 :: [])) :: [])) when (isTrue (evalisFunction((varK0_236 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isStmt(#transfer(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isExp(K0),isExp(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'Hash'transfer,(varK0_237 :: []),(varK1_238 :: [])) :: [])) when (((isTrue (evalisExp((varK0_237 :: [])) config (-1)))) && ((isTrue (evalisExp((varK1_238 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isStmt(#block(K0))=>#token("true","Bool")`` requires isStmts(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'block,(varK0_239 :: [])) :: [])) when (isTrue (evalisStmts((varK0_239 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isStmt(#deallocate(K0))=>#token("true","Bool")`` requires isExp(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'deallocate,(varK0_240 :: [])) :: [])) when (isTrue (evalisExp((varK0_240 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isStmt(`loop_;_OSL-SYNTAX`(K0))=>#token("true","Bool")`` requires isBlock(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lblloop_'SCln'_OSL'Hyph'SYNTAX,(varK0_241 :: [])) :: [])) when (isTrue (evalisBlock((varK0_241 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isStmt(`destruct_;_OSL-SYNTAX`(K0))=>#token("true","Bool")`` requires isExp(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbldestruct_'SCln'_OSL'Hyph'SYNTAX,(varK0_242 :: [])) :: [])) when (isTrue (evalisExp((varK0_242 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isStmt(#repeat(K0))=>#token("true","Bool")`` requires isBlock(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'repeat,(varK0_243 :: [])) :: [])) when (isTrue (evalisBlock((varK0_243 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isStmt(#decl(K0))=>#token("true","Bool")`` requires isId(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'decl,(varK0_244 :: [])) :: [])) when (isTrue (evalisId((varK0_244 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isStmt(`transfer__;_OSL-SYNTAX`(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isUninit(K0),isExp(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbltransfer__'SCln'_OSL'Hyph'SYNTAX,(varK0_245 :: []),(varK1_246 :: [])) :: [])) when (((isTrue (evalisUninit((varK0_245 :: [])) config (-1)))) && ((isTrue (evalisExp((varK1_246 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isStmt(#declTy(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isId(K0),isType(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'Hash'declTy,(varK0_247 :: []),(varK1_248 :: [])) :: [])) when (((isTrue (evalisId((varK0_247 :: [])) config (-1)))) && ((isTrue (evalisType((varK1_248 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isStmt(#mborrow(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isExp(K0),isExp(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'Hash'mborrow,(varK0_249 :: []),(varK1_250 :: [])) :: [])) when (((isTrue (evalisExp((varK0_249 :: [])) config (-1)))) && ((isTrue (evalisExp((varK1_250 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isStmt(#branch(K0))=>#token("true","Bool")`` requires isBlocks(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'branch,(varK0_251 :: [])) :: [])) when (isTrue (evalisBlocks((varK0_251 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isStmt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_252)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
and evalisStmts (c: k) (config: k) (guard: int) : k = let lbl = 
LblisStmts and sort = 
SortBool in match c with 
(*{| rule ``isStmts(`___OSL-SYNTAX`(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isStmt(K0),isStmts(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl___OSL'Hyph'SYNTAX,(varK0_253 :: []),(varK1_254 :: [])) :: [])) when (((isTrue (evalisStmt((varK0_253 :: [])) config (-1)))) && ((isTrue (evalisStmts((varK1_254 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isStmts(#KToken(#token("Stmts","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStmts, var__255) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStmts(`.List{"___OSL-SYNTAX"}`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Stop'List'LBraQuot'___OSL'Hyph'SYNTAX'QuotRBra') :: [])) -> ((Bool true) :: [])
(*{| rule ``isStmts(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_256)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
and evalisBlock (c: k) (config: k) (guard: int) : k = let lbl = 
LblisBlock and sort = 
SortBool in match c with 
(*{| rule ``isBlock(#block(K0))=>#token("true","Bool")`` requires isStmts(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'block,(varK0_257 :: [])) :: [])) when (isTrue (evalisStmts((varK0_257 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isBlock(#KToken(#token("Block","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortBlock, var__258) :: [])) -> ((Bool true) :: [])
(*{| rule ``isBlock(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_259)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
and evalisFunction (c: k) (config: k) (guard: int) : k = let lbl = 
LblisFunction and sort = 
SortBool in match c with 
(*{| rule ``isFunction(#function(K0,K1,K2,K3))=>#token("true","Bool")`` requires `_andBool_`(`_andBool_`(`_andBool_`(isId(K0),isParameters(K1)),isType(K2)),isBlock(K3)) ensures #token("true","Bool") []|}*)
| ((KApply4(Lbl'Hash'function,(varK0_260 :: []),(varK1_261 :: []),(varK2_262 :: []),(varK3_263 :: [])) :: [])) when (((((((isTrue (evalisId((varK0_260 :: [])) config (-1)))) && ((isTrue (evalisParameters((varK1_261 :: [])) config (-1)))))) && ((isTrue (evalisType((varK2_262 :: [])) config (-1)))))) && ((isTrue (evalisBlock((varK3_263 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isFunction(#KToken(#token("Function","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFunction, var__264) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFunction(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_265)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'Plus'String__STRING (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'Plus'String__STRING and sort = 
SortString in match c with 
| _ -> try STRING.hook_concat c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'_GT_'Int__INT (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_GT_'Int__INT and sort = 
SortBool in match c with 
| _ -> try INT.hook_gt c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let rec evalreplace'LPar'_'Comm'_'Comm'_'Comm'_'RPar'_STRING (c: k * k * k * k) (config: k) (guard: int) : k = let lbl = 
Lblreplace'LPar'_'Comm'_'Comm'_'Comm'_'RPar'_STRING and sort = 
SortString in match c with 
| _ -> try STRING.hook_replace c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `replace(_,_,_,_)_STRING`(Source,ToReplace,Replacement,Count)=>`_+String__STRING`(`_+String__STRING`(substrString(Source,#token("0","Int"),findString(Source,ToReplace,#token("0","Int"))),Replacement),`replace(_,_,_,_)_STRING`(substrString(Source,`_+Int_`(findString(Source,ToReplace,#token("0","Int")),lengthString(ToReplace)),lengthString(Source)),ToReplace,Replacement,`_-Int__INT`(Count,#token("1","Int"))))`` requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isString(Replacement),isString(Source)),isInt(Count)),isString(ToReplace)),`_>Int__INT`(Count,#token("0","Int"))) ensures #token("true","Bool") [UNIQUE_ID(00a2618b5ebbb57a911b7f2ad35458f6b3e1d5cb14ef1e49468e9833e93e48c0) contentStartColumn(8) contentStartLine(570) org.kframework.attributes.Location(Location(570,8,573,30)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (((String _ as varSource_266) :: []),((String _ as varToReplace_267) :: []),((String _ as varReplacement_268) :: []),((Int _ as varCount_269) :: [])) when ((((((((true) && (true))) && (true))) && (true))) && ((isTrue (eval_'_GT_'Int__INT((varCount_269 :: []),((Lazy.force int0) :: [])) config (-1))))) && (true) -> ((eval_'Plus'String__STRING(((eval_'Plus'String__STRING(((evalsubstrString((varSource_266 :: []),((Lazy.force int0) :: []),((evalfindString((varSource_266 :: []),(varToReplace_267 :: []),((Lazy.force int0) :: [])) config (-1)))) config (-1))),(varReplacement_268 :: [])) config (-1))),((evalreplace'LPar'_'Comm'_'Comm'_'Comm'_'RPar'_STRING(((evalsubstrString((varSource_266 :: []),((eval_'Plus'Int_(((evalfindString((varSource_266 :: []),(varToReplace_267 :: []),((Lazy.force int0) :: [])) config (-1))),((evallengthString((varToReplace_267 :: [])) config (-1)))) config (-1))),((evallengthString((varSource_266 :: [])) config (-1)))) config (-1))),(varToReplace_267 :: []),(varReplacement_268 :: []),((eval_'Hyph'Int__INT((varCount_269 :: []),((Lazy.force int1) :: [])) config (-1)))) config (-1)))) config (-1)))
(*{| rule `` `replace(_,_,_,_)_STRING`(Source,_15,_16,_0)=>Source`` requires `_andBool_`(`_andBool_`(`_andBool_`(isString(Source),isString(_15)),isString(_16)),`_==Int_`(_0,#token("0","Int"))) ensures #token("true","Bool") [UNIQUE_ID(ba5c0b944155cbe05f7bf6c179a2ed1e9baea983ec5099e8449b31926e9b3069) contentStartColumn(8) contentStartLine(574) org.kframework.attributes.Location(Location(574,8,574,49)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((String _ as varSource_270) :: []),((String _ as var_15_271) :: []),((String _ as var_16_272) :: []),((Int _ as var_0_273) :: [])) when ((((((true) && (true))) && (true))) && ((isTrue (eval_'EqlsEqls'Int_((var_0_273 :: []),((Lazy.force int0) :: [])) config (-1))))) && (true) -> (varSource_270 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize4 c)))])
let eval_'_LT_'Int__INT (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_LT_'Int__INT and sort = 
SortBool in match c with 
| _ -> try INT.hook_lt c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let rec evalcountAllOccurrences'LPar'_'Comm'_'RPar'_STRING (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblcountAllOccurrences'LPar'_'Comm'_'RPar'_STRING and sort = 
SortInt in match c with 
| _ -> try STRING.hook_countAllOccurrences c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `countAllOccurrences(_,_)_STRING`(Source,ToCount)=>#token("0","Int")`` requires `_andBool_`(`_andBool_`(isString(ToCount),isString(Source)),`_<Int__INT`(findString(Source,ToCount,#token("0","Int")),#token("0","Int"))) ensures #token("true","Bool") [UNIQUE_ID(cb338e251d0b5234f4abbf9c60008d68dc9dd3a8b1a5a410ed51f56d43a7b5af) contentStartColumn(8) contentStartLine(558) org.kframework.attributes.Location(Location(558,8,559,59)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (((String _ as varSource_274) :: []),((String _ as varToCount_275) :: [])) when ((((true) && (true))) && ((isTrue (eval_'_LT_'Int__INT(((evalfindString((varSource_274 :: []),(varToCount_275 :: []),((Lazy.force int0) :: [])) config (-1))),((Lazy.force int0) :: [])) config (-1))))) && (true) -> ((Lazy.force int0) :: [])
(*{| rule `` `countAllOccurrences(_,_)_STRING`(Source,ToCount)=>`_+Int_`(#token("1","Int"),`countAllOccurrences(_,_)_STRING`(substrString(Source,`_+Int_`(findString(Source,ToCount,#token("0","Int")),lengthString(ToCount)),lengthString(Source)),ToCount))`` requires `_andBool_`(`_andBool_`(isString(ToCount),isString(Source)),`_>=Int__INT`(findString(Source,ToCount,#token("0","Int")),#token("0","Int"))) ensures #token("true","Bool") [UNIQUE_ID(9834f2e2641cb2ecf28969acaab73619cb181f1a69c9cfef5102f907edaeb71e) contentStartColumn(8) contentStartLine(560) org.kframework.attributes.Location(Location(560,8,561,60)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (((String _ as varSource_276) :: []),((String _ as varToCount_277) :: [])) when ((((true) && (true))) && ((isTrue (eval_'_GT_Eqls'Int__INT(((evalfindString((varSource_276 :: []),(varToCount_277 :: []),((Lazy.force int0) :: [])) config (-1))),((Lazy.force int0) :: [])) config (-1))))) && (true) -> ((eval_'Plus'Int_(((Lazy.force int1) :: []),((evalcountAllOccurrences'LPar'_'Comm'_'RPar'_STRING(((evalsubstrString((varSource_276 :: []),((eval_'Plus'Int_(((evalfindString((varSource_276 :: []),(varToCount_277 :: []),((Lazy.force int0) :: [])) config (-1))),((evallengthString((varToCount_277 :: [])) config (-1)))) config (-1))),((evallengthString((varSource_276 :: [])) config (-1)))) config (-1))),(varToCount_277 :: [])) config (-1)))) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalreplaceAll'LPar'_'Comm'_'Comm'_'RPar'_STRING (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblreplaceAll'LPar'_'Comm'_'Comm'_'RPar'_STRING and sort = 
SortString in match c with 
| _ -> try STRING.hook_replaceAll c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `replaceAll(_,_,_)_STRING`(Source,ToReplace,Replacement)=>`replace(_,_,_,_)_STRING`(Source,ToReplace,Replacement,`countAllOccurrences(_,_)_STRING`(Source,ToReplace))`` requires `_andBool_`(`_andBool_`(isString(Replacement),isString(Source)),isString(ToReplace)) ensures #token("true","Bool") [UNIQUE_ID(3358d86b83068ab68fc4f0ed02513db149426f011866db38ff0a5015e8fee30d) contentStartColumn(8) contentStartLine(575) org.kframework.attributes.Location(Location(575,8,575,154)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((String _ as varSource_278) :: []),((String _ as varToReplace_279) :: []),((String _ as varReplacement_280) :: [])) when ((((true) && (true))) && (true)) && (true) -> ((evalreplace'LPar'_'Comm'_'Comm'_'Comm'_'RPar'_STRING((varSource_278 :: []),(varToReplace_279 :: []),(varReplacement_280 :: []),((evalcountAllOccurrences'LPar'_'Comm'_'RPar'_STRING((varSource_278 :: []),(varToReplace_279 :: [])) config (-1)))) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalisStatesCellOpt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisStatesCellOpt and sort = 
SortBool in match c with 
(*{| rule ``isStatesCellOpt(noStatesCell(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(LblnoStatesCell) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStatesCellOpt(#KToken(#token("StatesCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStatesCell, var__281) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStatesCellOpt(#KToken(#token("StatesCellOpt","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStatesCellOpt, var__282) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStatesCellOpt(`<states>`(K0))=>#token("true","Bool")`` requires isStateCellMap(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'states'_GT_',((Map (SortStateCellMap,_,_) as varK0_283) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isStatesCellOpt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_284)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisNstateCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisNstateCell and sort = 
SortBool in match c with 
(*{| rule ``isNstateCell(`<nstate>`(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'nstate'_GT_',((Int _ as varK0_285) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isNstateCell(#KToken(#token("NstateCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortNstateCell, var__286) :: [])) -> ((Bool true) :: [])
(*{| rule ``isNstateCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_287)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'Xor_'Int__INT (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'Xor_'Int__INT and sort = 
SortInt in match c with 
| _ -> try INT.hook_pow c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalinitWriteCell (c: unit) (config: k) (guard: int) : k = let lbl = 
LblinitWriteCell and sort = 
SortWriteCell in match c with 
(*{| rule ``initWriteCell(.KList)=>`<write>`(`.Set`(.KList))`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(95ac191de68f4a35ebd8bba6a72fb508df6ff3f071078d679c988beb7567ac57) initializer()]|}*)
| () -> (KApply1(Lbl'_LT_'write'_GT_',((Lazy.force const'Stop'Set))) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let constinitWriteCell : k Lazy.t = lazy (evalinitWriteCell () interned_bottom (-1))
let eval'Stop'Map (c: unit) (config: k) (guard: int) : k = let lbl = 
Lbl'Stop'Map and sort = 
SortMap in match c with 
| _ -> try MAP.hook_unit c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let const'Stop'Map : k Lazy.t = lazy (eval'Stop'Map () interned_bottom (-1))
let evalisKItem (c: k) (config: k) (guard: int) : k = let lbl = 
LblisKItem and sort = 
SortBool in match c with 
| [_] -> [Bool true] | _ -> [Bool false]
| [List (s,_,_)] when (s = SortList) -> [Bool true]
| [String _] -> [Bool true]
| [Map (s,_,_)] when (s = SortFunDefCellMap) -> [Bool true]
| [Bool _] -> [Bool true]
| [Map (s,_,_)] when (s = SortMap) -> [Bool true]
| [Int _] -> [Bool true]
| [Float _] -> [Bool true]
| [Map (s,_,_)] when (s = SortStateCellMap) -> [Bool true]
| [Set (s,_,_)] when (s = SortSet) -> [Bool true]
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_orBool__BOOL (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_orBool__BOOL and sort = 
SortBool in match c with 
| _ -> try BOOL.hook_or c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_orBool__BOOL`(#token("false","Bool"),B)=>B`` requires isBool(B) ensures #token("true","Bool") [UNIQUE_ID(ababa6e5e3735076933657815e24f99518fe532715ea97eae22ead8e30097b53) contentStartColumn(8) contentStartLine(319) org.kframework.attributes.Location(Location(319,8,319,32)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool false) :: []),((Bool _ as varB_288) :: [])) when true && (true) -> (varB_288 :: [])
(*{| rule `` `_orBool__BOOL`(_3,#token("true","Bool"))=>#token("true","Bool")`` requires isBool(_3) ensures #token("true","Bool") [UNIQUE_ID(497077a299480dbc06eccb33cd98338014bd125c4c601cb88a765dbcb334b14b) contentStartColumn(8) contentStartLine(318) org.kframework.attributes.Location(Location(318,8,318,34)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool _ as var_3_289) :: []),((Bool true) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule `` `_orBool__BOOL`(#token("true","Bool"),_6)=>#token("true","Bool")`` requires isBool(_6) ensures #token("true","Bool") [UNIQUE_ID(166d732e9fd6609a71feb6d62f8a420d291ac81be018b646ee1177935b008f01) contentStartColumn(8) contentStartLine(317) org.kframework.attributes.Location(Location(317,8,317,34)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool true) :: []),((Bool _ as var_6_290) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule `` `_orBool__BOOL`(B,#token("false","Bool"))=>B`` requires isBool(B) ensures #token("true","Bool") [UNIQUE_ID(630487d34ae5fc313a9b8cae2ad45b7b80671058bca3c97a7864774c5a431711) contentStartColumn(8) contentStartLine(320) org.kframework.attributes.Location(Location(320,8,320,32)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool _ as varB_291) :: []),((Bool false) :: [])) when true && (true) -> (varB_291 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval'Hash'lc (c: k * k * k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'lc and sort = 
SortBool in match c with 
(*{| rule ``#lc(L1,L2,L3,L4)=>`_orBool__BOOL`(`_andBool_`(`_<Int__INT`(L1,L3),`_<=Int__INT`(L3,L2)),`_andBool_`(`_<Int__INT`(L1,L4),`_<=Int__INT`(L4,L2)))`` requires `_andBool_`(`_andBool_`(`_andBool_`(isInt(L3),isInt(L4)),isInt(L2)),isInt(L1)) ensures #token("true","Bool") [UNIQUE_ID(5e7282b13fde5fa27cff7a23496168848f4ac4f26921a74d6204547a997b8ab3) contentStartColumn(6) contentStartLine(242) org.kframework.attributes.Location(Location(242,6,243,66)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Int _ as varL1_292) :: []),((Int _ as varL2_293) :: []),((Int _ as varL3_294) :: []),((Int _ as varL4_295) :: [])) when ((((((true) && (true))) && (true))) && (true)) && (true) -> ([Bool ((((((isTrue (eval_'_LT_'Int__INT((varL1_292 :: []),(varL3_294 :: [])) config (-1)))) && ((isTrue (eval_'_LT_Eqls'Int__INT((varL3_294 :: []),(varL2_293 :: [])) config (-1)))))) || ((((isTrue (eval_'_LT_'Int__INT((varL1_292 :: []),(varL4_295 :: [])) config (-1)))) && ((isTrue (eval_'_LT_Eqls'Int__INT((varL4_295 :: []),(varL2_293 :: [])) config (-1))))))))])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize4 c)))])
let rec eval'Hash'borrowmutck (c: k * k * k * k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'borrowmutck and sort = 
SortBool in match c with 
(*{| rule ``#borrowmutck(_69,_0,_70,_71,_72)=>#token("false","Bool")`` requires `_andBool_`(`_==K_`(`.Map`(.KList),_0),`_andBool_`(`_andBool_`(`_andBool_`(isInt(_71),isInt(_69)),isInt(_72)),isInt(_70))) ensures #token("true","Bool") [UNIQUE_ID(18bec766a0dce6a4d8e9c6858abdf6efa65d958a7956a0cae30f91e798ce270a) contentStartColumn(6) contentStartLine(327) org.kframework.attributes.Location(Location(327,6,327,42)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Int _ as var_69_296) :: []),(var_0_297),((Int _ as var_70_298) :: []),((Int _ as var_71_299) :: []),((Int _ as var_72_300) :: [])) when (((isTrue (eval_'EqlsEqls'K_(((Lazy.force const'Stop'Map)),(var_0_297)) config (-1)))) && (((((((true) && (true))) && (true))) && (true)))) && (true) -> ((Bool false) :: [])
| (((Int _ as var_0_301) :: []),(var_1_302),((Int _ as var_2_303) :: []),((Int _ as var_3_304) :: []),((Int _ as var_4_305) :: [])) when guard < 1(*{| rule ``#borrowmutck(L4,_0,L1,L2,L3)=>#borrowmutck(L4,M,L1,L2,L3)`` requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(L,_0),#match(#rs(_61),`Map:lookup`(_0,L))),#match(M,`_[_<-undef]`(_0,L))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(L3),isProps(_61)),isInt(L4)),isInt(L2)),isKItem(L)),isMap(M)),isInt(L1))) ensures #token("true","Bool") [UNIQUE_ID(9194dd104bb59a1517bfa7b8bfab67a43714bc7b6da6b287d750b0f28c89b97b) contentStartColumn(6) contentStartLine(272) org.kframework.attributes.Location(Location(272,6,273,53)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
 -> (match (var_1_302) with 
| [Map (_,_,collection)] -> let choice = (KMap.fold (fun e v result -> if result == interned_bottom then (match e with | (var_6_306 :: []) as e3 -> (let e = ((evalMap'Coln'lookup((var_1_302),e3) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| (KApply1(Lbl'Hash'rs,(var_7_307 :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_1_302),e3) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| ((Map (SortMap,_,_) as var_5_308) :: []) when ((((((true) && (true))) && (true))) && (((((((((((((true) && ((isTrue (evalisProps((var_7_307 :: [])) config (-1)))))) && (true))) && (true))) && (true))) && (true))) && (true)))) && (true) -> ((eval'Hash'borrowmutck((var_0_301 :: []),(var_5_308 :: []),(var_2_303 :: []),(var_3_304 :: []),(var_4_305 :: [])) config (-1)))| _ -> interned_bottom)| _ -> interned_bottom)| _ -> interned_bottom) else result) collection interned_bottom) in if choice == interned_bottom then (eval'Hash'borrowmutck c config 1) else choice| _ -> (eval'Hash'borrowmutck c config 1))
| (((Int _ as var_0_309) :: []),(var_1_310),((Int _ as var_2_311) :: []),((Int _ as var_3_312) :: []),((Int _ as var_4_313) :: [])) when guard < 2(*{| rule ``#borrowmutck(L4,_0,L1,L2,L3)=>#borrowmutck(L4,M,L1,L2,L3)`` requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(L,_0),#match(#br(_85,_86,#immRef(L5)),`Map:lookup`(_0,L))),#match(M,`_[_<-undef]`(_0,L))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(L3),isInt(L5)),isInt(L4)),isInt(L2)),isKItem(L)),isInt(_86)),isMap(M)),isInt(L1)),isInt(_85)),`_=/=Int__INT`(L5,L3))) ensures #token("true","Bool") [UNIQUE_ID(80dc759cc6674e08daf3f1552aa63cac091d6516bd96e3ff472329463247d01f) contentStartColumn(6) contentStartLine(275) org.kframework.attributes.Location(Location(275,6,277,27)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
 -> (match (var_1_310) with 
| [Map (_,_,collection)] -> let choice = (KMap.fold (fun e v result -> if result == interned_bottom then (match e with | (var_6_314 :: []) as e4 -> (let e = ((evalMap'Coln'lookup((var_1_310),e4) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| (KApply3(Lbl'Hash'br,((Int _ as var_7_315) :: []),((Int _ as var_8_316) :: []),(KApply1(Lbl'Hash'immRef,((Int _ as var_9_317) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_1_310),e4) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| ((Map (SortMap,_,_) as var_5_318) :: []) when ((((((true) && (true))) && (true))) && (((((((((((((((((((true) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && ((isTrue (eval_'EqlsSlshEqls'Int__INT((var_9_317 :: []),(var_4_313 :: [])) config (-1))))))) && (true) -> ((eval'Hash'borrowmutck((var_0_309 :: []),(var_5_318 :: []),(var_2_311 :: []),(var_3_312 :: []),(var_4_313 :: [])) config (-1)))| _ -> interned_bottom)| _ -> interned_bottom)| _ -> interned_bottom) else result) collection interned_bottom) in if choice == interned_bottom then (eval'Hash'borrowmutck c config 2) else choice| _ -> (eval'Hash'borrowmutck c config 2))
| (((Int _ as var_0_319) :: []),(var_1_320),((Int _ as var_2_321) :: []),((Int _ as var_3_322) :: []),((Int _ as var_4_323) :: [])) when guard < 3(*{| rule ``#borrowmutck(L4,_0,L1,L2,L3)=>#borrowmutck(L4,M,L1,L2,L3)`` requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(L,_0),#match(`#uninit_OSL-SYNTAX`(.KList),`Map:lookup`(_0,L))),#match(M,`_[_<-undef]`(_0,L))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(L3),isInt(L4)),isInt(L2)),isInt(L)),isMap(M)),isInt(L1))) ensures #token("true","Bool") [UNIQUE_ID(bae923fcffef88219c8baedde80aa23a716e31f698812cbc8f18b6f68fdff8b8) contentStartColumn(6) contentStartLine(289) org.kframework.attributes.Location(Location(289,6,290,53)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
 -> (match (var_1_320) with 
| [Map (_,_,collection)] -> let choice = (KMap.fold (fun e v result -> if result == interned_bottom then (match e with | ((Int _ as var_6_324) :: []) as e5 -> (let e = ((evalMap'Coln'lookup((var_1_320),e5) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| (KApply0(Lbl'Hash'uninit_OSL'Hyph'SYNTAX) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_1_320),e5) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| ((Map (SortMap,_,_) as var_5_325) :: []) when ((((((true) && (true))) && (true))) && (((((((((((true) && (true))) && (true))) && (true))) && (true))) && (true)))) && (true) -> ((eval'Hash'borrowmutck((var_0_319 :: []),(var_5_325 :: []),(var_2_321 :: []),(var_3_322 :: []),(var_4_323 :: [])) config (-1)))| _ -> interned_bottom)| _ -> interned_bottom)| _ -> interned_bottom) else result) collection interned_bottom) in if choice == interned_bottom then (eval'Hash'borrowmutck c config 3) else choice| _ -> (eval'Hash'borrowmutck c config 3))
| (((Int _ as var_0_326) :: []),(var_1_327),((Int _ as var_2_328) :: []),((Int _ as var_3_329) :: []),((Int _ as var_4_330) :: [])) when guard < 4(*{| rule ``#borrowmutck(L5,_0,L1,L2,L3)=>#token("true","Bool")`` requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(L,_0),#match(#br(BEG,END,#immRef(L3)),`Map:lookup`(_0,L))),#match(M,`_[_<-undef]`(_0,L))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(L3),isInt(END)),isInt(L5)),isInt(L2)),isInt(L)),isMap(M)),isInt(L1)),isInt(BEG)),`_andBool_`(`_=/=Int__INT`(L5,L),`_==Bool__BOOL`(#lc(L1,L2,BEG,END),#token("true","Bool"))))) ensures #token("true","Bool") [UNIQUE_ID(d7a58a8dba957b95ce046838236156f5385d37a02692e92aaa7523dbba58175e) contentStartColumn(6) contentStartLine(284) org.kframework.attributes.Location(Location(284,6,286,69)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
 -> (match (var_1_327) with 
| [Map (_,_,collection)] -> let choice = (KMap.fold (fun e v result -> if result == interned_bottom then (match e with | ((Int _ as var_5_331) :: []) as e6 -> (let e = ((evalMap'Coln'lookup((var_1_327),e6) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| (KApply3(Lbl'Hash'br,((Int _ as var_6_332) :: []),((Int _ as var_7_333) :: []),(KApply1(Lbl'Hash'immRef,((Int _ as var_4_334) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_1_327),e6) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| ((Map (SortMap,_,_) as var_8_335) :: []) when ((((((true) && (true))) && (true))) && (((((((((((((((((true) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && ((((isTrue (eval_'EqlsSlshEqls'Int__INT((var_0_326 :: []),e6) config (-1)))) && ((isTrue (eval_'EqlsEqls'Bool__BOOL(((eval'Hash'lc((var_2_328 :: []),(var_3_329 :: []),(var_6_332 :: []),(var_7_333 :: [])) config (-1))),((Bool true) :: [])) config (-1))))))))) && (((compare_kitem var_4_330 var_4_334) = 0) && true) -> ((Bool true) :: [])| _ -> interned_bottom)| _ -> interned_bottom)| _ -> interned_bottom) else result) collection interned_bottom) in if choice == interned_bottom then (eval'Hash'borrowmutck c config 4) else choice| _ -> (eval'Hash'borrowmutck c config 4))
| (((Int _ as var_0_336) :: []),(var_1_337),((Int _ as var_2_338) :: []),((Int _ as var_3_339) :: []),((Int _ as var_4_340) :: [])) when guard < 5(*{| rule ``#borrowmutck(L5,_0,L1,L2,L3)=>#token("true","Bool")`` requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(L,_0),#match(#br(BEG,END,#mutRef(L3)),`Map:lookup`(_0,L))),#match(M,`_[_<-undef]`(_0,L))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(L3),isInt(END)),isInt(L5)),isInt(L2)),isInt(L)),isMap(M)),isInt(L1)),isInt(BEG)),`_andBool_`(`_=/=Int__INT`(L5,L),`_==Bool__BOOL`(#lc(L1,L2,BEG,END),#token("true","Bool"))))) ensures #token("true","Bool") [UNIQUE_ID(aea22591121fbe70c4f6381f3b44710bfe6d1f8f586032b97a8a63deece7c43e) contentStartColumn(6) contentStartLine(301) org.kframework.attributes.Location(Location(301,6,304,74)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
 -> (match (var_1_337) with 
| [Map (_,_,collection)] -> let choice = (KMap.fold (fun e v result -> if result == interned_bottom then (match e with | ((Int _ as var_5_341) :: []) as e7 -> (let e = ((evalMap'Coln'lookup((var_1_337),e7) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| (KApply3(Lbl'Hash'br,((Int _ as var_6_342) :: []),((Int _ as var_7_343) :: []),(KApply1(Lbl'Hash'mutRef,((Int _ as var_4_344) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_1_337),e7) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| ((Map (SortMap,_,_) as var_8_345) :: []) when ((((((true) && (true))) && (true))) && (((((((((((((((((true) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && ((((isTrue (eval_'EqlsSlshEqls'Int__INT((var_0_336 :: []),e7) config (-1)))) && ((isTrue (eval_'EqlsEqls'Bool__BOOL(((eval'Hash'lc((var_2_338 :: []),(var_3_339 :: []),(var_6_342 :: []),(var_7_343 :: [])) config (-1))),((Bool true) :: [])) config (-1))))))))) && (((compare_kitem var_4_340 var_4_344) = 0) && true) -> ((Bool true) :: [])| _ -> interned_bottom)| _ -> interned_bottom)| _ -> interned_bottom) else result) collection interned_bottom) in if choice == interned_bottom then (eval'Hash'borrowmutck c config 5) else choice| _ -> (eval'Hash'borrowmutck c config 5))
| (((Int _ as var_0_346) :: []),(var_1_347),((Int _ as var_2_348) :: []),((Int _ as var_3_349) :: []),((Int _ as var_4_350) :: [])) when guard < 6(*{| rule ``#borrowmutck(L5,_0,L1,L2,L3)=>#borrowmutck(L5,M,L1,L2,L3)`` requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(L,_0),#match(#br(BEG,END,#mutRef(L3)),`Map:lookup`(_0,L))),#match(M,`_[_<-undef]`(_0,L))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(L3),isInt(END)),isInt(L5)),isInt(L2)),isInt(L)),isMap(M)),isInt(L1)),isInt(BEG)),`_andBool_`(`_=/=Int__INT`(L5,L),`_==Bool__BOOL`(#lc(L1,L2,BEG,END),#token("false","Bool"))))) ensures #token("true","Bool") [UNIQUE_ID(b09a05e9c87e9d6c4e402172dd9208a7db559c453e1402f73469dddf1ac75482) contentStartColumn(6) contentStartLine(296) org.kframework.attributes.Location(Location(296,6,299,75)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
 -> (match (var_1_347) with 
| [Map (_,_,collection)] -> let choice = (KMap.fold (fun e v result -> if result == interned_bottom then (match e with | ((Int _ as var_6_351) :: []) as e8 -> (let e = ((evalMap'Coln'lookup((var_1_347),e8) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| (KApply3(Lbl'Hash'br,((Int _ as var_7_352) :: []),((Int _ as var_8_353) :: []),(KApply1(Lbl'Hash'mutRef,((Int _ as var_4_354) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_1_347),e8) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| ((Map (SortMap,_,_) as var_5_355) :: []) when ((((((true) && (true))) && (true))) && (((((((((((((((((true) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && ((((isTrue (eval_'EqlsSlshEqls'Int__INT((var_0_346 :: []),e8) config (-1)))) && ((isTrue (eval_'EqlsEqls'Bool__BOOL(((eval'Hash'lc((var_2_348 :: []),(var_3_349 :: []),(var_7_352 :: []),(var_8_353 :: [])) config (-1))),((Bool false) :: [])) config (-1))))))))) && (((compare_kitem var_4_350 var_4_354) = 0) && true) -> ((eval'Hash'borrowmutck((var_0_346 :: []),(var_5_355 :: []),(var_2_348 :: []),(var_3_349 :: []),(var_4_350 :: [])) config (-1)))| _ -> interned_bottom)| _ -> interned_bottom)| _ -> interned_bottom) else result) collection interned_bottom) in if choice == interned_bottom then (eval'Hash'borrowmutck c config 6) else choice| _ -> (eval'Hash'borrowmutck c config 6))
| (((Int _ as var_0_356) :: []),(var_1_357),((Int _ as var_2_358) :: []),((Int _ as var_3_359) :: []),((Int _ as var_4_360) :: [])) when guard < 7(*{| rule ``#borrowmutck(L,_0,L1,L2,L3)=>#borrowmutck(L,M,L1,L2,L3)`` requires `_andBool_`(`_andBool_`(#match(#br(_53,_54,_55),`Map:lookup`(_0,L)),#match(M,`_[_<-undef]`(_0,L))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(_53),isInt(L3)),isInt(L2)),isInt(_54)),isInt(L)),isExp(_55)),isMap(M)),isInt(L1))) ensures #token("true","Bool") [UNIQUE_ID(ee82e282f56db854fbed08bdd437f3d970479a7a6a94ed44dd77b35a2a1042a4) contentStartColumn(6) contentStartLine(307) org.kframework.attributes.Location(Location(307,6,308,52)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
 -> (let e = ((evalMap'Coln'lookup((var_1_357),(var_0_356 :: [])) config (-1))) in match e with 
| [Bottom] -> (eval'Hash'borrowmutck c config 7)
| (KApply3(Lbl'Hash'br,((Int _ as var_6_361) :: []),((Int _ as var_7_362) :: []),(var_8_363 :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_1_357),(var_0_356 :: [])) config (-1))) in match e with 
| [Bottom] -> (eval'Hash'borrowmutck c config 7)
| ((Map (SortMap,_,_) as var_5_364) :: []) when ((((true) && (true))) && (((((((((((((((true) && (true))) && (true))) && (true))) && (true))) && ((isTrue (evalisExp((var_8_363 :: [])) config (-1)))))) && (true))) && (true)))) && (true) -> ((eval'Hash'borrowmutck((var_0_356 :: []),(var_5_364 :: []),(var_2_358 :: []),(var_3_359 :: []),(var_4_360 :: [])) config (-1)))| _ -> (eval'Hash'borrowmutck c config 7))| _ -> (eval'Hash'borrowmutck c config 7))
| (((Int _ as var_0_365) :: []),(var_1_366),((Int _ as var_2_367) :: []),((Int _ as var_3_368) :: []),((Int _ as var_4_369) :: [])) when guard < 8(*{| rule ``#borrowmutck(L5,_0,L1,L2,L3)=>#borrowmutck(L5,M,L1,L2,L3)`` requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(L,_0),#match(#br(BEG,END,#immRef(L3)),`Map:lookup`(_0,L))),#match(M,`_[_<-undef]`(_0,L))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(L3),isInt(END)),isInt(L5)),isInt(L2)),isInt(L)),isMap(M)),isInt(L1)),isInt(BEG)),`_andBool_`(`_=/=Int__INT`(L5,L),`_==Bool__BOOL`(#lc(L1,L2,BEG,END),#token("false","Bool"))))) ensures #token("true","Bool") [UNIQUE_ID(e6d6007ffd951ad30bed8a3d1416f5a26d6924341fcda158a1720f4d67fd2bd4) contentStartColumn(6) contentStartLine(280) org.kframework.attributes.Location(Location(280,6,282,70)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
 -> (match (var_1_366) with 
| [Map (_,_,collection)] -> let choice = (KMap.fold (fun e v result -> if result == interned_bottom then (match e with | ((Int _ as var_6_370) :: []) as e9 -> (let e = ((evalMap'Coln'lookup((var_1_366),e9) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| (KApply3(Lbl'Hash'br,((Int _ as var_7_371) :: []),((Int _ as var_8_372) :: []),(KApply1(Lbl'Hash'immRef,((Int _ as var_4_373) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_1_366),e9) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| ((Map (SortMap,_,_) as var_5_374) :: []) when ((((((true) && (true))) && (true))) && (((((((((((((((((true) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && ((((isTrue (eval_'EqlsSlshEqls'Int__INT((var_0_365 :: []),e9) config (-1)))) && ((isTrue (eval_'EqlsEqls'Bool__BOOL(((eval'Hash'lc((var_2_367 :: []),(var_3_368 :: []),(var_7_371 :: []),(var_8_372 :: [])) config (-1))),((Bool false) :: [])) config (-1))))))))) && (((compare_kitem var_4_373 var_4_369) = 0) && true) -> ((eval'Hash'borrowmutck((var_0_365 :: []),(var_5_374 :: []),(var_2_367 :: []),(var_3_368 :: []),(var_4_373 :: [])) config (-1)))| _ -> interned_bottom)| _ -> interned_bottom)| _ -> interned_bottom) else result) collection interned_bottom) in if choice == interned_bottom then (eval'Hash'borrowmutck c config 8) else choice| _ -> (eval'Hash'borrowmutck c config 8))
| (((Int _ as var_0_375) :: []),(var_1_376),((Int _ as var_2_377) :: []),((Int _ as var_3_378) :: []),((Int _ as var_4_379) :: [])) when guard < 9(*{| rule ``#borrowmutck(L5,_0,L1,L2,L4)=>#borrowmutck(L5,M,L1,L2,L4)`` requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(L,_0),#match(#br(_56,_57,#mutRef(L3)),`Map:lookup`(_0,L))),#match(M,`_[_<-undef]`(_0,L))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(_56),isInt(_57)),isInt(L3)),isInt(L5)),isInt(L4)),isInt(L2)),isInt(L)),isMap(M)),isInt(L1)),`_=/=Int__INT`(L3,L4))) ensures #token("true","Bool") [UNIQUE_ID(19f47d0bd585d3d4af6594b91779d49004e5b3e1aa49f58d93c5f8aaf11c3d89) contentStartColumn(6) contentStartLine(292) org.kframework.attributes.Location(Location(292,6,294,27)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
 -> (match (var_1_376) with 
| [Map (_,_,collection)] -> let choice = (KMap.fold (fun e v result -> if result == interned_bottom then (match e with | ((Int _ as var_6_380) :: []) as e10 -> (let e = ((evalMap'Coln'lookup((var_1_376),e10) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| (KApply3(Lbl'Hash'br,((Int _ as var_7_381) :: []),((Int _ as var_8_382) :: []),(KApply1(Lbl'Hash'mutRef,((Int _ as var_9_383) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_1_376),e10) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| ((Map (SortMap,_,_) as var_5_384) :: []) when ((((((true) && (true))) && (true))) && (((((((((((((((((((true) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && ((isTrue (eval_'EqlsSlshEqls'Int__INT((var_9_383 :: []),(var_4_379 :: [])) config (-1))))))) && (true) -> ((eval'Hash'borrowmutck((var_0_375 :: []),(var_5_384 :: []),(var_2_377 :: []),(var_3_378 :: []),(var_4_379 :: [])) config (-1)))| _ -> interned_bottom)| _ -> interned_bottom)| _ -> interned_bottom) else result) collection interned_bottom) in if choice == interned_bottom then (eval'Hash'borrowmutck c config 9) else choice| _ -> (eval'Hash'borrowmutck c config 9))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize5 c)))])
let eval_'_LT_'String__STRING (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_LT_'String__STRING and sort = 
SortBool in match c with 
| _ -> try STRING.hook_lt c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'_GT_'String__STRING (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_GT_'String__STRING and sort = 
SortBool in match c with 
| _ -> try STRING.hook_gt c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_>String__STRING`(S1,S2)=>`_<String__STRING`(S2,S1)`` requires `_andBool_`(isString(S2),isString(S1)) ensures #token("true","Bool") [UNIQUE_ID(85f6517ce0e2b7074d495585267afa5b0502e09d5bf63c57fb6c6d77174aa16a) contentStartColumn(8) contentStartLine(550) org.kframework.attributes.Location(Location(550,8,550,52)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((String _ as varS1_385) :: []),((String _ as varS2_386) :: [])) when ((true) && (true)) && (true) -> ((eval_'_LT_'String__STRING((varS2_386 :: []),(varS1_385 :: [])) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisBorrowItem (c: k) (config: k) (guard: int) : k = let lbl = 
LblisBorrowItem and sort = 
SortBool in match c with 
(*{| rule ``isBorrowItem(#KToken(#token("BorrowItem","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortBorrowItem, var__387) :: [])) -> ((Bool true) :: [])
(*{| rule ``isBorrowItem(#br(K0,K1,K2))=>#token("true","Bool")`` requires `_andBool_`(`_andBool_`(isInt(K0),isInt(K1)),isExp(K2)) ensures #token("true","Bool") []|}*)
| ((KApply3(Lbl'Hash'br,((Int _ as varK0_388) :: []),((Int _ as varK1_389) :: []),(varK2_390 :: [])) :: [])) when ((((true) && (true))) && ((isTrue (evalisExp((varK2_390 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isBorrowItem(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_391)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'EqlsSlshEqls'K_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'EqlsSlshEqls'K_ and sort = 
SortBool in match c with 
| _ -> try KEQUAL.hook_ne c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_=/=K_`(K1,K2)=>`notBool_`(`_==K_`(K1,K2))`` requires `_andBool_`(isK(K1),isK(K2)) ensures #token("true","Bool") [UNIQUE_ID(0221882a8af3c088550dce160a5b2e48351ef2431aad518a72f3d65258a4066d) contentStartColumn(8) contentStartLine(763) org.kframework.attributes.Location(Location(763,8,763,45)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| ((varK1_392),(varK2_393)) when ((true) && (true)) && (true) -> ([Bool ((not ((isTrue (eval_'EqlsEqls'K_((varK1_392),(varK2_393)) config (-1))))))])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval'Hash'checkInit (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'checkInit and sort = 
SortBool in match c with 
(*{| rule ``#checkInit(X,E,S)=>`_=/=K_`(`Map:lookup`(S,`Map:lookup`(E,X)),`#uninit_OSL-SYNTAX`(.KList))`` requires `_andBool_`(`_andBool_`(isMap(E),isId(X)),isMap(S)) ensures #token("true","Bool") [UNIQUE_ID(6500274db9ca237493f3b35f42a9c0a8484e163a8685e2c36411309bd83fd3fc) contentStartColumn(6) contentStartLine(335) org.kframework.attributes.Location(Location(335,6,335,56)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| ((varX_394 :: []),((Map (SortMap,_,_) as varE_395) :: []),((Map (SortMap,_,_) as varS_396) :: [])) when ((((true) && ((isTrue (evalisId((varX_394 :: [])) config (-1)))))) && (true)) && (true) -> ((eval_'EqlsSlshEqls'K_(((evalMap'Coln'lookup((varS_396 :: []),((evalMap'Coln'lookup((varE_395 :: []),(varX_394 :: [])) config (-1)))) config (-1))),(const'Hash'uninit_OSL'Hyph'SYNTAX :: [])) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalisKConfigVar (c: k) (config: k) (guard: int) : k = let lbl = 
LblisKConfigVar and sort = 
SortBool in match c with 
(*{| rule ``isKConfigVar(#KToken(#token("KConfigVar","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortKConfigVar, var__397) :: [])) -> ((Bool true) :: [])
(*{| rule ``isKConfigVar(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_398)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisFnameCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisFnameCell and sort = 
SortBool in match c with 
(*{| rule ``isFnameCell(`<fname>`(K0))=>#token("true","Bool")`` requires isK(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'fname'_GT_',(varK0_399)) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isFnameCell(#KToken(#token("FnameCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFnameCell, var__400) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFnameCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_401)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisFparamsCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisFparamsCell and sort = 
SortBool in match c with 
(*{| rule ``isFparamsCell(#KToken(#token("FparamsCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFparamsCell, var__402) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFparamsCell(`<fparams>`(K0))=>#token("true","Bool")`` requires isParameters(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'fparams'_GT_',(varK0_403 :: [])) :: [])) when (isTrue (evalisParameters((varK0_403 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isFparamsCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_404)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisFretCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisFretCell and sort = 
SortBool in match c with 
(*{| rule ``isFretCell(`<fret>`(K0))=>#token("true","Bool")`` requires isK(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'fret'_GT_',(varK0_405)) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isFretCell(#KToken(#token("FretCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFretCell, var__406) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFretCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_407)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisFbodyCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisFbodyCell and sort = 
SortBool in match c with 
(*{| rule ``isFbodyCell(#KToken(#token("FbodyCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFbodyCell, var__408) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFbodyCell(`<fbody>`(K0))=>#token("true","Bool")`` requires isK(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'fbody'_GT_',(varK0_409)) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isFbodyCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_410)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisFunDefCellMap (c: k) (config: k) (guard: int) : k = let lbl = 
LblisFunDefCellMap and sort = 
SortBool in match c with 
| [Map (s,_,_)] when (s = SortFunDefCellMap) -> [Bool true]
(*{| rule ``isFunDefCellMap(#KToken(#token("FunDefCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFunDefCell, var__411) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFunDefCellMap(#KToken(#token("FunDefCellMap","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFunDefCellMap, var__412) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFunDefCellMap(`<funDef>`(K0,K1,K2,K3))=>#token("true","Bool")`` requires `_andBool_`(`_andBool_`(`_andBool_`(isFnameCell(K0),isFparamsCell(K1)),isFretCell(K2)),isFbodyCell(K3)) ensures #token("true","Bool") []|}*)
| ((KApply4(Lbl'_LT_'funDef'_GT_',(varK0_413 :: []),(varK1_414 :: []),(varK2_415 :: []),(varK3_416 :: [])) :: [])) when (((((((isTrue (evalisFnameCell((varK0_413 :: [])) config (-1)))) && ((isTrue (evalisFparamsCell((varK1_414 :: [])) config (-1)))))) && ((isTrue (evalisFretCell((varK2_415 :: [])) config (-1)))))) && ((isTrue (evalisFbodyCell((varK3_416 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isFunDefCellMap(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_417)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisFunDefsCellFragment (c: k) (config: k) (guard: int) : k = let lbl = 
LblisFunDefsCellFragment and sort = 
SortBool in match c with 
(*{| rule ``isFunDefsCellFragment(`<funDefs>-fragment`(K0))=>#token("true","Bool")`` requires isFunDefCellMap(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'funDefs'_GT_Hyph'fragment,((Map (SortFunDefCellMap,_,_) as varK0_418) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isFunDefsCellFragment(#KToken(#token("FunDefsCellFragment","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFunDefsCellFragment, var__419) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFunDefsCellFragment(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_420)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisKResult (c: k) (config: k) (guard: int) : k = let lbl = 
LblisKResult and sort = 
SortBool in match c with 
(*{| rule ``isKResult(#Loc(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isValue(K0),isInt(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'Hash'Loc,(varK0_421 :: []),((Int _ as varK1_422) :: [])) :: [])) when (((isTrue (evalisValue((varK0_421 :: [])) config (-1)))) && (true)) && (true) -> ((Bool true) :: [])
(*{| rule ``isKResult(#immRef(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'immRef,((Int _ as varK0_423) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isKResult(#rs(K0))=>#token("true","Bool")`` requires isProps(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'rs,(varK0_424 :: [])) :: [])) when (isTrue (evalisProps((varK0_424 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isKResult(`#void_OSL-SYNTAX`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'void_OSL'Hyph'SYNTAX) :: [])) -> ((Bool true) :: [])
(*{| rule ``isKResult(#loc(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'loc,((Int _ as varK0_425) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isKResult(#mutRef(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'mutRef,((Int _ as varK0_426) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isKResult(#KToken(#token("KResult","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortKResult, var__427) :: [])) -> ((Bool true) :: [])
(*{| rule ``isKResult(#KToken(#token("Value","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortValue, var__428) :: [])) -> ((Bool true) :: [])
(*{| rule ``isKResult(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_429)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisFunDefsCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisFunDefsCell and sort = 
SortBool in match c with 
(*{| rule ``isFunDefsCell(`<funDefs>`(K0))=>#token("true","Bool")`` requires isFunDefCellMap(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'funDefs'_GT_',((Map (SortFunDefCellMap,_,_) as varK0_430) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isFunDefsCell(#KToken(#token("FunDefsCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFunDefsCell, var__431) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFunDefsCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_432)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisCell and sort = 
SortBool in match c with 
(*{| rule ``isCell(`<fparams>`(K0))=>#token("true","Bool")`` requires isParameters(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'fparams'_GT_',(varK0_433 :: [])) :: [])) when (isTrue (evalisParameters((varK0_433 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("FnameCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFnameCell, var__434) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(`<states>`(K0))=>#token("true","Bool")`` requires isStateCellMap(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'states'_GT_',((Map (SortStateCellMap,_,_) as varK0_435) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("Cell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortCell, var__436) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("FretCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFretCell, var__437) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("TimerCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortTimerCell, var__438) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(`<fname>`(K0))=>#token("true","Bool")`` requires isK(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'fname'_GT_',(varK0_439)) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("EnvCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortEnvCell, var__440) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("FbodyCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFbodyCell, var__441) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("TCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortTCell, var__442) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("FunDefsCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFunDefsCell, var__443) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("IndexesCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortIndexesCell, var__444) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(`<T>`(K0,K1,K2,K3))=>#token("true","Bool")`` requires `_andBool_`(`_andBool_`(`_andBool_`(isStatesCell(K0),isNstateCell(K1)),isTmpCell(K2)),isFunDefsCell(K3)) ensures #token("true","Bool") []|}*)
| ((KApply4(Lbl'_LT_'T'_GT_',(varK0_445 :: []),(varK1_446 :: []),(varK2_447 :: []),(varK3_448 :: [])) :: [])) when (((((((isTrue (evalisStatesCell((varK0_445 :: [])) config (-1)))) && ((isTrue (evalisNstateCell((varK1_446 :: [])) config (-1)))))) && ((isTrue (evalisTmpCell((varK2_447 :: [])) config (-1)))))) && ((isTrue (evalisFunDefsCell((varK3_448 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(`<k>`(K0))=>#token("true","Bool")`` requires isK(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'k'_GT_',(varK0_449)) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(`<indexes>`(K0))=>#token("true","Bool")`` requires isIndexes(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'indexes'_GT_',(varK0_450 :: [])) :: [])) when (isTrue (evalisIndexes((varK0_450 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("IndexCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortIndexCell, var__451) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("StatesCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStatesCell, var__452) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(`<write>`(K0))=>#token("true","Bool")`` requires isSet(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'write'_GT_',((Set (SortSet,_,_) as varK0_453) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(`<timer>`(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'timer'_GT_',((Int _ as varK0_454) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("KCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortKCell, var__455) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(`<fbody>`(K0))=>#token("true","Bool")`` requires isK(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'fbody'_GT_',(varK0_456)) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(`<env>`(K0))=>#token("true","Bool")`` requires isMap(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'env'_GT_',((Map (SortMap,_,_) as varK0_457) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(`<state>`(K0,K1,K2,K3,K4,K5,K6,K7))=>#token("true","Bool")`` requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isIndexCell(K0),isKCell(K1)),isEnvCell(K2)),isStoreCell(K3)),isStackCell(K4)),isWriteCell(K5)),isTimerCell(K6)),isIndexesCell(K7)) ensures #token("true","Bool") []|}*)
| ((KApply8(Lbl'_LT_'state'_GT_',(varK0_458 :: []),(varK1_459 :: []),(varK2_460 :: []),(varK3_461 :: []),(varK4_462 :: []),(varK5_463 :: []),(varK6_464 :: []),(varK7_465 :: [])) :: [])) when (((((((((((((((isTrue (evalisIndexCell((varK0_458 :: [])) config (-1)))) && ((isTrue (evalisKCell((varK1_459 :: [])) config (-1)))))) && ((isTrue (evalisEnvCell((varK2_460 :: [])) config (-1)))))) && ((isTrue (evalisStoreCell((varK3_461 :: [])) config (-1)))))) && ((isTrue (evalisStackCell((varK4_462 :: [])) config (-1)))))) && ((isTrue (evalisWriteCell((varK5_463 :: [])) config (-1)))))) && ((isTrue (evalisTimerCell((varK6_464 :: [])) config (-1)))))) && ((isTrue (evalisIndexesCell((varK7_465 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("StateCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStateCell, var__466) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("FparamsCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFparamsCell, var__467) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(`<tmp>`(K0))=>#token("true","Bool")`` requires isList(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'tmp'_GT_',((List (SortList,_,_) as varK0_468) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(`<store>`(K0))=>#token("true","Bool")`` requires isMap(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'store'_GT_',((Map (SortMap,_,_) as varK0_469) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(`<funDef>`(K0,K1,K2,K3))=>#token("true","Bool")`` requires `_andBool_`(`_andBool_`(`_andBool_`(isFnameCell(K0),isFparamsCell(K1)),isFretCell(K2)),isFbodyCell(K3)) ensures #token("true","Bool") []|}*)
| ((KApply4(Lbl'_LT_'funDef'_GT_',(varK0_470 :: []),(varK1_471 :: []),(varK2_472 :: []),(varK3_473 :: [])) :: [])) when (((((((isTrue (evalisFnameCell((varK0_470 :: [])) config (-1)))) && ((isTrue (evalisFparamsCell((varK1_471 :: [])) config (-1)))))) && ((isTrue (evalisFretCell((varK2_472 :: [])) config (-1)))))) && ((isTrue (evalisFbodyCell((varK3_473 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(`<fret>`(K0))=>#token("true","Bool")`` requires isK(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'fret'_GT_',(varK0_474)) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("NstateCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortNstateCell, var__475) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(`<index>`(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'index'_GT_',((Int _ as varK0_476) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(`<nstate>`(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'nstate'_GT_',((Int _ as varK0_477) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("TmpCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortTmpCell, var__478) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("WriteCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortWriteCell, var__479) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(`<funDefs>`(K0))=>#token("true","Bool")`` requires isFunDefCellMap(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'funDefs'_GT_',((Map (SortFunDefCellMap,_,_) as varK0_480) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(`<stack>`(K0))=>#token("true","Bool")`` requires isList(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'stack'_GT_',((List (SortList,_,_) as varK0_481) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("StackCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStackCell, var__482) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("StoreCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStoreCell, var__483) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(#KToken(#token("FunDefCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFunDefCell, var__484) :: [])) -> ((Bool true) :: [])
(*{| rule ``isCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_485)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalvalues (c: k) (config: k) (guard: int) : k = let lbl = 
Lblvalues and sort = 
SortList in match c with 
| _ -> try MAP.hook_values c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalList'Coln'get (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblList'Coln'get and sort = 
SortKItem in match c with 
| _ -> try LIST.hook_get c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval'Hash'lstat'LPar'_'RPar'_K'Hyph'IO (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'lstat'LPar'_'RPar'_K'Hyph'IO and sort = 
SortKItem in match c with 
| _ -> try IO.hook_lstat c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalinitFnameCell (c: unit) (config: k) (guard: int) : k = let lbl = 
LblinitFnameCell and sort = 
SortFnameCell in match c with 
(*{| rule ``initFnameCell(.KList)=>`<fname>`(.K)`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(c6b0cfeec25868d70bbde3a328252881044f4087d60990b2c6e38f51bc227daa) initializer()]|}*)
| () -> (KApply1(Lbl'_LT_'fname'_GT_',([])) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let constinitFnameCell : k Lazy.t = lazy (evalinitFnameCell () interned_bottom (-1))
let evalisRItem (c: k) (config: k) (guard: int) : k = let lbl = 
LblisRItem and sort = 
SortBool in match c with 
(*{| rule ``isRItem(`#removeState_CONTROL`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'removeState_CONTROL) :: [])) -> ((Bool true) :: [])
(*{| rule ``isRItem(#KToken(#token("RItem","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortRItem, var__486) :: [])) -> ((Bool true) :: [])
(*{| rule ``isRItem(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_487)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalStateCellMapItem (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblStateCellMapItem and sort = 
SortStateCellMap in match c with 
| _ -> try MAP.hook_element c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisStoreCellOpt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisStoreCellOpt and sort = 
SortBool in match c with 
(*{| rule ``isStoreCellOpt(noStoreCell(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(LblnoStoreCell) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStoreCellOpt(#KToken(#token("StoreCellOpt","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStoreCellOpt, var__488) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStoreCellOpt(#KToken(#token("StoreCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStoreCell, var__489) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStoreCellOpt(`<store>`(K0))=>#token("true","Bool")`` requires isMap(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'store'_GT_',((Map (SortMap,_,_) as varK0_490) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isStoreCellOpt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_491)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Stop'List (c: unit) (config: k) (guard: int) : k = let lbl = 
Lbl'Stop'List and sort = 
SortList in match c with 
| _ -> try LIST.hook_unit c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let const'Stop'List : k Lazy.t = lazy (eval'Stop'List () interned_bottom (-1))
let evalisLoopItem (c: k) (config: k) (guard: int) : k = let lbl = 
LblisLoopItem and sort = 
SortBool in match c with 
(*{| rule ``isLoopItem(#decompose(K0))=>#token("true","Bool")`` requires isK(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'decompose,(varK0_492)) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isLoopItem(#KToken(#token("LoopItem","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortLoopItem, var__493) :: [])) -> ((Bool true) :: [])
(*{| rule ``isLoopItem(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_494)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisFunDefsCellOpt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisFunDefsCellOpt and sort = 
SortBool in match c with 
(*{| rule ``isFunDefsCellOpt(#KToken(#token("FunDefsCellOpt","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFunDefsCellOpt, var__495) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFunDefsCellOpt(`<funDefs>`(K0))=>#token("true","Bool")`` requires isFunDefCellMap(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'funDefs'_GT_',((Map (SortFunDefCellMap,_,_) as varK0_496) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isFunDefsCellOpt(#KToken(#token("FunDefsCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFunDefsCell, var__497) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFunDefsCellOpt(noFunDefsCell(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(LblnoFunDefsCell) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFunDefsCellOpt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_498)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisWItem (c: k) (config: k) (guard: int) : k = let lbl = 
LblisWItem and sort = 
SortBool in match c with 
(*{| rule ``isWItem(#KToken(#token("WItem","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortWItem, var__499) :: [])) -> ((Bool true) :: [])
(*{| rule ``isWItem(#writev(K0,K1))=>#token("true","Bool")`` requires `_andBool_`(isInt(K0),isInt(K1)) ensures #token("true","Bool") []|}*)
| ((KApply2(Lbl'Hash'writev,((Int _ as varK0_500) :: []),((Int _ as varK1_501) :: [])) :: [])) when ((true) && (true)) && (true) -> ((Bool true) :: [])
(*{| rule ``isWItem(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_502)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalrandInt (c: k) (config: k) (guard: int) : k = let lbl = 
LblrandInt and sort = 
SortInt in match c with 
| _ -> try INT.hook_rand c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'configuration_K'Hyph'REFLECTION (c: unit) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'configuration_K'Hyph'REFLECTION and sort = 
SortK in match c with 
| _ -> try KREFLECTION.hook_configuration c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let evalisFloat (c: k) (config: k) (guard: int) : k = let lbl = 
LblisFloat and sort = 
SortBool in match c with 
| [Float _] -> [Bool true]
(*{| rule ``isFloat(#KToken(#token("Float","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFloat, var__503) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFloat(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_504)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'close'LPar'_'RPar'_K'Hyph'IO (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'close'LPar'_'RPar'_K'Hyph'IO and sort = 
SortK in match c with 
| _ -> try IO.hook_close c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisOItem (c: k) (config: k) (guard: int) : k = let lbl = 
LblisOItem and sort = 
SortBool in match c with 
(*{| rule ``isOItem(#borrowMutCK(K0,K1,K2,K3))=>#token("true","Bool")`` requires `_andBool_`(`_andBool_`(`_andBool_`(isInt(K0),isInt(K1)),isInt(K2)),isInt(K3)) ensures #token("true","Bool") []|}*)
| ((KApply4(Lbl'Hash'borrowMutCK,((Int _ as varK0_505) :: []),((Int _ as varK1_506) :: []),((Int _ as varK2_507) :: []),((Int _ as varK3_508) :: [])) :: [])) when ((((((true) && (true))) && (true))) && (true)) && (true) -> ((Bool true) :: [])
(*{| rule ``isOItem(#Read(K0))=>#token("true","Bool")`` requires isK(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'Read,(varK0_509)) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isOItem(#KToken(#token("OItem","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortOItem, var__510) :: [])) -> ((Bool true) :: [])
(*{| rule ``isOItem(#borrowImmCK(K0,K1,K2,K3))=>#token("true","Bool")`` requires `_andBool_`(`_andBool_`(`_andBool_`(isInt(K0),isInt(K1)),isInt(K2)),isInt(K3)) ensures #token("true","Bool") []|}*)
| ((KApply4(Lbl'Hash'borrowImmCK,((Int _ as varK0_511) :: []),((Int _ as varK1_512) :: []),((Int _ as varK2_513) :: []),((Int _ as varK3_514) :: [])) :: [])) when ((((((true) && (true))) && (true))) && (true)) && (true) -> ((Bool true) :: [])
(*{| rule ``isOItem(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_515)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalinitFretCell (c: unit) (config: k) (guard: int) : k = let lbl = 
LblinitFretCell and sort = 
SortFretCell in match c with 
(*{| rule ``initFretCell(.KList)=>`<fret>`(.K)`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(5e883c3e228f14a02660196d8c2f06947340c49dec0396774b907e418538c4f6) initializer()]|}*)
| () -> (KApply1(Lbl'_LT_'fret'_GT_',([])) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let constinitFretCell : k Lazy.t = lazy (evalinitFretCell () interned_bottom (-1))
let evalkeys_list'LPar'_'RPar'_MAP (c: k) (config: k) (guard: int) : k = let lbl = 
Lblkeys_list'LPar'_'RPar'_MAP and sort = 
SortList in match c with 
| _ -> try MAP.hook_keys_list c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalString2Id (c: k) (config: k) (guard: int) : k = let lbl = 
LblString2Id and sort = 
SortId in match c with 
| _ -> try STRING.hook_string2token c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalInt2String (c: k) (config: k) (guard: int) : k = let lbl = 
LblInt2String and sort = 
SortString in match c with 
| _ -> try STRING.hook_int2string c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalfreshId (c: k) (config: k) (guard: int) : k = let lbl = 
LblfreshId and sort = 
SortId in match c with 
(*{| rule ``freshId(I)=>`String2Id`(`_+String__STRING`(#token("\"_\"","String"),`Int2String`(I)))`` requires isInt(I) ensures #token("true","Bool") [UNIQUE_ID(cb89ef33f1b27d7db53de8a3c240cc3b944a9a0a9559c32b1b97c7bfec87bfa2) contentStartColumn(8) contentStartLine(745) org.kframework.attributes.Location(Location(745,8,745,62)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Int _ as varI_516) :: [])) when true && (true) -> ((evalString2Id(((eval_'Plus'String__STRING(((String "_") :: []),((evalInt2String((varI_516 :: [])) config (-1)))) config (-1)))) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Stop'FunDefCellMap (c: unit) (config: k) (guard: int) : k = let lbl = 
Lbl'Stop'FunDefCellMap and sort = 
SortFunDefCellMap in match c with 
| _ -> try MAP.hook_unit c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let const'Stop'FunDefCellMap : k Lazy.t = lazy (eval'Stop'FunDefCellMap () interned_bottom (-1))
let evalinitFunDefsCell (c: unit) (config: k) (guard: int) : k = let lbl = 
LblinitFunDefsCell and sort = 
SortFunDefsCell in match c with 
(*{| rule ``initFunDefsCell(.KList)=>`<funDefs>`(`.FunDefCellMap`(.KList))`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(50459ae813ffc712b1acdd29df0d798d848b9010ab6e73b1e4682d0cb1095692) initializer()]|}*)
| () -> (KApply1(Lbl'_LT_'funDefs'_GT_',((Lazy.force const'Stop'FunDefCellMap))) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let constinitFunDefsCell : k Lazy.t = lazy (evalinitFunDefsCell () interned_bottom (-1))
let evalchrChar (c: k) (config: k) (guard: int) : k = let lbl = 
LblchrChar and sort = 
SortString in match c with 
| _ -> try STRING.hook_chr c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_orElseBool__BOOL (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_orElseBool__BOOL and sort = 
SortBool in match c with 
| _ -> try BOOL.hook_orElse c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_orElseBool__BOOL`(_9,#token("true","Bool"))=>#token("true","Bool")`` requires isBool(_9) ensures #token("true","Bool") [UNIQUE_ID(2882f8b0a388fe37313c6b828cb9039a9838984f56e50b5095476c319b3dfbd8) contentStartColumn(8) contentStartLine(323) org.kframework.attributes.Location(Location(323,8,323,33)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool _ as var_9_517) :: []),((Bool true) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule `` `_orElseBool__BOOL`(#token("true","Bool"),_2)=>#token("true","Bool")`` requires isBool(_2) ensures #token("true","Bool") [UNIQUE_ID(6ea998be2fb9b60b7964c4b4939293b6fecb47f52a53031c6227218949cf22f0) contentStartColumn(8) contentStartLine(322) org.kframework.attributes.Location(Location(322,8,322,33)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool true) :: []),((Bool _ as var_2_518) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule `` `_orElseBool__BOOL`(#token("false","Bool"),K)=>K`` requires isBool(K) ensures #token("true","Bool") [UNIQUE_ID(efdd958595a7fecb549f4368ba6097862b61abc903a6d33684803a3a0043bda8) contentStartColumn(8) contentStartLine(324) org.kframework.attributes.Location(Location(324,8,324,37)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool false) :: []),((Bool _ as varK_519) :: [])) when true && (true) -> (varK_519 :: [])
(*{| rule `` `_orElseBool__BOOL`(K,#token("false","Bool"))=>K`` requires isBool(K) ensures #token("true","Bool") [UNIQUE_ID(8c7774b237a73a62ffd53be8d97ac73eb2f040dcf41983ea18840919b416d291) contentStartColumn(8) contentStartLine(325) org.kframework.attributes.Location(Location(325,8,325,37)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool _ as varK_520) :: []),((Bool false) :: [])) when true && (true) -> (varK_520 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'Slsh'Int__INT (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'Slsh'Int__INT and sort = 
SortInt in match c with 
| _ -> try INT.hook_tdiv c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_divInt__INT (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_divInt__INT and sort = 
SortInt in match c with 
| _ -> try INT.hook_ediv c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_divInt__INT`(I1,I2)=>`_/Int__INT`(`_-Int__INT`(I1,`_modInt__INT`(I1,I2)),I2)`` requires `_andBool_`(`_andBool_`(isInt(I1),isInt(I2)),`_=/=Int__INT`(I2,#token("0","Int"))) ensures #token("true","Bool") [UNIQUE_ID(b7fc8e019ea9840ee8c5e9232d39d7944e010f117308f672e92891325002610e) contentStartColumn(8) contentStartLine(388) org.kframework.attributes.Location(Location(388,8,389,23)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (((Int _ as varI1_521) :: []),((Int _ as varI2_522) :: [])) when ((((true) && (true))) && ((isTrue (eval_'EqlsSlshEqls'Int__INT((varI2_522 :: []),((Lazy.force int0) :: [])) config (-1))))) && (true) -> ((eval_'Slsh'Int__INT(((eval_'Hyph'Int__INT((varI1_521 :: []),((eval_modInt__INT((varI1_521 :: []),(varI2_522 :: [])) config (-1)))) config (-1))),(varI2_522 :: [])) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalList'Coln'range (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblList'Coln'range and sort = 
SortList in match c with 
| _ -> try LIST.hook_range c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let eval'Hash'unwrapVal (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'unwrapVal and sort = 
SortInt in match c with 
(*{| rule ``#unwrapVal(V)=>V`` requires isInt(V) ensures #token("true","Bool") [UNIQUE_ID(1f67efce365d148d645f7b65eda0e1caf990d8dcaccdc26b5cc5dba7b6ac6978) contentStartColumn(6) contentStartLine(66) org.kframework.attributes.Location(Location(66,6,66,28)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Int _ as varV_523) :: [])) when true && (true) -> (varV_523 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let rec eval'Hash'wv (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'wv and sort = 
SortInt in match c with 
(*{| rule ``#wv(X,ENV)=>#unwrapVal(`Map:lookup`(ENV,X))`` requires `_andBool_`(isMap(ENV),isId(X)) ensures #token("true","Bool") [UNIQUE_ID(689e040d702ca5e1bdd7d393106d8b56b55699b60702d44e6e4b951b649ddcbc) contentStartColumn(6) contentStartLine(68) org.kframework.attributes.Location(Location(68,6,68,46)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| ((varX_524 :: []),((Map (SortMap,_,_) as varENV_525) :: [])) when ((true) && ((isTrue (evalisId((varX_524 :: [])) config (-1))))) && (true) -> ((eval'Hash'unwrapVal(((evalMap'Coln'lookup((varENV_525 :: []),(varX_524 :: [])) config (-1)))) config (-1)))
(*{| rule ``#wv(`*__OSL-SYNTAX`(E),ENV)=>#wv(E,ENV)`` requires `_andBool_`(isMap(ENV),isExp(E)) ensures #token("true","Bool") [UNIQUE_ID(25a8ae4ab391e31405db9e6a7ec16d368a6a2cb8849ab68ec0c51ab4e324a7fd) contentStartColumn(6) contentStartLine(69) org.kframework.attributes.Location(Location(69,6,69,41)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| ((KApply1(Lbl'Star'__OSL'Hyph'SYNTAX,(varE_526 :: [])) :: []),((Map (SortMap,_,_) as varENV_527) :: [])) when ((true) && ((isTrue (evalisExp((varE_526 :: [])) config (-1))))) && (true) -> ((eval'Hash'wv((varE_526 :: []),(varENV_527 :: [])) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalinitEnvCell (c: unit) (config: k) (guard: int) : k = let lbl = 
LblinitEnvCell and sort = 
SortEnvCell in match c with 
(*{| rule ``initEnvCell(.KList)=>`<env>`(`.Map`(.KList))`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(c7a3b857bb45cfd6e74b7a22ee3624d3c09e5603948d8474a27aea184c4c80ec) initializer()]|}*)
| () -> (KApply1(Lbl'_LT_'env'_GT_',((Lazy.force const'Stop'Map))) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let constinitEnvCell : k Lazy.t = lazy (evalinitEnvCell () interned_bottom (-1))
let rec eval'Hash'bindParams (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'bindParams and sort = 
SortStmts in match c with 
(*{| rule ``#bindParams(`.List{"_,__OSL-SYNTAX"}`(.KList),`.List{"_,__OSL-SYNTAX"}`(.KList),SS)=>SS`` requires isStmts(SS) ensures #token("true","Bool") [UNIQUE_ID(ae986fef2148c7fe353a9becb0304bdf6c2d66a16b58ecfedc2cf63d85fc6d56) contentStartColumn(6) contentStartLine(36) org.kframework.attributes.Location(Location(36,6,36,53)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/call.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| ((KApply0(Lbl'Stop'List'LBraQuot'_'Comm'__OSL'Hyph'SYNTAX'QuotRBra') :: []),(KApply0(Lbl'Stop'List'LBraQuot'_'Comm'__OSL'Hyph'SYNTAX'QuotRBra') :: []),(varSS_528 :: [])) when (isTrue (evalisStmts((varSS_528 :: [])) config (-1))) && (true) -> (varSS_528 :: [])
(*{| rule ``#bindParams(`_,__OSL-SYNTAX`(#parameter(P,T),Ps),`_,__OSL-SYNTAX`(E,Es),SS)=>`___OSL-SYNTAX`(#decl(P),`___OSL-SYNTAX`(#transfer(E,P),#bindParams(Ps,Es,SS)))`` requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isExps(Es),isId(P)),isStmts(SS)),isType(T)),isParameters(Ps)),isExp(E)) ensures #token("true","Bool") [UNIQUE_ID(ed992b737d20ca251454e61fbfa179a7b9e14abd54784dd4a525dd015731de7f) contentStartColumn(6) contentStartLine(33) org.kframework.attributes.Location(Location(33,6,34,57)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/call.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| ((KApply2(Lbl_'Comm'__OSL'Hyph'SYNTAX,(KApply2(Lbl'Hash'parameter,(varP_529 :: []),(varT_530 :: [])) :: []),(varPs_531 :: [])) :: []),(KApply2(Lbl_'Comm'__OSL'Hyph'SYNTAX,(varE_532 :: []),(varEs_533 :: [])) :: []),(varSS_534 :: [])) when (((((((((((isTrue (evalisExps((varEs_533 :: [])) config (-1)))) && ((isTrue (evalisId((varP_529 :: [])) config (-1)))))) && ((isTrue (evalisStmts((varSS_534 :: [])) config (-1)))))) && ((isTrue (evalisType((varT_530 :: [])) config (-1)))))) && ((isTrue (evalisParameters((varPs_531 :: [])) config (-1)))))) && ((isTrue (evalisExp((varE_532 :: [])) config (-1))))) && (true) -> (KApply2(Lbl___OSL'Hyph'SYNTAX,(KApply1(Lbl'Hash'decl,(varP_529 :: [])) :: []),(KApply2(Lbl___OSL'Hyph'SYNTAX,(KApply2(Lbl'Hash'transfer,(varE_532 :: []),(varP_529 :: [])) :: []),((eval'Hash'bindParams((varPs_531 :: []),(varEs_533 :: []),(varSS_534 :: [])) config (-1)))) :: [])) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let eval'Hash'compareA (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'compareA and sort = 
SortBool in match c with 
(*{| rule ``#compareA(#rs(P),#rs(P1))=>#token("false","Bool")`` requires `_andBool_`(`_andBool_`(isProps(P1),isProps(P)),`_=/=K_`(P,P1)) ensures #token("true","Bool") [UNIQUE_ID(85d14520920f2f5ecdc9cf1c41dd2acd463f2d8bfc370cb50fef14a296b21062) contentStartColumn(6) contentStartLine(152) org.kframework.attributes.Location(Location(152,6,153,24)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| ((KApply1(Lbl'Hash'rs,(varP_535 :: [])) :: []),(KApply1(Lbl'Hash'rs,(varP1_536 :: [])) :: [])) when (((((isTrue (evalisProps((varP1_536 :: [])) config (-1)))) && ((isTrue (evalisProps((varP_535 :: [])) config (-1)))))) && ((isTrue (eval_'EqlsSlshEqls'K_((varP_535 :: []),(varP1_536 :: [])) config (-1))))) && (true) -> ((Bool false) :: [])
(*{| rule ``#compareA(`#uninit_OSL-SYNTAX`(.KList),`#uninit_OSL-SYNTAX`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(c59c2bbec07b9915003648b9a7f26b2c5052e7f533a983fb4021879547c50856) contentStartColumn(6) contentStartLine(141) org.kframework.attributes.Location(Location(141,6,141,41)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| ((KApply0(Lbl'Hash'uninit_OSL'Hyph'SYNTAX) :: []),(KApply0(Lbl'Hash'uninit_OSL'Hyph'SYNTAX) :: [])) -> ((Bool true) :: [])
(*{| rule ``#compareA(#rs(_34),`#uninit_OSL-SYNTAX`(.KList))=>#token("false","Bool")`` requires isProps(_34) ensures #token("true","Bool") [UNIQUE_ID(73a668ad2b45a2239e802058d04904b89249de3761c1b0261a32f9cc00b30967) contentStartColumn(6) contentStartLine(143) org.kframework.attributes.Location(Location(143,6,143,41)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| ((KApply1(Lbl'Hash'rs,(var_34_537 :: [])) :: []),(KApply0(Lbl'Hash'uninit_OSL'Hyph'SYNTAX) :: [])) when (isTrue (evalisProps((var_34_537 :: [])) config (-1))) && (true) -> ((Bool false) :: [])
(*{| rule ``#compareA(#br(_19,_20,R1),#br(_21,_22,R2))=>#token("false","Bool")`` requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(_21),isInt(_22)),isExp(R2)),isInt(_19)),isExp(R1)),isInt(_20)),`_=/=K_`(R1,R2)) ensures #token("true","Bool") [UNIQUE_ID(7a4b9a8ed2bd92c62948d226aa68d13041bd19875222d2bd0d408a97c368654e) contentStartColumn(6) contentStartLine(157) org.kframework.attributes.Location(Location(157,6,158,25)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| ((KApply3(Lbl'Hash'br,((Int _ as var_19_538) :: []),((Int _ as var_20_539) :: []),(varR1_540 :: [])) :: []),(KApply3(Lbl'Hash'br,((Int _ as var_21_541) :: []),((Int _ as var_22_542) :: []),(varR2_543 :: [])) :: [])) when ((((((((((((true) && (true))) && ((isTrue (evalisExp((varR2_543 :: [])) config (-1)))))) && (true))) && ((isTrue (evalisExp((varR1_540 :: [])) config (-1)))))) && (true))) && ((isTrue (eval_'EqlsSlshEqls'K_((varR1_540 :: []),(varR2_543 :: [])) config (-1))))) && (true) -> ((Bool false) :: [])
(*{| rule ``#compareA(#br(_31,_32,_33),`#uninit_OSL-SYNTAX`(.KList))=>#token("false","Bool")`` requires `_andBool_`(`_andBool_`(isExp(_33),isInt(_32)),isInt(_31)) ensures #token("true","Bool") [UNIQUE_ID(58c5d674faeafeae4c379420d285f13296f818b99791f51e21db74e0e71c43f7) contentStartColumn(6) contentStartLine(146) org.kframework.attributes.Location(Location(146,6,146,45)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| ((KApply3(Lbl'Hash'br,((Int _ as var_31_544) :: []),((Int _ as var_32_545) :: []),(var_33_546 :: [])) :: []),(KApply0(Lbl'Hash'uninit_OSL'Hyph'SYNTAX) :: [])) when (((((isTrue (evalisExp((var_33_546 :: [])) config (-1)))) && (true))) && (true)) && (true) -> ((Bool false) :: [])
(*{| rule ``#compareA(#rs(P),#rs(P))=>#token("true","Bool")`` requires isProps(P) ensures #token("true","Bool") [UNIQUE_ID(04c2f3a7727b2a811f3bf2a083682f459898631a8468eb4059a689ff85f33f26) contentStartColumn(6) contentStartLine(144) org.kframework.attributes.Location(Location(144,6,144,39)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| ((KApply1(Lbl'Hash'rs,(varP_547 :: [])) :: []),(KApply1(Lbl'Hash'rs,(varP_548 :: [])) :: [])) when (isTrue (evalisProps((varP_547 :: [])) config (-1))) && (((compare_kitem varP_547 varP_548) = 0) && true) -> ((Bool true) :: [])
(*{| rule ``#compareA(#rs(_23),#br(_24,_25,_26))=>#token("false","Bool")`` requires `_andBool_`(`_andBool_`(`_andBool_`(isInt(_24),isExp(_26)),isProps(_23)),isInt(_25)) ensures #token("true","Bool") [UNIQUE_ID(d3607b3eaa00fcd256471a77ce1494510424f61f959b31cd3217331af52eb8f3) contentStartColumn(6) contentStartLine(148) org.kframework.attributes.Location(Location(148,6,148,44)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| ((KApply1(Lbl'Hash'rs,(var_23_549 :: [])) :: []),(KApply3(Lbl'Hash'br,((Int _ as var_24_550) :: []),((Int _ as var_25_551) :: []),(var_26_552 :: [])) :: [])) when ((((((true) && ((isTrue (evalisExp((var_26_552 :: [])) config (-1)))))) && ((isTrue (evalisProps((var_23_549 :: [])) config (-1)))))) && (true)) && (true) -> ((Bool false) :: [])
(*{| rule ``#compareA(`#uninit_OSL-SYNTAX`(.KList),#br(_35,_36,_37))=>#token("false","Bool")`` requires `_andBool_`(`_andBool_`(isInt(_36),isExp(_37)),isInt(_35)) ensures #token("true","Bool") [UNIQUE_ID(9edcadf239328ea3bb1ee169ae675d865d636e8b8438e36bd37b8b35368f4c01) contentStartColumn(6) contentStartLine(145) org.kframework.attributes.Location(Location(145,6,145,45)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| ((KApply0(Lbl'Hash'uninit_OSL'Hyph'SYNTAX) :: []),(KApply3(Lbl'Hash'br,((Int _ as var_35_553) :: []),((Int _ as var_36_554) :: []),(var_37_555 :: [])) :: [])) when ((((true) && ((isTrue (evalisExp((var_37_555 :: [])) config (-1)))))) && (true)) && (true) -> ((Bool false) :: [])
(*{| rule ``#compareA(`#uninit_OSL-SYNTAX`(.KList),#rs(_38))=>#token("false","Bool")`` requires isProps(_38) ensures #token("true","Bool") [UNIQUE_ID(3d06b5d8bbc519a63f29a65496be7d10f0a8f3866fc06c9ed988f8f18669a761) contentStartColumn(6) contentStartLine(142) org.kframework.attributes.Location(Location(142,6,142,41)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| ((KApply0(Lbl'Hash'uninit_OSL'Hyph'SYNTAX) :: []),(KApply1(Lbl'Hash'rs,(var_38_556 :: [])) :: [])) when (isTrue (evalisProps((var_38_556 :: [])) config (-1))) && (true) -> ((Bool false) :: [])
(*{| rule ``#compareA(#br(_27,_28,_29),#rs(_30))=>#token("false","Bool")`` requires `_andBool_`(`_andBool_`(`_andBool_`(isProps(_30),isInt(_28)),isInt(_27)),isExp(_29)) ensures #token("true","Bool") [UNIQUE_ID(f8dc40372ae2491282796ab5e0e871e0bef473cd0506b002a88dd9f32d6398a5) contentStartColumn(6) contentStartLine(149) org.kframework.attributes.Location(Location(149,6,149,44)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| ((KApply3(Lbl'Hash'br,((Int _ as var_27_557) :: []),((Int _ as var_28_558) :: []),(var_29_559 :: [])) :: []),(KApply1(Lbl'Hash'rs,(var_30_560 :: [])) :: [])) when (((((((isTrue (evalisProps((var_30_560 :: [])) config (-1)))) && (true))) && (true))) && ((isTrue (evalisExp((var_29_559 :: [])) config (-1))))) && (true) -> ((Bool false) :: [])
(*{| rule ``#compareA(#br(_39,_40,R1),#br(_41,_42,R1))=>#token("true","Bool")`` requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(_42),isInt(_41)),isExp(R1)),isInt(_40)),isInt(_39)) ensures #token("true","Bool") [UNIQUE_ID(3a701ade3c9370806a69025d9ddf6eb6cd444a1d6f96775ceaae3a97d5777cc1) contentStartColumn(6) contentStartLine(155) org.kframework.attributes.Location(Location(155,6,155,49)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| ((KApply3(Lbl'Hash'br,((Int _ as var_39_561) :: []),((Int _ as var_40_562) :: []),(varR1_563 :: [])) :: []),(KApply3(Lbl'Hash'br,((Int _ as var_41_564) :: []),((Int _ as var_42_565) :: []),(varR1_566 :: [])) :: [])) when ((((((((true) && (true))) && ((isTrue (evalisExp((varR1_563 :: [])) config (-1)))))) && (true))) && (true)) && (((compare_kitem varR1_563 varR1_566) = 0) && true) -> ((Bool true) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let rec eval'Hash'compareE (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'compareE and sort = 
SortBool in match c with 
| ((var_0_567),((Map (SortMap,_,_) as var_1_568) :: [])) when guard < 0(*{| rule ``#compareE(_0,M2)=>`_andBool_`(#compareA(Val,`Map:lookup`(M2,Key)),#compareE(M,M2))`` requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(Key,_0),#match(Val,`Map:lookup`(_0,Key))),#match(M,`_[_<-undef]`(_0,Key))),`_andBool_`(`_andBool_`(`_andBool_`(isKItem(Val),isInt(Key)),isMap(M2)),isMap(M))) ensures #token("true","Bool") [UNIQUE_ID(0b7f85aca7a11fd5043c7a9e7eb723baffd66061ed7184ef7250e8e807fefadc) contentStartColumn(6) contentStartLine(137) org.kframework.attributes.Location(Location(137,6,137,95)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
 -> (match (var_0_567) with 
| [Map (_,_,collection)] -> let choice = (KMap.fold (fun e v result -> if result == interned_bottom then (match e with | ((Int _ as var_3_569) :: []) as e11 -> (let e = ((evalMap'Coln'lookup((var_0_567),e11) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| (var_2_570 :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_567),e11) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| ((Map (SortMap,_,_) as var_4_571) :: []) when ((((((true) && (true))) && (true))) && (((((((true) && (true))) && (true))) && (true)))) && (true) -> ([Bool ((((isTrue (eval'Hash'compareA((var_2_570 :: []),((evalMap'Coln'lookup((var_1_568 :: []),e11) config (-1)))) config (-1)))) && ((isTrue (eval'Hash'compareE((var_4_571 :: []),(var_1_568 :: [])) config (-1))))))])| _ -> interned_bottom)| _ -> interned_bottom)| _ -> interned_bottom) else result) collection interned_bottom) in if choice == interned_bottom then (eval'Hash'compareE c config 0) else choice| _ -> (eval'Hash'compareE c config 0))
(*{| rule ``#compareE(_0,M2)=>#token("true","Bool")`` requires `_andBool_`(`_==K_`(`.Map`(.KList),_0),isMap(M2)) ensures #token("true","Bool") [UNIQUE_ID(9dd9f3c865cc3828cc2d7b0cbf7737160ea5c17bb248947dc39fb6db8c203704) contentStartColumn(6) contentStartLine(139) org.kframework.attributes.Location(Location(139,6,139,33)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| ((var_0_572),((Map (SortMap,_,_) as varM2_573) :: [])) when (((isTrue (eval_'EqlsEqls'K_(((Lazy.force const'Stop'Map)),(var_0_572)) config (-1)))) && (true)) && (true) -> ((Bool true) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalupdateMap (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblupdateMap and sort = 
SortMap in match c with 
| _ -> try MAP.hook_updateAll c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisNstateCellOpt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisNstateCellOpt and sort = 
SortBool in match c with 
(*{| rule ``isNstateCellOpt(#KToken(#token("NstateCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortNstateCell, var__574) :: [])) -> ((Bool true) :: [])
(*{| rule ``isNstateCellOpt(`<nstate>`(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'nstate'_GT_',((Int _ as varK0_575) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isNstateCellOpt(#KToken(#token("NstateCellOpt","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortNstateCellOpt, var__576) :: [])) -> ((Bool true) :: [])
(*{| rule ``isNstateCellOpt(noNstateCell(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(LblnoNstateCell) :: [])) -> ((Bool true) :: [])
(*{| rule ``isNstateCellOpt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_577)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'lock'LPar'_'Comm'_'RPar'_K'Hyph'IO (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'lock'LPar'_'Comm'_'RPar'_K'Hyph'IO and sort = 
SortK in match c with 
| _ -> try IO.hook_lock c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalfillList (c: k * k * k * k) (config: k) (guard: int) : k = let lbl = 
LblfillList and sort = 
SortList in match c with 
| _ -> try LIST.hook_fill c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize4 c)))])
let evalFunDefCellMapItem (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblFunDefCellMapItem and sort = 
SortFunDefCellMap in match c with 
| _ -> try MAP.hook_element c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval'Stop'StateCellMap (c: unit) (config: k) (guard: int) : k = let lbl = 
Lbl'Stop'StateCellMap and sort = 
SortStateCellMap in match c with 
| _ -> try MAP.hook_unit c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let const'Stop'StateCellMap : k Lazy.t = lazy (eval'Stop'StateCellMap () interned_bottom (-1))
let evalisTimerCellOpt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisTimerCellOpt and sort = 
SortBool in match c with 
(*{| rule ``isTimerCellOpt(`<timer>`(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'timer'_GT_',((Int _ as varK0_578) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isTimerCellOpt(#KToken(#token("TimerCellOpt","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortTimerCellOpt, var__579) :: [])) -> ((Bool true) :: [])
(*{| rule ``isTimerCellOpt(noTimerCell(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(LblnoTimerCell) :: [])) -> ((Bool true) :: [])
(*{| rule ``isTimerCellOpt(#KToken(#token("TimerCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortTimerCell, var__580) :: [])) -> ((Bool true) :: [])
(*{| rule ``isTimerCellOpt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_581)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_List_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_List_ and sort = 
SortList in match c with 
| _ -> try LIST.hook_concat c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let rec eval'Hash'inProps (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'inProps and sort = 
SortBool in match c with 
(*{| rule ``#inProps(P,#props(P,Ps))=>#token("true","Bool")`` requires isProp(P) ensures #token("true","Bool") [UNIQUE_ID(7d904d4a945a2770f200ff58eabde835d1381a8ab41222692300773a08f7e3ea) contentStartColumn(6) contentStartLine(87) org.kframework.attributes.Location(Location(87,6,87,40)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| ((varP_582 :: []),(KApply2(Lbl'Hash'props,(varP_583 :: []),(varPs_584)) :: [])) when (isTrue (evalisProp((varP_583 :: [])) config (-1))) && (((compare_kitem varP_583 varP_582) = 0) && true) -> ((Bool true) :: [])
(*{| rule ``#inProps(P1,#props(P,Ps))=>#inProps(P1,Ps)`` requires `_andBool_`(`_andBool_`(isProp(P1),isProps(Ps)),`_=/=K_`(P1,P)) ensures #token("true","Bool") [UNIQUE_ID(a5ac6df9d77b3382be77e4d7b14e5335ae7033d7d12a81a47d35ed487d0bae41) contentStartColumn(6) contentStartLine(88) org.kframework.attributes.Location(Location(88,6,89,24)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| ((varP1_585 :: []),(KApply2(Lbl'Hash'props,(varP_586),(varPs_587 :: [])) :: [])) when (((((isTrue (evalisProp((varP1_585 :: [])) config (-1)))) && ((isTrue (evalisProps((varPs_587 :: [])) config (-1)))))) && ((isTrue (eval_'EqlsSlshEqls'K_((varP1_585 :: []),(varP_586)) config (-1))))) && (true) -> ((eval'Hash'inProps((varP1_585 :: []),(varPs_587 :: [])) config (-1)))
(*{| rule ``#inProps(P,`.List{"#props"}`(.KList))=>#token("false","Bool")`` requires isProp(P) ensures #token("true","Bool") [UNIQUE_ID(2e5ba0768fe718792a322b49ee771c014ad4d2431ba988f102ab33ea4444302b) contentStartColumn(6) contentStartLine(90) org.kframework.attributes.Location(Location(90,6,90,34)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| ((varP_588 :: []),(KApply0(Lbl'Stop'List'LBraQuotHash'props'QuotRBra') :: [])) when (isTrue (evalisProp((varP_588 :: [])) config (-1))) && (true) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval'Hash'open'LPar'_'Comm'_'RPar'_K'Hyph'IO (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'open'LPar'_'Comm'_'RPar'_K'Hyph'IO and sort = 
SortInt in match c with 
| _ -> try IO.hook_open c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'PipeHyph_GT_'_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'PipeHyph_GT_'_ and sort = 
SortMap in match c with 
| _ -> try MAP.hook_element c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_xorBool__BOOL (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_xorBool__BOOL and sort = 
SortBool in match c with 
| _ -> try BOOL.hook_xor c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_xorBool__BOOL`(B,#token("false","Bool"))=>B`` requires isBool(B) ensures #token("true","Bool") [UNIQUE_ID(2eae84ae7b21312fecde18860149de73365b819e65aada5f952fc5b9101ae014) contentStartColumn(8) contentStartLine(313) org.kframework.attributes.Location(Location(313,8,313,38)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool _ as varB_589) :: []),((Bool false) :: [])) when true && (true) -> (varB_589 :: [])
(*{| rule `` `_xorBool__BOOL`(#token("false","Bool"),B)=>B`` requires isBool(B) ensures #token("true","Bool") [UNIQUE_ID(0b888132027262073a3306d90f4a55b0a4ea27984cd77fccd8bf29cd48efb665) contentStartColumn(8) contentStartLine(312) org.kframework.attributes.Location(Location(312,8,312,38)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool false) :: []),((Bool _ as varB_590) :: [])) when true && (true) -> (varB_590 :: [])
(*{| rule `` `_xorBool__BOOL`(B,B)=>#token("false","Bool")`` requires isBool(B) ensures #token("true","Bool") [UNIQUE_ID(70684b52edf7d3194cd01f6e5714b364631e8d96267df666bb689e5380e13cc4) contentStartColumn(8) contentStartLine(314) org.kframework.attributes.Location(Location(314,8,314,38)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool _ as varB_591) :: []),((Bool _ as varB_592) :: [])) when true && (((compare_kitem varB_591 varB_592) = 0) && true) -> ((Bool false) :: [])
(*{| rule `` `_xorBool__BOOL`(B1,B2)=>`notBool_`(`_==Bool__BOOL`(B1,B2))`` requires `_andBool_`(isBool(B2),isBool(B1)) ensures #token("true","Bool") [UNIQUE_ID(1c34683a46438798498c925345e696fc017c0665504d0877c44e540d820b1ec7) contentStartColumn(8) contentStartLine(315) org.kframework.attributes.Location(Location(315,8,315,57)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool _ as varB1_593) :: []),((Bool _ as varB2_594) :: [])) when ((true) && (true)) && (true) -> ([Bool ((not ((isTrue (eval_'EqlsEqls'Bool__BOOL((varB1_593 :: []),(varB2_594 :: [])) config (-1))))))])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'Hyph'Map__MAP (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'Hyph'Map__MAP and sort = 
SortMap in match c with 
| _ -> try MAP.hook_difference c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalsizeMap (c: k) (config: k) (guard: int) : k = let lbl = 
LblsizeMap and sort = 
SortInt in match c with 
| _ -> try MAP.hook_size c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'compareS (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'compareS and sort = 
SortBool in match c with 
(*{| rule ``#compareS(M1,M2)=>`_andBool_`(`_==Int_`(sizeMap(M1),sizeMap(M2)),#compareE(M1,M2))`` requires `_andBool_`(isMap(M1),isMap(M2)) ensures #token("true","Bool") [UNIQUE_ID(a9adf499ecfccfae9ca9c684a30f35871415c610c650a1dbf6265d0127e5a644) contentStartColumn(6) contentStartLine(135) org.kframework.attributes.Location(Location(135,6,135,85)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Map (SortMap,_,_) as varM1_595) :: []),((Map (SortMap,_,_) as varM2_596) :: [])) when ((true) && (true)) && (true) -> ([Bool ((((isTrue (eval_'EqlsEqls'Int_(((evalsizeMap((varM1_595 :: [])) config (-1))),((evalsizeMap((varM2_596 :: [])) config (-1)))) config (-1)))) && ((isTrue (eval'Hash'compareE((varM1_595 :: []),(varM2_596 :: [])) config (-1))))))])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisIndexesCellOpt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisIndexesCellOpt and sort = 
SortBool in match c with 
(*{| rule ``isIndexesCellOpt(#KToken(#token("IndexesCellOpt","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortIndexesCellOpt, var__597) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIndexesCellOpt(`<indexes>`(K0))=>#token("true","Bool")`` requires isIndexes(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'indexes'_GT_',(varK0_598 :: [])) :: [])) when (isTrue (evalisIndexes((varK0_598 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isIndexesCellOpt(#KToken(#token("IndexesCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortIndexesCell, var__599) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIndexesCellOpt(noIndexesCell(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(LblnoIndexesCell) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIndexesCellOpt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_600)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalinitStoreCell (c: unit) (config: k) (guard: int) : k = let lbl = 
LblinitStoreCell and sort = 
SortStoreCell in match c with 
(*{| rule ``initStoreCell(.KList)=>`<store>`(`.Map`(.KList))`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(ad2d78eb8f5b4d8eacd89e8cad5b23cc3232e1c0f2b77f28f32d8a601431c266) initializer()]|}*)
| () -> (KApply1(Lbl'_LT_'store'_GT_',((Lazy.force const'Stop'Map))) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let constinitStoreCell : k Lazy.t = lazy (evalinitStoreCell () interned_bottom (-1))
let eval'Hash'sort (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'sort and sort = 
SortString in match c with 
| _ -> try KREFLECTION.hook_sort c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisIndexCellOpt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisIndexCellOpt and sort = 
SortBool in match c with 
(*{| rule ``isIndexCellOpt(#KToken(#token("IndexCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortIndexCell, var__601) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIndexCellOpt(noIndexCell(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(LblnoIndexCell) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIndexCellOpt(#KToken(#token("IndexCellOpt","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortIndexCellOpt, var__602) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIndexCellOpt(`<index>`(K0))=>#token("true","Bool")`` requires isInt(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'index'_GT_',((Int _ as varK0_603) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isIndexCellOpt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_604)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'open'LPar'_'RPar'_K'Hyph'IO (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'open'LPar'_'RPar'_K'Hyph'IO and sort = 
SortInt in match c with 
(*{| rule `` `#open(_)_K-IO`(S)=>`#open(_,_)_K-IO`(S,#token("\"r+\"","String"))`` requires isString(S) ensures #token("true","Bool") [UNIQUE_ID(ed7ee74167faa7f8e3a152e9e495d112a67407097a0bb306ac17e2ce4bebf100) contentStartColumn(8) contentStartLine(902) org.kframework.attributes.Location(Location(902,8,902,48)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((String _ as varS_605) :: [])) when true && (true) -> ((eval'Hash'open'LPar'_'Comm'_'RPar'_K'Hyph'IO((varS_605 :: []),((String "r+") :: [])) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalreplaceFirst'LPar'_'Comm'_'Comm'_'RPar'_STRING (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblreplaceFirst'LPar'_'Comm'_'Comm'_'RPar'_STRING and sort = 
SortString in match c with 
| _ -> try STRING.hook_replaceFirst c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `replaceFirst(_,_,_)_STRING`(Source,ToReplace,Replacement)=>`_+String__STRING`(`_+String__STRING`(substrString(Source,#token("0","Int"),findString(Source,ToReplace,#token("0","Int"))),Replacement),substrString(Source,`_+Int_`(findString(Source,ToReplace,#token("0","Int")),lengthString(ToReplace)),lengthString(Source)))`` requires `_andBool_`(`_andBool_`(`_andBool_`(isString(Replacement),isString(Source)),isString(ToReplace)),`_>=Int__INT`(findString(Source,ToReplace,#token("0","Int")),#token("0","Int"))) ensures #token("true","Bool") [UNIQUE_ID(4941a93fc06d65bd530ddbfcaabb498d40e247effd559cda2d85e65d73692b70) contentStartColumn(8) contentStartLine(563) org.kframework.attributes.Location(Location(563,8,565,66)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (((String _ as varSource_606) :: []),((String _ as varToReplace_607) :: []),((String _ as varReplacement_608) :: [])) when ((((((true) && (true))) && (true))) && ((isTrue (eval_'_GT_Eqls'Int__INT(((evalfindString((varSource_606 :: []),(varToReplace_607 :: []),((Lazy.force int0) :: [])) config (-1))),((Lazy.force int0) :: [])) config (-1))))) && (true) -> ((eval_'Plus'String__STRING(((eval_'Plus'String__STRING(((evalsubstrString((varSource_606 :: []),((Lazy.force int0) :: []),((evalfindString((varSource_606 :: []),(varToReplace_607 :: []),((Lazy.force int0) :: [])) config (-1)))) config (-1))),(varReplacement_608 :: [])) config (-1))),((evalsubstrString((varSource_606 :: []),((eval_'Plus'Int_(((evalfindString((varSource_606 :: []),(varToReplace_607 :: []),((Lazy.force int0) :: [])) config (-1))),((evallengthString((varToReplace_607 :: [])) config (-1)))) config (-1))),((evallengthString((varSource_606 :: [])) config (-1)))) config (-1)))) config (-1)))
(*{| rule `` `replaceFirst(_,_,_)_STRING`(Source,ToReplace,_14)=>Source`` requires `_andBool_`(`_andBool_`(`_andBool_`(isString(_14),isString(Source)),isString(ToReplace)),`_<Int__INT`(findString(Source,ToReplace,#token("0","Int")),#token("0","Int"))) ensures #token("true","Bool") [UNIQUE_ID(4320c56cb2a4f4c70e2500eb8f33dab497a5bb09aa847e4e0c0ae496ab671040) contentStartColumn(8) contentStartLine(566) org.kframework.attributes.Location(Location(566,8,567,57)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (((String _ as varSource_609) :: []),((String _ as varToReplace_610) :: []),((String _ as var_14_611) :: [])) when ((((((true) && (true))) && (true))) && ((isTrue (eval_'_LT_'Int__INT(((evalfindString((varSource_609 :: []),(varToReplace_610 :: []),((Lazy.force int0) :: [])) config (-1))),((Lazy.force int0) :: [])) config (-1))))) && (true) -> (varSource_609 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let eval'Hash'putc'LPar'_'Comm'_'RPar'_K'Hyph'IO (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'putc'LPar'_'Comm'_'RPar'_K'Hyph'IO and sort = 
SortK in match c with 
| _ -> try IO.hook_putc c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisTmpCellOpt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisTmpCellOpt and sort = 
SortBool in match c with 
(*{| rule ``isTmpCellOpt(`<tmp>`(K0))=>#token("true","Bool")`` requires isList(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'tmp'_GT_',((List (SortList,_,_) as varK0_612) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isTmpCellOpt(#KToken(#token("TmpCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortTmpCell, var__613) :: [])) -> ((Bool true) :: [])
(*{| rule ``isTmpCellOpt(#KToken(#token("TmpCellOpt","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortTmpCellOpt, var__614) :: [])) -> ((Bool true) :: [])
(*{| rule ``isTmpCellOpt(noTmpCell(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(LblnoTmpCell) :: [])) -> ((Bool true) :: [])
(*{| rule ``isTmpCellOpt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_615)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'logToFile (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'logToFile and sort = 
SortK in match c with 
| _ -> try IO.hook_log c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval'Hash'read'LPar'_'Comm'_'RPar'_K'Hyph'IO (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'read'LPar'_'Comm'_'RPar'_K'Hyph'IO and sort = 
SortString in match c with 
| _ -> try IO.hook_read c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisKCellOpt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisKCellOpt and sort = 
SortBool in match c with 
(*{| rule ``isKCellOpt(#KToken(#token("KCellOpt","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortKCellOpt, var__616) :: [])) -> ((Bool true) :: [])
(*{| rule ``isKCellOpt(#KToken(#token("KCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortKCell, var__617) :: [])) -> ((Bool true) :: [])
(*{| rule ``isKCellOpt(`<k>`(K0))=>#token("true","Bool")`` requires isK(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'k'_GT_',(varK0_618)) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isKCellOpt(noKCell(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(LblnoKCell) :: [])) -> ((Bool true) :: [])
(*{| rule ``isKCellOpt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_619)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisEnvCellOpt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisEnvCellOpt and sort = 
SortBool in match c with 
(*{| rule ``isEnvCellOpt(noEnvCell(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(LblnoEnvCell) :: [])) -> ((Bool true) :: [])
(*{| rule ``isEnvCellOpt(#KToken(#token("EnvCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortEnvCell, var__620) :: [])) -> ((Bool true) :: [])
(*{| rule ``isEnvCellOpt(`<env>`(K0))=>#token("true","Bool")`` requires isMap(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'env'_GT_',((Map (SortMap,_,_) as varK0_621) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isEnvCellOpt(#KToken(#token("EnvCellOpt","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortEnvCellOpt, var__622) :: [])) -> ((Bool true) :: [])
(*{| rule ``isEnvCellOpt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_623)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisStackCellOpt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisStackCellOpt and sort = 
SortBool in match c with 
(*{| rule ``isStackCellOpt(noStackCell(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(LblnoStackCell) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStackCellOpt(#KToken(#token("StackCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStackCell, var__624) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStackCellOpt(`<stack>`(K0))=>#token("true","Bool")`` requires isList(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'stack'_GT_',((List (SortList,_,_) as varK0_625) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isStackCellOpt(#KToken(#token("StackCellOpt","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStackCellOpt, var__626) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStackCellOpt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_627)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisWriteCellOpt (c: k) (config: k) (guard: int) : k = let lbl = 
LblisWriteCellOpt and sort = 
SortBool in match c with 
(*{| rule ``isWriteCellOpt(`<write>`(K0))=>#token("true","Bool")`` requires isSet(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'write'_GT_',((Set (SortSet,_,_) as varK0_628) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isWriteCellOpt(#KToken(#token("WriteCellOpt","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortWriteCellOpt, var__629) :: [])) -> ((Bool true) :: [])
(*{| rule ``isWriteCellOpt(#KToken(#token("WriteCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortWriteCell, var__630) :: [])) -> ((Bool true) :: [])
(*{| rule ``isWriteCellOpt(noWriteCell(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(LblnoWriteCell) :: [])) -> ((Bool true) :: [])
(*{| rule ``isWriteCellOpt(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_631)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisStateCellFragment (c: k) (config: k) (guard: int) : k = let lbl = 
LblisStateCellFragment and sort = 
SortBool in match c with 
(*{| rule ``isStateCellFragment(#KToken(#token("StateCellFragment","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStateCellFragment, var__632) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStateCellFragment(`<state>-fragment`(K0,K1,K2,K3,K4,K5,K6,K7))=>#token("true","Bool")`` requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isIndexCellOpt(K0),isKCellOpt(K1)),isEnvCellOpt(K2)),isStoreCellOpt(K3)),isStackCellOpt(K4)),isWriteCellOpt(K5)),isTimerCellOpt(K6)),isIndexesCellOpt(K7)) ensures #token("true","Bool") []|}*)
| ((KApply8(Lbl'_LT_'state'_GT_Hyph'fragment,(varK0_633 :: []),(varK1_634 :: []),(varK2_635 :: []),(varK3_636 :: []),(varK4_637 :: []),(varK5_638 :: []),(varK6_639 :: []),(varK7_640 :: [])) :: [])) when (((((((((((((((isTrue (evalisIndexCellOpt((varK0_633 :: [])) config (-1)))) && ((isTrue (evalisKCellOpt((varK1_634 :: [])) config (-1)))))) && ((isTrue (evalisEnvCellOpt((varK2_635 :: [])) config (-1)))))) && ((isTrue (evalisStoreCellOpt((varK3_636 :: [])) config (-1)))))) && ((isTrue (evalisStackCellOpt((varK4_637 :: [])) config (-1)))))) && ((isTrue (evalisWriteCellOpt((varK5_638 :: [])) config (-1)))))) && ((isTrue (evalisTimerCellOpt((varK6_639 :: [])) config (-1)))))) && ((isTrue (evalisIndexesCellOpt((varK7_640 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isStateCellFragment(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_641)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalId2String (c: k) (config: k) (guard: int) : k = let lbl = 
LblId2String and sort = 
SortString in match c with 
| _ -> try STRING.hook_token2string c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisBranchTmp (c: k) (config: k) (guard: int) : k = let lbl = 
LblisBranchTmp and sort = 
SortBool in match c with 
(*{| rule ``isBranchTmp(#KToken(#token("BranchTmp","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortBranchTmp, var__642) :: [])) -> ((Bool true) :: [])
(*{| rule ``isBranchTmp(#secondBranch(K0))=>#token("true","Bool")`` requires isBlocks(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'secondBranch,(varK0_643 :: [])) :: [])) when (isTrue (evalisBlocks((varK0_643 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isBranchTmp(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_644)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_FunDefCellMap_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_FunDefCellMap_ and sort = 
SortFunDefCellMap in match c with 
| _ -> try MAP.hook_concat c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalfreshInt (c: k) (config: k) (guard: int) : k = let lbl = 
LblfreshInt and sort = 
SortInt in match c with 
(*{| rule ``freshInt(I)=>I`` requires isInt(I) ensures #token("true","Bool") [UNIQUE_ID(d7221da1fa6b633137e79279efd265a289ea7e8496612615f43546422d446bc4) contentStartColumn(8) contentStartLine(412) org.kframework.attributes.Location(Location(412,8,412,28)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Int _ as varI_645) :: [])) when true && (true) -> (varI_645 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let freshFunction (sort: string) (config: k) (counter: Z.t) : k = match sort with 
| "Id" -> (evalfreshId ([Int counter]) config (-1))
| "Int" -> (evalfreshInt ([Int counter]) config (-1))
| _ -> invalid_arg ("Cannot find fresh function for sort " ^ sort)let eval'Hash'fresh (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'fresh and sort = 
SortKItem in match c with 
| _ -> try KREFLECTION.hook_fresh c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalMap'Coln'choice (c: k) (config: k) (guard: int) : k = let lbl = 
LblMap'Coln'choice and sort = 
SortKItem in match c with 
| _ -> try MAP.hook_choice c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_impliesBool__BOOL (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_impliesBool__BOOL and sort = 
SortBool in match c with 
| _ -> try BOOL.hook_implies c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_impliesBool__BOOL`(#token("true","Bool"),B)=>B`` requires isBool(B) ensures #token("true","Bool") [UNIQUE_ID(278435b95efb1a1ce04f6d701b12e6438c3cf3aee8019b41ea93b05755d379d7) contentStartColumn(8) contentStartLine(327) org.kframework.attributes.Location(Location(327,8,327,36)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool true) :: []),((Bool _ as varB_646) :: [])) when true && (true) -> (varB_646 :: [])
(*{| rule `` `_impliesBool__BOOL`(B,#token("false","Bool"))=>`notBool_`(B)`` requires isBool(B) ensures #token("true","Bool") [UNIQUE_ID(0129e06009c7500aefab482e1bc8e348010c6bd01acd15725172192c05a70831) contentStartColumn(8) contentStartLine(330) org.kframework.attributes.Location(Location(330,8,330,45)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool _ as varB_647) :: []),((Bool false) :: [])) when true && (true) -> ([Bool ((not ((isTrue [varB_647]))))])
(*{| rule `` `_impliesBool__BOOL`(#token("false","Bool"),_7)=>#token("true","Bool")`` requires isBool(_7) ensures #token("true","Bool") [UNIQUE_ID(3497d026ef9468fdac7e6b5de6841fad0118b17ca073ba25af4c5d8573a167b2) contentStartColumn(8) contentStartLine(328) org.kframework.attributes.Location(Location(328,8,328,40)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool false) :: []),((Bool _ as var_7_648) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule `` `_impliesBool__BOOL`(_4,#token("true","Bool"))=>#token("true","Bool")`` requires isBool(_4) ensures #token("true","Bool") [UNIQUE_ID(7fdeea13463fa86d05e4d5bfb9e9c627b90ab57930f712fef1bfc08543a87d74) contentStartColumn(8) contentStartLine(329) org.kframework.attributes.Location(Location(329,8,329,39)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool _ as var_4_649) :: []),((Bool true) :: [])) when true && (true) -> ((Bool true) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval'Hash'getc'LPar'_'RPar'_K'Hyph'IO (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'getc'LPar'_'RPar'_K'Hyph'IO and sort = 
SortInt in match c with 
| _ -> try IO.hook_getc c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_Set_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_Set_ and sort = 
SortSet in match c with 
| _ -> try SET.hook_concat c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalinitTmpCell (c: unit) (config: k) (guard: int) : k = let lbl = 
LblinitTmpCell and sort = 
SortTmpCell in match c with 
(*{| rule ``initTmpCell(.KList)=>`<tmp>`(`.List`(.KList))`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(b87fe2bc8b821fb29f4fa5896da7b2b6af1a56197c53730e423c4d62b2347a97) initializer()]|}*)
| () -> (KApply1(Lbl'_LT_'tmp'_GT_',((Lazy.force const'Stop'List))) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let constinitTmpCell : k Lazy.t = lazy (evalinitTmpCell () interned_bottom (-1))
let eval_'Star'Int__INT (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'Star'Int__INT and sort = 
SortInt in match c with 
| _ -> try INT.hook_mul c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalmaxInt'LPar'_'Comm'_'RPar'_INT (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblmaxInt'LPar'_'Comm'_'RPar'_INT and sort = 
SortInt in match c with 
| _ -> try INT.hook_max c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval'Hash'unwrapInt (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'unwrapInt and sort = 
SortInt in match c with 
(*{| rule ``#unwrapInt(I)=>I`` requires isInt(I) ensures #token("true","Bool") [UNIQUE_ID(faac54f9e408a78e41fdcf910c924005fa839c43b44ba28eec55f7d42f4ee06b) contentStartColumn(6) contentStartLine(361) org.kframework.attributes.Location(Location(361,6,361,28)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Int _ as varI_650) :: [])) when true && (true) -> (varI_650 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Tild'Int__INT (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Tild'Int__INT and sort = 
SortInt in match c with 
| _ -> try INT.hook_not c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalListItem (c: k) (config: k) (guard: int) : k = let lbl = 
LblListItem and sort = 
SortList in match c with 
| _ -> try LIST.hook_element c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let rec eval'Hash'list2Set (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'list2Set and sort = 
SortSet in match c with 
(*{| rule ``#list2Set(`_List_`(`ListItem`(E),L))=>`_Set_`(`SetItem`(E),#list2Set(L))`` requires `_andBool_`(isKItem(E),isList(L)) ensures #token("true","Bool") [UNIQUE_ID(393ad3cdede7d78787bc70867c479331dfd163148c86e813eb128007718df8d7) contentStartColumn(6) contentStartLine(96) org.kframework.attributes.Location(Location(96,6,96,62)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((List (SortList, Lbl_List_, (varE_651 :: []) :: varL_652)) :: [])) when ((true) && (true)) && (true) -> ((eval_Set_(((evalSetItem((varE_651 :: [])) config (-1))),((eval'Hash'list2Set(((List (SortList, Lbl_List_, varL_652)) :: [])) config (-1)))) config (-1)))
(*{| rule ``#list2Set(`.List`(.KList))=>`.Set`(.KList)`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(1e92f79185840dcaeae8877f0712e7bc1bc9b794efe58dbe049fafc4fba90475) contentStartColumn(6) contentStartLine(95) org.kframework.attributes.Location(Location(95,6,95,30)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((List (SortList, Lbl_List_, [])) :: [])) -> ((Lazy.force const'Stop'Set))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'_LT_Eqls'String__STRING (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_LT_Eqls'String__STRING and sort = 
SortBool in match c with 
| _ -> try STRING.hook_le c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_<=String__STRING`(S1,S2)=>`notBool_`(`_<String__STRING`(S2,S1))`` requires `_andBool_`(isString(S2),isString(S1)) ensures #token("true","Bool") [UNIQUE_ID(2c1110a97c0d904a19992e4eac695692515cb703f5d689aaa6945290a696d662) contentStartColumn(8) contentStartLine(549) org.kframework.attributes.Location(Location(549,8,549,63)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((String _ as varS1_653) :: []),((String _ as varS2_654) :: [])) when ((true) && (true)) && (true) -> ([Bool ((not ((isTrue (eval_'_LT_'String__STRING((varS2_654 :: []),(varS1_653 :: [])) config (-1))))))])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalordChar (c: k) (config: k) (guard: int) : k = let lbl = 
LblordChar and sort = 
SortInt in match c with 
| _ -> try STRING.hook_ord c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalrfindString (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblrfindString and sort = 
SortInt in match c with 
| _ -> try STRING.hook_rfind c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let rec evalrfindChar (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblrfindChar and sort = 
SortInt in match c with 
| _ -> try STRING.hook_rfindChar c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule ``rfindChar(S1,S2,I)=>`maxInt(_,_)_INT`(rfindString(S1,substrString(S2,#token("0","Int"),#token("1","Int")),I),rfindChar(S1,substrString(S2,#token("1","Int"),lengthString(S2)),I))`` requires `_andBool_`(`_andBool_`(`_andBool_`(isInt(I),isString(S2)),isString(S1)),`_=/=String__STRING`(S2,#token("\"\"","String"))) ensures #token("true","Bool") [UNIQUE_ID(dea96adb63c0d77626a51f08fb7a6daf76e3a7b8d0205f5285542c1160f2ddeb) contentStartColumn(8) contentStartLine(555) org.kframework.attributes.Location(Location(555,8,555,182)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (((String _ as varS1_655) :: []),((String _ as varS2_656) :: []),((Int _ as varI_657) :: [])) when ((((((true) && (true))) && (true))) && ((isTrue (eval_'EqlsSlshEqls'String__STRING((varS2_656 :: []),((String "") :: [])) config (-1))))) && (true) -> ((evalmaxInt'LPar'_'Comm'_'RPar'_INT(((evalrfindString((varS1_655 :: []),((evalsubstrString((varS2_656 :: []),((Lazy.force int0) :: []),((Lazy.force int1) :: [])) config (-1))),(varI_657 :: [])) config (-1))),((evalrfindChar((varS1_655 :: []),((evalsubstrString((varS2_656 :: []),((Lazy.force int1) :: []),((evallengthString((varS2_656 :: [])) config (-1)))) config (-1))),(varI_657 :: [])) config (-1)))) config (-1)))
(*{| rule ``rfindChar(_17,#token("\"\"","String"),_18)=>#token("-1","Int")`` requires `_andBool_`(isInt(_18),isString(_17)) ensures #token("true","Bool") [UNIQUE_ID(04cb290eea9d7c93a48f761cab20217a689222a306098df1120917b013944330) contentStartColumn(8) contentStartLine(556) org.kframework.attributes.Location(Location(556,8,556,33)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((String _ as var_17_658) :: []),((String "") :: []),((Int _ as var_18_659) :: [])) when ((true) && (true)) && (true) -> ((Lazy.force int'Hyph'1) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalisIndexItem (c: k) (config: k) (guard: int) : k = let lbl = 
LblisIndexItem and sort = 
SortBool in match c with 
(*{| rule ``isIndexItem(`#increaseTimer_OSL`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'increaseTimer_OSL) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIndexItem(`#increaseIndex_OSL`(.KList))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KApply0(Lbl'Hash'increaseIndex_OSL) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIndexItem(#KToken(#token("IndexItem","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortIndexItem, var__660) :: [])) -> ((Bool true) :: [])
(*{| rule ``isIndexItem(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_661)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_Map_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_Map_ and sort = 
SortMap in match c with 
| _ -> try MAP.hook_concat c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalproject'Coln'Stmts (c: k) (config: k) (guard: int) : k = let lbl = 
Lblproject'Coln'Stmts and sort = 
SortStmts in match c with 
(*{| rule `` `project:Stmts`(K)=>K`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(645f9d37511efdeada64e636036fcb47e0a28ed34a19d3d37b6fc608f8ebb1b4) projection()]|}*)
| ((varK_662 :: [])) -> (varK_662 :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evaldirectionalityChar (c: k) (config: k) (guard: int) : k = let lbl = 
LbldirectionalityChar and sort = 
SortString in match c with 
| _ -> try STRING.hook_directionality c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalFloat2String (c: k) (config: k) (guard: int) : k = let lbl = 
LblFloat2String and sort = 
SortString in match c with 
| _ -> try STRING.hook_float2string c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'opendir'LPar'_'RPar'_K'Hyph'IO (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'opendir'LPar'_'RPar'_K'Hyph'IO and sort = 
SortKItem in match c with 
| _ -> try IO.hook_opendir c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalinitKCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblinitKCell and sort = 
SortKCell in match c with 
(*{| rule ``initKCell(Init)=>`<k>`(`project:Stmts`(`Map:lookup`(Init,#token("$PGM","KConfigVar"))))`` requires isStmts(`project:Stmts`(`Map:lookup`(Init,#token("$PGM","KConfigVar")))) ensures #token("true","Bool") [UNIQUE_ID(7044714313dcd361938c82b5df16fd8d6dc625dfbf3580544488482feea62cb1) initializer()]|}*)
| (((Map (SortMap,_,_) as varInit_663) :: [])) when (isTrue (evalisStmts(((evalproject'Coln'Stmts(((evalMap'Coln'lookup((varInit_663 :: []),(KToken (SortKConfigVar, "$PGM") :: [])) config (-1)))) config (-1)))) config (-1))) && (true) -> (KApply1(Lbl'_LT_'k'_GT_',((evalproject'Coln'Stmts(((evalMap'Coln'lookup((varInit_663 :: []),(KToken (SortKConfigVar, "$PGM") :: [])) config (-1)))) config (-1)))) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisDItem (c: k) (config: k) (guard: int) : k = let lbl = 
LblisDItem and sort = 
SortBool in match c with 
(*{| rule ``isDItem(#KToken(#token("DItem","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortDItem, var__664) :: [])) -> ((Bool true) :: [])
(*{| rule ``isDItem(#Deallocate(K0))=>#token("true","Bool")`` requires isExp(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'Deallocate,(varK0_665 :: [])) :: [])) when (isTrue (evalisExp((varK0_665 :: [])) config (-1))) && (true) -> ((Bool true) :: [])
(*{| rule ``isDItem(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_666)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalsizeList (c: k) (config: k) (guard: int) : k = let lbl = 
LblsizeList and sort = 
SortInt in match c with 
| _ -> try LIST.hook_size c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisStateCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisStateCell and sort = 
SortBool in match c with 
(*{| rule ``isStateCell(`<state>`(K0,K1,K2,K3,K4,K5,K6,K7))=>#token("true","Bool")`` requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isIndexCell(K0),isKCell(K1)),isEnvCell(K2)),isStoreCell(K3)),isStackCell(K4)),isWriteCell(K5)),isTimerCell(K6)),isIndexesCell(K7)) ensures #token("true","Bool") []|}*)
| ((KApply8(Lbl'_LT_'state'_GT_',(varK0_667 :: []),(varK1_668 :: []),(varK2_669 :: []),(varK3_670 :: []),(varK4_671 :: []),(varK5_672 :: []),(varK6_673 :: []),(varK7_674 :: [])) :: [])) when (((((((((((((((isTrue (evalisIndexCell((varK0_667 :: [])) config (-1)))) && ((isTrue (evalisKCell((varK1_668 :: [])) config (-1)))))) && ((isTrue (evalisEnvCell((varK2_669 :: [])) config (-1)))))) && ((isTrue (evalisStoreCell((varK3_670 :: [])) config (-1)))))) && ((isTrue (evalisStackCell((varK4_671 :: [])) config (-1)))))) && ((isTrue (evalisWriteCell((varK5_672 :: [])) config (-1)))))) && ((isTrue (evalisTimerCell((varK6_673 :: [])) config (-1)))))) && ((isTrue (evalisIndexesCell((varK7_674 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isStateCell(#KToken(#token("StateCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStateCell, var__675) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStateCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_676)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'EqlsSlshEqls'Bool__BOOL (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'EqlsSlshEqls'Bool__BOOL and sort = 
SortBool in match c with 
| _ -> try BOOL.hook_ne c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_=/=Bool__BOOL`(B1,B2)=>`notBool_`(`_==Bool__BOOL`(B1,B2))`` requires `_andBool_`(isBool(B2),isBool(B1)) ensures #token("true","Bool") [UNIQUE_ID(229c060a3ad56352e70dadb0089a132434aa77f4aaf4ef46e44d820031a08b83) contentStartColumn(8) contentStartLine(332) org.kframework.attributes.Location(Location(332,8,332,57)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Bool _ as varB1_677) :: []),((Bool _ as varB2_678) :: [])) when ((true) && (true)) && (true) -> ([Bool ((not ((isTrue (eval_'EqlsEqls'Bool__BOOL((varB1_677 :: []),(varB2_678 :: [])) config (-1))))))])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalremoveAll (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblremoveAll and sort = 
SortMap in match c with 
| _ -> try MAP.hook_removeAll c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisTCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisTCell and sort = 
SortBool in match c with 
(*{| rule ``isTCell(#KToken(#token("TCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortTCell, var__679) :: [])) -> ((Bool true) :: [])
(*{| rule ``isTCell(`<T>`(K0,K1,K2,K3))=>#token("true","Bool")`` requires `_andBool_`(`_andBool_`(`_andBool_`(isStatesCell(K0),isNstateCell(K1)),isTmpCell(K2)),isFunDefsCell(K3)) ensures #token("true","Bool") []|}*)
| ((KApply4(Lbl'_LT_'T'_GT_',(varK0_680 :: []),(varK1_681 :: []),(varK2_682 :: []),(varK3_683 :: [])) :: [])) when (((((((isTrue (evalisStatesCell((varK0_680 :: [])) config (-1)))) && ((isTrue (evalisNstateCell((varK1_681 :: [])) config (-1)))))) && ((isTrue (evalisTmpCell((varK2_682 :: [])) config (-1)))))) && ((isTrue (evalisFunDefsCell((varK3_683 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isTCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_684)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisFunDefCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblisFunDefCell and sort = 
SortBool in match c with 
(*{| rule ``isFunDefCell(#KToken(#token("FunDefCell","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortFunDefCell, var__685) :: [])) -> ((Bool true) :: [])
(*{| rule ``isFunDefCell(`<funDef>`(K0,K1,K2,K3))=>#token("true","Bool")`` requires `_andBool_`(`_andBool_`(`_andBool_`(isFnameCell(K0),isFparamsCell(K1)),isFretCell(K2)),isFbodyCell(K3)) ensures #token("true","Bool") []|}*)
| ((KApply4(Lbl'_LT_'funDef'_GT_',(varK0_686 :: []),(varK1_687 :: []),(varK2_688 :: []),(varK3_689 :: [])) :: [])) when (((((((isTrue (evalisFnameCell((varK0_686 :: [])) config (-1)))) && ((isTrue (evalisFparamsCell((varK1_687 :: [])) config (-1)))))) && ((isTrue (evalisFretCell((varK2_688 :: [])) config (-1)))))) && ((isTrue (evalisFbodyCell((varK3_689 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isFunDefCell(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_690)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalinitStackCell (c: unit) (config: k) (guard: int) : k = let lbl = 
LblinitStackCell and sort = 
SortStackCell in match c with 
(*{| rule ``initStackCell(.KList)=>`<stack>`(`.List`(.KList))`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(541ed12e6094c5492d5540f8b92537953ad450f6c7d953c5852a2739fe99b548) initializer()]|}*)
| () -> (KApply1(Lbl'_LT_'stack'_GT_',((Lazy.force const'Stop'List))) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let constinitStackCell : k Lazy.t = lazy (evalinitStackCell () interned_bottom (-1))
let evalinitIndexCell (c: unit) (config: k) (guard: int) : k = let lbl = 
LblinitIndexCell and sort = 
SortIndexCell in match c with 
(*{| rule ``initIndexCell(.KList)=>`<index>`(#token("0","Int"))`` requires isInt(#token("0","Int")) ensures #token("true","Bool") [UNIQUE_ID(6a6d941c66802a68315e5326b0f4c92bdef9b16e3ce5d48cd95e8d2f47530487) initializer()]|}*)
| () when (isTrue (evalisInt(((Lazy.force int0) :: [])) config (-1))) && (true) -> (KApply1(Lbl'_LT_'index'_GT_',((Lazy.force int0) :: [])) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let constinitIndexCell : k Lazy.t = lazy (evalinitIndexCell () interned_bottom (-1))
let evalinitTimerCell (c: unit) (config: k) (guard: int) : k = let lbl = 
LblinitTimerCell and sort = 
SortTimerCell in match c with 
(*{| rule ``initTimerCell(.KList)=>`<timer>`(#token("0","Int"))`` requires isInt(#token("0","Int")) ensures #token("true","Bool") [UNIQUE_ID(d7d038a6b57b879430ad7e60ee865e268861d91aae4076961a1db0cfc2c09e69) initializer()]|}*)
| () when (isTrue (evalisInt(((Lazy.force int0) :: [])) config (-1))) && (true) -> (KApply1(Lbl'_LT_'timer'_GT_',((Lazy.force int0) :: [])) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let constinitTimerCell : k Lazy.t = lazy (evalinitTimerCell () interned_bottom (-1))
let evalinitStateCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblinitStateCell and sort = 
SortStateCell in match c with 
(*{| rule ``initStateCell(Init)=>`StateCellMapItem`(initIndexCell(.KList),`<state>`(initIndexCell(.KList),initKCell(Init),initEnvCell(.KList),initStoreCell(.KList),initStackCell(.KList),initWriteCell(.KList),initTimerCell(.KList),initIndexesCell(.KList)))`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(d3979b11522d27c726949992ffa0877a26467b8dde8a1489a468a075e5061164) initializer()]|}*)
| (((Map (SortMap,_,_) as varInit_691) :: [])) -> ((evalStateCellMapItem(((Lazy.force constinitIndexCell)),(KApply8(Lbl'_LT_'state'_GT_',((Lazy.force constinitIndexCell)),((evalinitKCell((varInit_691 :: [])) config (-1))),((Lazy.force constinitEnvCell)),((Lazy.force constinitStoreCell)),((Lazy.force constinitStackCell)),((Lazy.force constinitWriteCell)),((Lazy.force constinitTimerCell)),((Lazy.force constinitIndexesCell))) :: [])) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalinitStatesCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblinitStatesCell and sort = 
SortStatesCell in match c with 
(*{| rule ``initStatesCell(Init)=>`<states>`(initStateCell(Init))`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(960460b008f7b3e7af2be1408204327dc27be2c43ef5195e35225cdb633393fb) initializer()]|}*)
| (((Map (SortMap,_,_) as varInit_692) :: [])) -> (KApply1(Lbl'_LT_'states'_GT_',((evalinitStateCell((varInit_692 :: [])) config (-1)))) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalinitTCell (c: k) (config: k) (guard: int) : k = let lbl = 
LblinitTCell and sort = 
SortTCell in match c with 
(*{| rule ``initTCell(Init)=>`<T>`(initStatesCell(Init),initNstateCell(.KList),initTmpCell(.KList),initFunDefsCell(.KList))`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(bc4a2ec2511a678fed78f752ce4f4bfcf9fa756884ae5b89b28cc3804b4b0868) initializer()]|}*)
| (((Map (SortMap,_,_) as varInit_693) :: [])) -> (KApply4(Lbl'_LT_'T'_GT_',((evalinitStatesCell((varInit_693 :: [])) config (-1))),((Lazy.force constinitNstateCell)),((Lazy.force constinitTmpCell)),((Lazy.force constinitFunDefsCell))) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalFloatFormat (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblFloatFormat and sort = 
SortString in match c with 
| _ -> try STRING.hook_floatFormat c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'Xor_Perc'Int___INT (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'Xor_Perc'Int___INT and sort = 
SortInt in match c with 
| _ -> try INT.hook_powmod c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let eval_'Pipe'Int__INT (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'Pipe'Int__INT and sort = 
SortInt in match c with 
| _ -> try INT.hook_or c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_dividesInt__INT (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_dividesInt__INT and sort = 
SortBool in match c with 
(*{| rule `` `_dividesInt__INT`(I1,I2)=>`_==Int_`(`_%Int__INT`(I2,I1),#token("0","Int"))`` requires `_andBool_`(isInt(I1),isInt(I2)) ensures #token("true","Bool") [UNIQUE_ID(81f77f3fbad78d0c735f87bfe9eff8339b46a8ead5ca820f8d69aafef7cb551d) contentStartColumn(8) contentStartLine(409) org.kframework.attributes.Location(Location(409,8,409,58)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Int _ as varI1_694) :: []),((Int _ as varI2_695) :: [])) when ((true) && (true)) && (true) -> ((eval_'EqlsEqls'Int_(((eval_'Perc'Int__INT((varI2_695 :: []),(varI1_694 :: [])) config (-1))),((Lazy.force int0) :: [])) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval'Hash'stat'LPar'_'RPar'_K'Hyph'IO (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'stat'LPar'_'RPar'_K'Hyph'IO and sort = 
SortKItem in match c with 
| _ -> try IO.hook_stat c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalupdateList (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblupdateList and sort = 
SortList in match c with 
| _ -> try LIST.hook_updateAll c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalSet'Coln'choice (c: k) (config: k) (guard: int) : k = let lbl = 
LblSet'Coln'choice and sort = 
SortKItem in match c with 
| _ -> try SET.hook_choice c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalcategoryChar (c: k) (config: k) (guard: int) : k = let lbl = 
LblcategoryChar and sort = 
SortString in match c with 
| _ -> try STRING.hook_category c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'write'LPar'_'Comm'_'RPar'_K'Hyph'IO (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'write'LPar'_'Comm'_'RPar'_K'Hyph'IO and sort = 
SortK in match c with 
| _ -> try IO.hook_write c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_xorInt__INT (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_xorInt__INT and sort = 
SortInt in match c with 
| _ -> try INT.hook_xor c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalMap'Coln'lookupOrDefault (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblMap'Coln'lookupOrDefault and sort = 
SortKItem in match c with 
| _ -> try MAP.hook_lookupOrDefault c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalString2Float (c: k) (config: k) (guard: int) : k = let lbl = 
LblString2Float and sort = 
SortFloat in match c with 
| _ -> try STRING.hook_string2float c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'stdout_K'Hyph'IO (c: unit) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'stdout_K'Hyph'IO and sort = 
SortInt in match c with 
(*{| rule `` `#stdout_K-IO`(.KList)=>#token("1","Int")`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(fd57288699ac44a10b4d3e3c65ee3ad16f98646109e64ed7a5ac726279e39ae9) contentStartColumn(8) contentStartLine(909) org.kframework.attributes.Location(Location(909,8,909,20)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| () -> ((Lazy.force int1) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let const'Hash'stdout_K'Hyph'IO : k Lazy.t = lazy (eval'Hash'stdout_K'Hyph'IO () interned_bottom (-1))
let eval_'And'Int__INT (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'And'Int__INT and sort = 
SortInt in match c with 
| _ -> try INT.hook_and c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let rec eval'Hash'borrowimmck (c: k * k * k * k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'borrowimmck and sort = 
SortBool in match c with 
| (((Int _ as var_0_696) :: []),(var_1_697),((Int _ as var_2_698) :: []),((Int _ as var_3_699) :: []),((Int _ as var_4_700) :: [])) when guard < 0(*{| rule ``#borrowimmck(L4,_0,L1,L2,L3)=>#borrowimmck(L4,M,L1,L2,L3)`` requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(L,_0),#match(#rs(_87),`Map:lookup`(_0,L))),#match(M,`_[_<-undef]`(_0,L))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isProps(_87),isInt(L3)),isInt(L4)),isInt(L2)),isKItem(L)),isMap(M)),isInt(L1))) ensures #token("true","Bool") [UNIQUE_ID(6936defb17ffe6992c6041ee49d9d8832270ab3d8b0bbef643228d60f96637c5) contentStartColumn(6) contentStartLine(262) org.kframework.attributes.Location(Location(262,6,262,105)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
 -> (match (var_1_697) with 
| [Map (_,_,collection)] -> let choice = (KMap.fold (fun e v result -> if result == interned_bottom then (match e with | (var_6_701 :: []) as e12 -> (let e = ((evalMap'Coln'lookup((var_1_697),e12) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| (KApply1(Lbl'Hash'rs,(var_7_702 :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_1_697),e12) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| ((Map (SortMap,_,_) as var_5_703) :: []) when ((((((true) && (true))) && (true))) && ((((((((((((((isTrue (evalisProps((var_7_702 :: [])) config (-1)))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true)))) && (true) -> ((eval'Hash'borrowimmck((var_0_696 :: []),(var_5_703 :: []),(var_2_698 :: []),(var_3_699 :: []),(var_4_700 :: [])) config (-1)))| _ -> interned_bottom)| _ -> interned_bottom)| _ -> interned_bottom) else result) collection interned_bottom) in if choice == interned_bottom then (eval'Hash'borrowimmck c config 0) else choice| _ -> (eval'Hash'borrowimmck c config 0))
| (((Int _ as var_0_704) :: []),(var_1_705),((Int _ as var_2_706) :: []),((Int _ as var_3_707) :: []),((Int _ as var_4_708) :: [])) when guard < 1(*{| rule ``#borrowimmck(L4,_0,L1,L2,L3)=>#borrowimmck(L4,M,L1,L2,L3)`` requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(L,_0),#match(#br(_47,_48,#immRef(_49)),`Map:lookup`(_0,L))),#match(M,`_[_<-undef]`(_0,L))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(_48),isInt(L3)),isInt(_49)),isInt(_47)),isInt(L4)),isInt(L2)),isKItem(L)),isMap(M)),isInt(L1))) ensures #token("true","Bool") [UNIQUE_ID(6e3ca156e043cd3007573db611d1bb66b7784bfd5651afbf3f517b6a2952f583) contentStartColumn(6) contentStartLine(263) org.kframework.attributes.Location(Location(263,6,263,118)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
 -> (match (var_1_705) with 
| [Map (_,_,collection)] -> let choice = (KMap.fold (fun e v result -> if result == interned_bottom then (match e with | (var_6_709 :: []) as e13 -> (let e = ((evalMap'Coln'lookup((var_1_705),e13) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| (KApply3(Lbl'Hash'br,((Int _ as var_7_710) :: []),((Int _ as var_8_711) :: []),(KApply1(Lbl'Hash'immRef,((Int _ as var_9_712) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_1_705),e13) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| ((Map (SortMap,_,_) as var_5_713) :: []) when ((((((true) && (true))) && (true))) && (((((((((((((((((true) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true)))) && (true) -> ((eval'Hash'borrowimmck((var_0_704 :: []),(var_5_713 :: []),(var_2_706 :: []),(var_3_707 :: []),(var_4_708 :: [])) config (-1)))| _ -> interned_bottom)| _ -> interned_bottom)| _ -> interned_bottom) else result) collection interned_bottom) in if choice == interned_bottom then (eval'Hash'borrowimmck c config 1) else choice| _ -> (eval'Hash'borrowimmck c config 1))
(*{| rule ``#borrowimmck(_75,_0,_76,_77,_78)=>#token("false","Bool")`` requires `_andBool_`(`_==K_`(`.Map`(.KList),_0),`_andBool_`(`_andBool_`(`_andBool_`(isInt(_76),isInt(_77)),isInt(_75)),isInt(_78))) ensures #token("true","Bool") [UNIQUE_ID(689863ec3de3c975c20bb65695f35a516d54726932341ac3a66457ab8622e940) contentStartColumn(6) contentStartLine(284) org.kframework.attributes.Location(Location(284,6,284,42)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((Int _ as var_75_714) :: []),(var_0_715),((Int _ as var_76_716) :: []),((Int _ as var_77_717) :: []),((Int _ as var_78_718) :: [])) when (((isTrue (eval_'EqlsEqls'K_(((Lazy.force const'Stop'Map)),(var_0_715)) config (-1)))) && (((((((true) && (true))) && (true))) && (true)))) && (true) -> ((Bool false) :: [])
| (((Int _ as var_0_719) :: []),(var_1_720),((Int _ as var_2_721) :: []),((Int _ as var_3_722) :: []),((Int _ as var_4_723) :: [])) when guard < 3(*{| rule ``#borrowimmck(L,_0,L1,L2,L3)=>#borrowimmck(L,M,L1,L2,L3)`` requires `_andBool_`(`_andBool_`(#match(#br(BEG,END,#mutRef(L3)),`Map:lookup`(_0,L)),#match(M,`_[_<-undef]`(_0,L))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(L3),isInt(END)),isInt(L2)),isInt(L)),isMap(M)),isInt(L1)),isInt(BEG))) ensures #token("true","Bool") [UNIQUE_ID(340b886943fda223d1852f954bf2bc7dbbc47d52ea37940627dee517a4f7b6f9) contentStartColumn(6) contentStartLine(262) org.kframework.attributes.Location(Location(262,6,263,52)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
 -> (let e = ((evalMap'Coln'lookup((var_1_720),(var_0_719 :: [])) config (-1))) in match e with 
| [Bottom] -> (eval'Hash'borrowimmck c config 3)
| (KApply3(Lbl'Hash'br,((Int _ as var_6_724) :: []),((Int _ as var_7_725) :: []),(KApply1(Lbl'Hash'mutRef,((Int _ as var_4_726) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_1_720),(var_0_719 :: [])) config (-1))) in match e with 
| [Bottom] -> (eval'Hash'borrowimmck c config 3)
| ((Map (SortMap,_,_) as var_5_727) :: []) when ((((true) && (true))) && (((((((((((((true) && (true))) && (true))) && (true))) && (true))) && (true))) && (true)))) && (((compare_kitem var_4_726 var_4_723) = 0) && true) -> ((eval'Hash'borrowimmck((var_0_719 :: []),(var_5_727 :: []),(var_2_721 :: []),(var_3_722 :: []),(var_4_726 :: [])) config (-1)))| _ -> (eval'Hash'borrowimmck c config 3))| _ -> (eval'Hash'borrowimmck c config 3))
| (((Int _ as var_0_728) :: []),(var_1_729),((Int _ as var_2_730) :: []),((Int _ as var_3_731) :: []),((Int _ as var_4_732) :: [])) when guard < 4(*{| rule ``#borrowimmck(L5,_0,L1,L2,L3)=>#borrowimmck(L5,M,L1,L2,L3)`` requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(L,_0),#match(#br(BEG,END,#mutRef(L3)),`Map:lookup`(_0,L))),#match(M,`_[_<-undef]`(_0,L))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(L3),isInt(END)),isInt(L5)),isInt(L2)),isInt(L)),isMap(M)),isInt(L1)),isInt(BEG)),`_andBool_`(`_=/=Int__INT`(L5,L),`_==Bool__BOOL`(#lc(L1,L2,BEG,END),#token("false","Bool"))))) ensures #token("true","Bool") [UNIQUE_ID(b6be5c1aa3d43af761dc2085fe7ff0118e3e7f29fb7daed24652bb99b55b7213) contentStartColumn(6) contentStartLine(253) org.kframework.attributes.Location(Location(253,6,255,75)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
 -> (match (var_1_729) with 
| [Map (_,_,collection)] -> let choice = (KMap.fold (fun e v result -> if result == interned_bottom then (match e with | ((Int _ as var_6_733) :: []) as e14 -> (let e = ((evalMap'Coln'lookup((var_1_729),e14) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| (KApply3(Lbl'Hash'br,((Int _ as var_7_734) :: []),((Int _ as var_8_735) :: []),(KApply1(Lbl'Hash'mutRef,((Int _ as var_4_736) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_1_729),e14) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| ((Map (SortMap,_,_) as var_5_737) :: []) when ((((((true) && (true))) && (true))) && (((((((((((((((((true) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && ((((isTrue (eval_'EqlsSlshEqls'Int__INT((var_0_728 :: []),e14) config (-1)))) && ((isTrue (eval_'EqlsEqls'Bool__BOOL(((eval'Hash'lc((var_2_730 :: []),(var_3_731 :: []),(var_7_734 :: []),(var_8_735 :: [])) config (-1))),((Bool false) :: [])) config (-1))))))))) && (((compare_kitem var_4_732 var_4_736) = 0) && true) -> ((eval'Hash'borrowimmck((var_0_728 :: []),(var_5_737 :: []),(var_2_730 :: []),(var_3_731 :: []),(var_4_732 :: [])) config (-1)))| _ -> interned_bottom)| _ -> interned_bottom)| _ -> interned_bottom) else result) collection interned_bottom) in if choice == interned_bottom then (eval'Hash'borrowimmck c config 4) else choice| _ -> (eval'Hash'borrowimmck c config 4))
| (((Int _ as var_0_738) :: []),(var_1_739),((Int _ as var_2_740) :: []),((Int _ as var_3_741) :: []),((Int _ as var_4_742) :: [])) when guard < 5(*{| rule ``#borrowimmck(L4,_0,L1,L2,L3)=>#borrowimmck(L4,M,L1,L2,L3)`` requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(L,_0),#match(`#uninit_OSL-SYNTAX`(.KList),`Map:lookup`(_0,L))),#match(M,`_[_<-undef]`(_0,L))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(L3),isInt(L4)),isInt(L2)),isKItem(L)),isMap(M)),isInt(L1))) ensures #token("true","Bool") [UNIQUE_ID(7ec37237f0e0511339090486f74cebe8f084132167f559fd74c4d329f9648d5e) contentStartColumn(6) contentStartLine(264) org.kframework.attributes.Location(Location(264,6,264,106)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
 -> (match (var_1_739) with 
| [Map (_,_,collection)] -> let choice = (KMap.fold (fun e v result -> if result == interned_bottom then (match e with | (var_6_743 :: []) as e15 -> (let e = ((evalMap'Coln'lookup((var_1_739),e15) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| (KApply0(Lbl'Hash'uninit_OSL'Hyph'SYNTAX) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_1_739),e15) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| ((Map (SortMap,_,_) as var_5_744) :: []) when ((((((true) && (true))) && (true))) && (((((((((((true) && (true))) && (true))) && (true))) && (true))) && (true)))) && (true) -> ((eval'Hash'borrowimmck((var_0_738 :: []),(var_5_744 :: []),(var_2_740 :: []),(var_3_741 :: []),(var_4_742 :: [])) config (-1)))| _ -> interned_bottom)| _ -> interned_bottom)| _ -> interned_bottom) else result) collection interned_bottom) in if choice == interned_bottom then (eval'Hash'borrowimmck c config 5) else choice| _ -> (eval'Hash'borrowimmck c config 5))
| (((Int _ as var_0_745) :: []),(var_1_746),((Int _ as var_2_747) :: []),((Int _ as var_3_748) :: []),((Int _ as var_4_749) :: [])) when guard < 6(*{| rule ``#borrowimmck(L5,_0,L1,L2,L3)=>#token("true","Bool")`` requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(L,_0),#match(#br(BEG,END,#mutRef(L3)),`Map:lookup`(_0,L))),#match(M,`_[_<-undef]`(_0,L))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(L3),isInt(END)),isInt(L5)),isInt(L2)),isInt(L)),isMap(M)),isInt(L1)),isInt(BEG)),`_andBool_`(`_=/=Int__INT`(L5,L),`_==Bool__BOOL`(#lc(L1,L2,BEG,END),#token("true","Bool"))))) ensures #token("true","Bool") [UNIQUE_ID(49da526995df61bb74e0691b3ea1d6d3c1b6bf44e8fad24091d369d76e71d9e6) contentStartColumn(6) contentStartLine(257) org.kframework.attributes.Location(Location(257,6,259,74)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
 -> (match (var_1_746) with 
| [Map (_,_,collection)] -> let choice = (KMap.fold (fun e v result -> if result == interned_bottom then (match e with | ((Int _ as var_5_750) :: []) as e16 -> (let e = ((evalMap'Coln'lookup((var_1_746),e16) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| (KApply3(Lbl'Hash'br,((Int _ as var_6_751) :: []),((Int _ as var_7_752) :: []),(KApply1(Lbl'Hash'mutRef,((Int _ as var_4_753) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_1_746),e16) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| ((Map (SortMap,_,_) as var_8_754) :: []) when ((((((true) && (true))) && (true))) && (((((((((((((((((true) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && ((((isTrue (eval_'EqlsSlshEqls'Int__INT((var_0_745 :: []),e16) config (-1)))) && ((isTrue (eval_'EqlsEqls'Bool__BOOL(((eval'Hash'lc((var_2_747 :: []),(var_3_748 :: []),(var_6_751 :: []),(var_7_752 :: [])) config (-1))),((Bool true) :: [])) config (-1))))))))) && (((compare_kitem var_4_749 var_4_753) = 0) && true) -> ((Bool true) :: [])| _ -> interned_bottom)| _ -> interned_bottom)| _ -> interned_bottom) else result) collection interned_bottom) in if choice == interned_bottom then (eval'Hash'borrowimmck c config 6) else choice| _ -> (eval'Hash'borrowimmck c config 6))
| (((Int _ as var_0_755) :: []),(var_1_756),((Int _ as var_2_757) :: []),((Int _ as var_3_758) :: []),((Int _ as var_4_759) :: [])) when guard < 7(*{| rule ``#borrowimmck(L5,_0,L1,L2,L4)=>#borrowimmck(L5,M,L1,L2,L4)`` requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(L,_0),#match(#br(_64,_65,#mutRef(L3)),`Map:lookup`(_0,L))),#match(M,`_[_<-undef]`(_0,L))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(L3),isInt(L5)),isInt(L4)),isInt(_65)),isInt(L2)),isInt(L)),isInt(_64)),isMap(M)),isInt(L1)),`_=/=Int__INT`(L3,L4))) ensures #token("true","Bool") [UNIQUE_ID(e1aa457f77ca1c3bc272fdbedf4ecfa302c2df806f621c1a2f9d6f007368ed65) contentStartColumn(6) contentStartLine(249) org.kframework.attributes.Location(Location(249,6,251,27)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
 -> (match (var_1_756) with 
| [Map (_,_,collection)] -> let choice = (KMap.fold (fun e v result -> if result == interned_bottom then (match e with | ((Int _ as var_6_760) :: []) as e17 -> (let e = ((evalMap'Coln'lookup((var_1_756),e17) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| (KApply3(Lbl'Hash'br,((Int _ as var_7_761) :: []),((Int _ as var_8_762) :: []),(KApply1(Lbl'Hash'mutRef,((Int _ as var_9_763) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_1_756),e17) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| ((Map (SortMap,_,_) as var_5_764) :: []) when ((((((true) && (true))) && (true))) && (((((((((((((((((((true) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && ((isTrue (eval_'EqlsSlshEqls'Int__INT((var_9_763 :: []),(var_4_759 :: [])) config (-1))))))) && (true) -> ((eval'Hash'borrowimmck((var_0_755 :: []),(var_5_764 :: []),(var_2_757 :: []),(var_3_758 :: []),(var_4_759 :: [])) config (-1)))| _ -> interned_bottom)| _ -> interned_bottom)| _ -> interned_bottom) else result) collection interned_bottom) in if choice == interned_bottom then (eval'Hash'borrowimmck c config 7) else choice| _ -> (eval'Hash'borrowimmck c config 7))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize5 c)))])
let evallog2Int (c: k) (config: k) (guard: int) : k = let lbl = 
Lbllog2Int and sort = 
SortInt in match c with 
| _ -> try INT.hook_log2 c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'stdin_K'Hyph'IO (c: unit) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'stdin_K'Hyph'IO and sort = 
SortInt in match c with 
(*{| rule `` `#stdin_K-IO`(.KList)=>#token("0","Int")`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(595a161d3d44d3c588fcd417f7279ef70547c573e159ef5bfc70692b22149da9) contentStartColumn(8) contentStartLine(908) org.kframework.attributes.Location(Location(908,8,908,19)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| () -> ((Lazy.force int0) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let const'Hash'stdin_K'Hyph'IO : k Lazy.t = lazy (eval'Hash'stdin_K'Hyph'IO () interned_bottom (-1))
let evalBase2String (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblBase2String and sort = 
SortString in match c with 
| _ -> try STRING.hook_base2string c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisStream (c: k) (config: k) (guard: int) : k = let lbl = 
LblisStream and sort = 
SortBool in match c with 
(*{| rule ``isStream(#buffer(K0))=>#token("true","Bool")`` requires isK(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'buffer,(varK0_765)) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isStream(#KToken(#token("Stream","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStream, var__766) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStream(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_767)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'_GT_Eqls'String__STRING (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_GT_Eqls'String__STRING and sort = 
SortBool in match c with 
| _ -> try STRING.hook_ge c lbl sort config freshFunction
with Not_implemented -> match c with 
(*{| rule `` `_>=String__STRING`(S1,S2)=>`notBool_`(`_<String__STRING`(S1,S2))`` requires `_andBool_`(isString(S2),isString(S1)) ensures #token("true","Bool") [UNIQUE_ID(2e24bd4be2ac7aa21b58ac7fe4e1e4e70e5e69437dff6c98e3ff986df28f5b21) contentStartColumn(8) contentStartLine(551) org.kframework.attributes.Location(Location(551,8,551,63)) org.kframework.attributes.Source(Source(/root/k/include/builtin/domains.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (((String _ as varS1_768) :: []),((String _ as varS2_769) :: [])) when ((true) && (true)) && (true) -> ([Bool ((not ((isTrue (eval_'_LT_'String__STRING((varS1_768 :: []),(varS2_769 :: [])) config (-1))))))])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let eval_'_LT_Eqls'Map__MAP (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'_LT_Eqls'Map__MAP and sort = 
SortBool in match c with 
| _ -> try MAP.hook_inclusion c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalnewUUID_STRING (c: unit) (config: k) (guard: int) : k = let lbl = 
LblnewUUID_STRING and sort = 
SortString in match c with 
| _ -> try STRING.hook_uuid c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let evalsize (c: k) (config: k) (guard: int) : k = let lbl = 
Lblsize and sort = 
SortInt in match c with 
| _ -> try SET.hook_size c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let rec eval'Hash'existRef (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'existRef and sort = 
SortBool in match c with 
| ((var_0_770),(var_1_771),((Int _ as var_2_772) :: [])) when guard < 0(*{| rule ``#existRef(R,_0,C)=>#existRef(R,S,C)`` requires `_andBool_`(`_andBool_`(#setChoice(#br(_82,C1,R1),_0),#match(S,`Set:difference`(_0,`SetItem`(#br(_82,C1,R1))))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(C1),isSet(S)),isInt(C)),isK(R)),isExp(R1)),isInt(_82)),`_=/=K_`(R,R1))) ensures #token("true","Bool") [UNIQUE_ID(addbb2beba63359e81b53cbbdfa5c4c2a14eea9eafea4b1a949533f8d466cd1e) contentStartColumn(6) contentStartLine(104) org.kframework.attributes.Location(Location(104,6,105,24)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
 -> (match (var_1_771) with 
| [Set (_,_,collection)] -> let choice = (KSet.fold (fun e result -> if result == interned_bottom then (match e with | (KApply3(Lbl'Hash'br,((Int _ as var_4_773) :: []),((Int _ as var_5_774) :: []),(var_6_775 :: [])) :: []) as e18 -> (let e = ((evalSet'Coln'difference((var_1_771),((evalSetItem(e18) config (-1)))) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| ((Set (SortSet,_,_) as var_3_776) :: []) when ((((true) && (true))) && (((((((((((((true) && (true))) && (true))) && (true))) && ((isTrue (evalisExp((var_6_775 :: [])) config (-1)))))) && (true))) && ((isTrue (eval_'EqlsSlshEqls'K_((var_0_770),(var_6_775 :: [])) config (-1))))))) && (true) -> ((eval'Hash'existRef((var_0_770),(var_3_776 :: []),(var_2_772 :: [])) config (-1)))| _ -> interned_bottom)| _ -> interned_bottom) else result) collection interned_bottom) in if choice == interned_bottom then (eval'Hash'existRef c config 0) else choice| _ -> (eval'Hash'existRef c config 0))
| ((var_0_777),(var_1_778),((Int _ as var_2_779) :: [])) when guard < 1(*{| rule ``#existRef(R,_0,C)=>#existRef(R,S,C)`` requires `_andBool_`(`_andBool_`(#match(S,`Set:difference`(_0,`SetItem`(`#uninit_OSL-SYNTAX`(.KList)))),`Set:in`(`#uninit_OSL-SYNTAX`(.KList),_0)),`_andBool_`(`_andBool_`(isSet(S),isInt(C)),isK(R))) ensures #token("true","Bool") [UNIQUE_ID(8383a9109cbaee1fc14b643f6a2303c2e256c5a940a61663ee0472e3c7b807ba) contentStartColumn(6) contentStartLine(102) org.kframework.attributes.Location(Location(102,6,102,73)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
 -> (let e = ((evalSet'Coln'difference((var_1_778),((evalSetItem((const'Hash'uninit_OSL'Hyph'SYNTAX :: [])) config (-1)))) config (-1))) in match e with 
| [Bottom] -> (eval'Hash'existRef c config 1)
| ((Set (SortSet,_,_) as var_3_780) :: []) when ((((true) && ((isTrue (evalSet'Coln'in((const'Hash'uninit_OSL'Hyph'SYNTAX :: []),(var_1_778)) config (-1)))))) && (((((true) && (true))) && (true)))) && (true) -> ((eval'Hash'existRef((var_0_777),(var_3_780 :: []),(var_2_779 :: [])) config (-1)))| _ -> (eval'Hash'existRef c config 1))
(*{| rule ``#existRef(_62,_0,_63)=>#token("false","Bool")`` requires `_andBool_`(`_==K_`(`.Set`(.KList),_0),isInt(_63)) ensures #token("true","Bool") [UNIQUE_ID(420a28c27c388305f945c50981a7a21aaaa52554a34acb17ffe9d3dc8f64e585) contentStartColumn(6) contentStartLine(107) org.kframework.attributes.Location(Location(107,6,107,36)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| ((var_62_781),(var_0_782),((Int _ as var_63_783) :: [])) when (((isTrue (eval_'EqlsEqls'K_(((Lazy.force const'Stop'Set)),(var_0_782)) config (-1)))) && (true)) && (true) -> ((Bool false) :: [])
| ((var_0_784),(var_1_785),((Int _ as var_2_786) :: [])) when guard < 3(*{| rule ``#existRef(R,_0,C)=>#existRef(R,S,C)`` requires `_andBool_`(`_andBool_`(#setChoice(#rs(_51),_0),#match(S,`Set:difference`(_0,`SetItem`(#rs(_51))))),`_andBool_`(`_andBool_`(`_andBool_`(isSet(S),isInt(C)),isK(R)),isProps(_51))) ensures #token("true","Bool") [UNIQUE_ID(75c58a5d5155b0b9c984b83a6ae24d35a88d50ea63c90aef18046950ee95826b) contentStartColumn(6) contentStartLine(101) org.kframework.attributes.Location(Location(101,6,101,72)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
 -> (match (var_1_785) with 
| [Set (_,_,collection)] -> let choice = (KSet.fold (fun e result -> if result == interned_bottom then (match e with | (KApply1(Lbl'Hash'rs,(var_4_787 :: [])) :: []) as e19 -> (let e = ((evalSet'Coln'difference((var_1_785),((evalSetItem(e19) config (-1)))) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| ((Set (SortSet,_,_) as var_3_788) :: []) when ((((true) && (true))) && (((((((true) && (true))) && (true))) && ((isTrue (evalisProps((var_4_787 :: [])) config (-1))))))) && (true) -> ((eval'Hash'existRef((var_0_784),(var_3_788 :: []),(var_2_786 :: [])) config (-1)))| _ -> interned_bottom)| _ -> interned_bottom) else result) collection interned_bottom) in if choice == interned_bottom then (eval'Hash'existRef c config 3) else choice| _ -> (eval'Hash'existRef c config 3))
| ((var_0_789),(var_1_790),((Int _ as var_2_791) :: [])) when guard < 4(*{| rule ``#existRef(R,_0,C)=>`_andBool_`(`_>=Int__INT`(C1,C),#token("true","Bool"))`` requires `_andBool_`(`_andBool_`(#setChoice(#br(_67,C1,R),_0),#match(S,`Set:difference`(_0,`SetItem`(#br(_67,C1,R))))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(_67),isInt(C1)),isSet(S)),isInt(C)),isK(R))) ensures #token("true","Bool") [UNIQUE_ID(8a57f9b33ba228a1fddfbdd4ae668ff2c25c5030707dbac93bfc701e20185aa9) contentStartColumn(6) contentStartLine(103) org.kframework.attributes.Location(Location(103,6,103,88)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
 -> (match (var_1_790) with 
| [Set (_,_,collection)] -> let choice = (KSet.fold (fun e result -> if result == interned_bottom then (match e with | (KApply3(Lbl'Hash'br,((Int _ as var_4_792) :: []),((Int _ as var_3_793) :: []),(var_0_794)) :: []) as e20 -> (let e = ((evalSet'Coln'difference((var_1_790),((evalSetItem(e20) config (-1)))) config (-1))) in match e with 
| [Bottom] -> interned_bottom
| ((Set (SortSet,_,_) as var_5_795) :: []) when ((((true) && (true))) && (((((((((true) && (true))) && (true))) && (true))) && (true)))) && (((compare var_0_789 var_0_794) = 0) && true) -> ([Bool ((((isTrue (eval_'_GT_Eqls'Int__INT((var_3_793 :: []),(var_2_791 :: [])) config (-1)))) && (true)))])| _ -> interned_bottom)| _ -> interned_bottom) else result) collection interned_bottom) in if choice == interned_bottom then (eval'Hash'existRef c config 4) else choice| _ -> (eval'Hash'existRef c config 4))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let eval_inList_ (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_inList_ and sort = 
SortBool in match c with 
| _ -> try LIST.hook_in c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalinitFunDefCell (c: unit) (config: k) (guard: int) : k = let lbl = 
LblinitFunDefCell and sort = 
SortFunDefCell in match c with 
(*{| rule ``initFunDefCell(.KList)=>`FunDefCellMapItem`(initFnameCell(.KList),`<funDef>`(initFnameCell(.KList),initFparamsCell(.KList),initFretCell(.KList),initFbodyCell(.KList)))`` requires #token("true","Bool") ensures #token("true","Bool") [UNIQUE_ID(e79cbce5a7d29b74d264d0c95d1bbcdb54e319692b74308e05b18663ab08d38e) initializer()]|}*)
| () -> ((evalFunDefCellMapItem(((Lazy.force constinitFnameCell)),(KApply4(Lbl'_LT_'funDef'_GT_',((Lazy.force constinitFnameCell)),((Lazy.force constinitFparamsCell)),((Lazy.force constinitFretCell)),((Lazy.force constinitFbodyCell))) :: [])) config (-1)))
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize0 c)))])
let constinitFunDefCell : k Lazy.t = lazy (evalinitFunDefCell () interned_bottom (-1))
let evalsrandInt (c: k) (config: k) (guard: int) : k = let lbl = 
LblsrandInt and sort = 
SortK in match c with 
| _ -> try INT.hook_srand c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalList'Coln'set (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
LblList'Coln'set and sort = 
SortList in match c with 
| _ -> try LIST.hook_update c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let evalString2Base (c: k * k) (config: k) (guard: int) : k = let lbl = 
LblString2Base and sort = 
SortInt in match c with 
| _ -> try STRING.hook_string2base c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisTCellFragment (c: k) (config: k) (guard: int) : k = let lbl = 
LblisTCellFragment and sort = 
SortBool in match c with 
(*{| rule ``isTCellFragment(#KToken(#token("TCellFragment","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortTCellFragment, var__796) :: [])) -> ((Bool true) :: [])
(*{| rule ``isTCellFragment(`<T>-fragment`(K0,K1,K2,K3))=>#token("true","Bool")`` requires `_andBool_`(`_andBool_`(`_andBool_`(isStatesCellOpt(K0),isNstateCellOpt(K1)),isTmpCellOpt(K2)),isFunDefsCellOpt(K3)) ensures #token("true","Bool") []|}*)
| ((KApply4(Lbl'_LT_'T'_GT_Hyph'fragment,(varK0_797 :: []),(varK1_798 :: []),(varK2_799 :: []),(varK3_800 :: [])) :: [])) when (((((((isTrue (evalisStatesCellOpt((varK0_797 :: [])) config (-1)))) && ((isTrue (evalisNstateCellOpt((varK1_798 :: [])) config (-1)))))) && ((isTrue (evalisTmpCellOpt((varK2_799 :: [])) config (-1)))))) && ((isTrue (evalisFunDefsCellOpt((varK3_800 :: [])) config (-1))))) && (true) -> ((Bool true) :: [])
(*{| rule ``isTCellFragment(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_801)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalisStatesCellFragment (c: k) (config: k) (guard: int) : k = let lbl = 
LblisStatesCellFragment and sort = 
SortBool in match c with 
(*{| rule ``isStatesCellFragment(`<states>-fragment`(K0))=>#token("true","Bool")`` requires isStateCellMap(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'_LT_'states'_GT_Hyph'fragment,((Map (SortStateCellMap,_,_) as varK0_802) :: [])) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isStatesCellFragment(#KToken(#token("StatesCellFragment","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortStatesCellFragment, var__803) :: [])) -> ((Bool true) :: [])
(*{| rule ``isStatesCellFragment(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_804)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval_'LSqB'_'_LT_Hyph'_'RSqB'_MAP (c: k * k * k) (config: k) (guard: int) : k = let lbl = 
Lbl_'LSqB'_'_LT_Hyph'_'RSqB'_MAP and sort = 
SortMap in match c with 
| _ -> try MAP.hook_update c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize3 c)))])
let eval'Hash'tell'LPar'_'RPar'_K'Hyph'IO (c: k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'tell'LPar'_'RPar'_K'Hyph'IO and sort = 
SortInt in match c with 
| _ -> try IO.hook_tell c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalkeys (c: k) (config: k) (guard: int) : k = let lbl = 
Lblkeys and sort = 
SortSet in match c with 
| _ -> try MAP.hook_keys c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let evalgetKLabel (c: k) (config: k) (guard: int) : k = let lbl = 
LblgetKLabel and sort = 
SortKItem in match c with 
| _ -> try KREFLECTION.hook_getKLabel c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval'Hash'seekEnd'LPar'_'Comm'_'RPar'_K'Hyph'IO (c: k * k) (config: k) (guard: int) : k = let lbl = 
Lbl'Hash'seekEnd'LPar'_'Comm'_'RPar'_K'Hyph'IO and sort = 
SortK in match c with 
| _ -> try IO.hook_seekEnd c lbl sort config freshFunction
with Not_implemented -> match c with 
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize2 c)))])
let evalisLOCK (c: k) (config: k) (guard: int) : k = let lbl = 
LblisLOCK and sort = 
SortBool in match c with 
(*{| rule ``isLOCK(#compare(K0))=>#token("true","Bool")`` requires isK(K0) ensures #token("true","Bool") []|}*)
| ((KApply1(Lbl'Hash'compare,(varK0_805)) :: [])) when true && (true) -> ((Bool true) :: [])
(*{| rule ``isLOCK(#KToken(#token("LOCK","KString"),_))=>#token("true","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") []|}*)
| ((KToken (SortLOCK, var__806) :: [])) -> ((Bool true) :: [])
(*{| rule ``isLOCK(K)=>#token("false","Bool")`` requires #token("true","Bool") ensures #token("true","Bool") [owise()]|}*)
| ((varK_807)) -> ((Bool false) :: [])
| _ -> raise (Stuck [denormalize (KApply(lbl, (denormalize1 c)))])
let eval (c: normal_kitem) (config: k) : k = match c with KApply(lbl, kl) -> (match lbl with 
|Lbl'Hash'argv -> eval'Hash'argv (normalize0 kl) config (-1)
|LblisFparamsCellOpt -> evalisFparamsCellOpt (normalize1 kl) config (-1)
|LblisFbodyCellOpt -> evalisFbodyCellOpt (normalize1 kl) config (-1)
|LblnotBool_ -> evalnotBool_ (normalize1 kl) config (-1)
|Lbl_'_LT_Eqls'Int__INT -> eval_'_LT_Eqls'Int__INT (normalize2 kl) config (-1)
|LblMap'Coln'lookup -> evalMap'Coln'lookup (normalize2 kl) config (-1)
|Lbl'Hash'stderr_K'Hyph'IO -> eval'Hash'stderr_K'Hyph'IO (normalize0 kl) config (-1)
|Lbl'Hash'seek'LPar'_'Comm'_'RPar'_K'Hyph'IO -> eval'Hash'seek'LPar'_'Comm'_'RPar'_K'Hyph'IO (normalize2 kl) config (-1)
|LblsignExtendBitRangeInt -> evalsignExtendBitRangeInt (normalize3 kl) config (-1)
|Lbl_'EqlsEqls'Bool__BOOL -> eval_'EqlsEqls'Bool__BOOL (normalize2 kl) config (-1)
|LblisSet -> evalisSet (normalize1 kl) config (-1)
|LblisTimerCell -> evalisTimerCell (normalize1 kl) config (-1)
|Lbl'Hash'getenv -> eval'Hash'getenv (normalize1 kl) config (-1)
|LblintersectSet -> evalintersectSet (normalize2 kl) config (-1)
|Lbl_in_keys'LPar'_'RPar'_MAP -> eval_in_keys'LPar'_'RPar'_MAP (normalize2 kl) config (-1)
|LblisStatesCell -> evalisStatesCell (normalize1 kl) config (-1)
|LblfindChar -> evalfindChar (normalize3 kl) config (-1)
|LblinitNstateCell -> evalinitNstateCell (normalize0 kl) config (-1)
|LblSet'Coln'in -> evalSet'Coln'in (normalize2 kl) config (-1)
|LblisK -> evalisK (normalize1 kl) config (-1)
|LblString2Int -> evalString2Int (normalize1 kl) config (-1)
|LblinitFparamsCell -> evalinitFparamsCell (normalize0 kl) config (-1)
|Lbl_'_LT_Eqls'Set__SET -> eval_'_LT_Eqls'Set__SET (normalize2 kl) config (-1)
|LblisIOError -> evalisIOError (normalize1 kl) config (-1)
|Lbl'Hash'parse -> eval'Hash'parse (normalize2 kl) config (-1)
|LblmakeList -> evalmakeList (normalize2 kl) config (-1)
|LblisSeparator -> evalisSeparator (normalize1 kl) config (-1)
|Lbl_'LSqB'_'_LT_Hyph'undef'RSqB' -> eval_'LSqB'_'_LT_Hyph'undef'RSqB' (normalize2 kl) config (-1)
|LblinitIndexesCell -> evalinitIndexesCell (normalize0 kl) config (-1)
|LblinitFbodyCell -> evalinitFbodyCell (normalize0 kl) config (-1)
|LblisFunDefCellFragment -> evalisFunDefCellFragment (normalize1 kl) config (-1)
|Lbl'Hash'unlock'LPar'_'Comm'_'RPar'_K'Hyph'IO -> eval'Hash'unlock'LPar'_'Comm'_'RPar'_K'Hyph'IO (normalize2 kl) config (-1)
|Lbl_'EqlsEqls'Int_ -> eval_'EqlsEqls'Int_ (normalize2 kl) config (-1)
|Lbl_andThenBool__BOOL -> eval_andThenBool__BOOL (normalize2 kl) config (-1)
|LblisFnameCellOpt -> evalisFnameCellOpt (normalize1 kl) config (-1)
|Lbl'Hash'writeCK -> eval'Hash'writeCK (normalize4 kl) config (-1)
|Lbl'Hash'parseInModule -> eval'Hash'parseInModule (normalize3 kl) config (-1)
|LblisBlockItem -> evalisBlockItem (normalize1 kl) config (-1)
|Lbl'Hash'system -> eval'Hash'system (normalize1 kl) config (-1)
|Lbl_StateCellMap_ -> eval_StateCellMap_ (normalize2 kl) config (-1)
|LblisProp -> evalisProp (normalize1 kl) config (-1)
|LblisString -> evalisString (normalize1 kl) config (-1)
|Lbl_'Perc'Int__INT -> eval_'Perc'Int__INT (normalize2 kl) config (-1)
|Lbl_'_GT__GT_'Int__INT -> eval_'_GT__GT_'Int__INT (normalize2 kl) config (-1)
|LblisTmpCell -> evalisTmpCell (normalize1 kl) config (-1)
|LblisList -> evalisList (normalize1 kl) config (-1)
|LblisFunction -> evalisFunction (normalize1 kl) config (-1)
|LblreplaceAll'LPar'_'Comm'_'Comm'_'RPar'_STRING -> evalreplaceAll'LPar'_'Comm'_'Comm'_'RPar'_STRING (normalize3 kl) config (-1)
|LblisStatesCellOpt -> evalisStatesCellOpt (normalize1 kl) config (-1)
|LblisNstateCell -> evalisNstateCell (normalize1 kl) config (-1)
|LblfindString -> evalfindString (normalize3 kl) config (-1)
|Lbl_'Xor_'Int__INT -> eval_'Xor_'Int__INT (normalize2 kl) config (-1)
|LblinitWriteCell -> evalinitWriteCell (normalize0 kl) config (-1)
|Lbl'Hash'borrowmutck -> eval'Hash'borrowmutck (normalize5 kl) config (-1)
|LblabsInt -> evalabsInt (normalize1 kl) config (-1)
|LblisEnvCell -> evalisEnvCell (normalize1 kl) config (-1)
|Lbl_'_GT_'String__STRING -> eval_'_GT_'String__STRING (normalize2 kl) config (-1)
|LblisBorrowItem -> evalisBorrowItem (normalize1 kl) config (-1)
|Lbl_'EqlsEqls'String__STRING -> eval_'EqlsEqls'String__STRING (normalize2 kl) config (-1)
|Lbl'Hash'checkInit -> eval'Hash'checkInit (normalize3 kl) config (-1)
|LblisKConfigVar -> evalisKConfigVar (normalize1 kl) config (-1)
|LblisFunDefsCellFragment -> evalisFunDefsCellFragment (normalize1 kl) config (-1)
|LblisProps -> evalisProps (normalize1 kl) config (-1)
|LblisKResult -> evalisKResult (normalize1 kl) config (-1)
|Lbl'Hash'lc -> eval'Hash'lc (normalize4 kl) config (-1)
|LblisCell -> evalisCell (normalize1 kl) config (-1)
|Lblvalues -> evalvalues (normalize1 kl) config (-1)
|LblList'Coln'get -> evalList'Coln'get (normalize2 kl) config (-1)
|LblisStackCell -> evalisStackCell (normalize1 kl) config (-1)
|Lbl'Hash'lstat'LPar'_'RPar'_K'Hyph'IO -> eval'Hash'lstat'LPar'_'RPar'_K'Hyph'IO (normalize1 kl) config (-1)
|LblisIndexesCell -> evalisIndexesCell (normalize1 kl) config (-1)
|LblinitFnameCell -> evalinitFnameCell (normalize0 kl) config (-1)
|LblSetItem -> evalSetItem (normalize1 kl) config (-1)
|LblisRItem -> evalisRItem (normalize1 kl) config (-1)
|LblStateCellMapItem -> evalStateCellMapItem (normalize2 kl) config (-1)
|LblisStoreCellOpt -> evalisStoreCellOpt (normalize1 kl) config (-1)
|Lbl_'_LT_'Int__INT -> eval_'_LT_'Int__INT (normalize2 kl) config (-1)
|Lbl'Stop'List -> eval'Stop'List (normalize0 kl) config (-1)
|LblisLoopItem -> evalisLoopItem (normalize1 kl) config (-1)
|LblisFunDefsCellOpt -> evalisFunDefsCellOpt (normalize1 kl) config (-1)
|LblisWItem -> evalisWItem (normalize1 kl) config (-1)
|LblrandInt -> evalrandInt (normalize1 kl) config (-1)
|Lbl'Hash'configuration_K'Hyph'REFLECTION -> eval'Hash'configuration_K'Hyph'REFLECTION (normalize0 kl) config (-1)
|LblisUninit -> evalisUninit (normalize1 kl) config (-1)
|LblisFloat -> evalisFloat (normalize1 kl) config (-1)
|Lbl'Hash'close'LPar'_'RPar'_K'Hyph'IO -> eval'Hash'close'LPar'_'RPar'_K'Hyph'IO (normalize1 kl) config (-1)
|LblisOItem -> evalisOItem (normalize1 kl) config (-1)
|LblinitFretCell -> evalinitFretCell (normalize0 kl) config (-1)
|Lblkeys_list'LPar'_'RPar'_MAP -> evalkeys_list'LPar'_'RPar'_MAP (normalize1 kl) config (-1)
|LblfreshId -> evalfreshId (normalize1 kl) config (-1)
|LblinitFunDefsCell -> evalinitFunDefsCell (normalize0 kl) config (-1)
|LblchrChar -> evalchrChar (normalize1 kl) config (-1)
|Lbl_orElseBool__BOOL -> eval_orElseBool__BOOL (normalize2 kl) config (-1)
|Lbl_divInt__INT -> eval_divInt__INT (normalize2 kl) config (-1)
|LblisIndexCell -> evalisIndexCell (normalize1 kl) config (-1)
|LblList'Coln'range -> evalList'Coln'range (normalize3 kl) config (-1)
|Lbl'Hash'wv -> eval'Hash'wv (normalize2 kl) config (-1)
|Lbl_'Plus'Int_ -> eval_'Plus'Int_ (normalize2 kl) config (-1)
|LblisKCell -> evalisKCell (normalize1 kl) config (-1)
|Lbl_orBool__BOOL -> eval_orBool__BOOL (normalize2 kl) config (-1)
|Lbl_'_GT_Eqls'Int__INT -> eval_'_GT_Eqls'Int__INT (normalize2 kl) config (-1)
|LblinitEnvCell -> evalinitEnvCell (normalize0 kl) config (-1)
|Lbl'Hash'bindParams -> eval'Hash'bindParams (normalize3 kl) config (-1)
|Lbl'Hash'compareE -> eval'Hash'compareE (normalize2 kl) config (-1)
|LblupdateMap -> evalupdateMap (normalize2 kl) config (-1)
|LblInt2String -> evalInt2String (normalize1 kl) config (-1)
|LblisNstateCellOpt -> evalisNstateCellOpt (normalize1 kl) config (-1)
|Lbl_'EqlsSlshEqls'K_ -> eval_'EqlsSlshEqls'K_ (normalize2 kl) config (-1)
|Lbl'Hash'lock'LPar'_'Comm'_'RPar'_K'Hyph'IO -> eval'Hash'lock'LPar'_'Comm'_'RPar'_K'Hyph'IO (normalize2 kl) config (-1)
|LblcountAllOccurrences'LPar'_'Comm'_'RPar'_STRING -> evalcountAllOccurrences'LPar'_'Comm'_'RPar'_STRING (normalize2 kl) config (-1)
|Lbl_'_GT_'Int__INT -> eval_'_GT_'Int__INT (normalize2 kl) config (-1)
|LblfillList -> evalfillList (normalize4 kl) config (-1)
|LblFunDefCellMapItem -> evalFunDefCellMapItem (normalize2 kl) config (-1)
|LblisBlocks -> evalisBlocks (normalize1 kl) config (-1)
|LblbitRangeInt -> evalbitRangeInt (normalize3 kl) config (-1)
|Lbl_'_LT_'String__STRING -> eval_'_LT_'String__STRING (normalize2 kl) config (-1)
|Lbl'Stop'StateCellMap -> eval'Stop'StateCellMap (normalize0 kl) config (-1)
|LblisTimerCellOpt -> evalisTimerCellOpt (normalize1 kl) config (-1)
|Lbl_List_ -> eval_List_ (normalize2 kl) config (-1)
|Lbl'Hash'inProps -> eval'Hash'inProps (normalize2 kl) config (-1)
|Lbl'Hash'open'LPar'_'Comm'_'RPar'_K'Hyph'IO -> eval'Hash'open'LPar'_'Comm'_'RPar'_K'Hyph'IO (normalize2 kl) config (-1)
|Lbl_'PipeHyph_GT_'_ -> eval_'PipeHyph_GT_'_ (normalize2 kl) config (-1)
|Lbl_xorBool__BOOL -> eval_xorBool__BOOL (normalize2 kl) config (-1)
|Lbl_'Hyph'Map__MAP -> eval_'Hyph'Map__MAP (normalize2 kl) config (-1)
|Lbl'Hash'compareS -> eval'Hash'compareS (normalize2 kl) config (-1)
|LblisIndexesCellOpt -> evalisIndexesCellOpt (normalize1 kl) config (-1)
|LblinitStoreCell -> evalinitStoreCell (normalize0 kl) config (-1)
|Lbl_'EqlsEqls'K_ -> eval_'EqlsEqls'K_ (normalize2 kl) config (-1)
|Lbl'Hash'sort -> eval'Hash'sort (normalize1 kl) config (-1)
|LblisIndexCellOpt -> evalisIndexCellOpt (normalize1 kl) config (-1)
|Lbl'Hash'open'LPar'_'RPar'_K'Hyph'IO -> eval'Hash'open'LPar'_'RPar'_K'Hyph'IO (normalize1 kl) config (-1)
|LblreplaceFirst'LPar'_'Comm'_'Comm'_'RPar'_STRING -> evalreplaceFirst'LPar'_'Comm'_'Comm'_'RPar'_STRING (normalize3 kl) config (-1)
|Lbl'Hash'putc'LPar'_'Comm'_'RPar'_K'Hyph'IO -> eval'Hash'putc'LPar'_'Comm'_'RPar'_K'Hyph'IO (normalize2 kl) config (-1)
|LblisTmpCellOpt -> evalisTmpCellOpt (normalize1 kl) config (-1)
|Lbl'Stop'Map -> eval'Stop'Map (normalize0 kl) config (-1)
|Lbl'Hash'logToFile -> eval'Hash'logToFile (normalize2 kl) config (-1)
|Lbl_'EqlsSlshEqls'String__STRING -> eval_'EqlsSlshEqls'String__STRING (normalize2 kl) config (-1)
|Lbl'Hash'read'LPar'_'Comm'_'RPar'_K'Hyph'IO -> eval'Hash'read'LPar'_'Comm'_'RPar'_K'Hyph'IO (normalize2 kl) config (-1)
|LblisStateCellFragment -> evalisStateCellFragment (normalize1 kl) config (-1)
|LblisType -> evalisType (normalize1 kl) config (-1)
|LblId2String -> evalId2String (normalize1 kl) config (-1)
|LblisBranchTmp -> evalisBranchTmp (normalize1 kl) config (-1)
|LblisInt -> evalisInt (normalize1 kl) config (-1)
|Lbl_FunDefCellMap_ -> eval_FunDefCellMap_ (normalize2 kl) config (-1)
|Lbl'Hash'fresh -> eval'Hash'fresh (normalize1 kl) config (-1)
|LblMap'Coln'choice -> evalMap'Coln'choice (normalize1 kl) config (-1)
|LblisFunDefsCell -> evalisFunDefsCell (normalize1 kl) config (-1)
|LblisExps -> evalisExps (normalize1 kl) config (-1)
|Lbl_impliesBool__BOOL -> eval_impliesBool__BOOL (normalize2 kl) config (-1)
|Lbl'Hash'getc'LPar'_'RPar'_K'Hyph'IO -> eval'Hash'getc'LPar'_'RPar'_K'Hyph'IO (normalize1 kl) config (-1)
|Lbl_Set_ -> eval_Set_ (normalize2 kl) config (-1)
|LblinitTmpCell -> evalinitTmpCell (normalize0 kl) config (-1)
|Lbl_'Star'Int__INT -> eval_'Star'Int__INT (normalize2 kl) config (-1)
|LblmaxInt'LPar'_'Comm'_'RPar'_INT -> evalmaxInt'LPar'_'Comm'_'RPar'_INT (normalize2 kl) config (-1)
|Lbl'Hash'unwrapInt -> eval'Hash'unwrapInt (normalize1 kl) config (-1)
|LblisBool -> evalisBool (normalize1 kl) config (-1)
|Lbl'Tild'Int__INT -> eval'Tild'Int__INT (normalize1 kl) config (-1)
|LblisStackCellOpt -> evalisStackCellOpt (normalize1 kl) config (-1)
|Lbl'Hash'list2Set -> eval'Hash'list2Set (normalize1 kl) config (-1)
|Lbl_'_LT_Eqls'String__STRING -> eval_'_LT_Eqls'String__STRING (normalize2 kl) config (-1)
|LblordChar -> evalordChar (normalize1 kl) config (-1)
|LblrfindChar -> evalrfindChar (normalize3 kl) config (-1)
|LblisStmt -> evalisStmt (normalize1 kl) config (-1)
|Lbl_modInt__INT -> eval_modInt__INT (normalize2 kl) config (-1)
|LblisIndexItem -> evalisIndexItem (normalize1 kl) config (-1)
|Lbl_Map_ -> eval_Map_ (normalize2 kl) config (-1)
|Lblproject'Coln'Stmts -> evalproject'Coln'Stmts (normalize1 kl) config (-1)
|Lbl_'Hyph'Int__INT -> eval_'Hyph'Int__INT (normalize2 kl) config (-1)
|Lbl'Hash'compareA -> eval'Hash'compareA (normalize2 kl) config (-1)
|LbldirectionalityChar -> evaldirectionalityChar (normalize1 kl) config (-1)
|LblFloat2String -> evalFloat2String (normalize1 kl) config (-1)
|Lbl'Hash'opendir'LPar'_'RPar'_K'Hyph'IO -> eval'Hash'opendir'LPar'_'RPar'_K'Hyph'IO (normalize1 kl) config (-1)
|LblinitKCell -> evalinitKCell (normalize1 kl) config (-1)
|LblisValue -> evalisValue (normalize1 kl) config (-1)
|LblisDItem -> evalisDItem (normalize1 kl) config (-1)
|LblsizeList -> evalsizeList (normalize1 kl) config (-1)
|Lbl'Stop'Set -> eval'Stop'Set (normalize0 kl) config (-1)
|LblString2Id -> evalString2Id (normalize1 kl) config (-1)
|LblisStateCell -> evalisStateCell (normalize1 kl) config (-1)
|Lbl_'EqlsSlshEqls'Bool__BOOL -> eval_'EqlsSlshEqls'Bool__BOOL (normalize2 kl) config (-1)
|LblremoveAll -> evalremoveAll (normalize2 kl) config (-1)
|LblisTCell -> evalisTCell (normalize1 kl) config (-1)
|LblisFunDefCell -> evalisFunDefCell (normalize1 kl) config (-1)
|Lbl_andBool_ -> eval_andBool_ (normalize2 kl) config (-1)
|LblinitStackCell -> evalinitStackCell (normalize0 kl) config (-1)
|LbllengthString -> evallengthString (normalize1 kl) config (-1)
|LblinitTCell -> evalinitTCell (normalize1 kl) config (-1)
|LblisFnameCell -> evalisFnameCell (normalize1 kl) config (-1)
|LblFloatFormat -> evalFloatFormat (normalize2 kl) config (-1)
|Lbl_'Plus'String__STRING -> eval_'Plus'String__STRING (normalize2 kl) config (-1)
|Lbl_'Xor_Perc'Int___INT -> eval_'Xor_Perc'Int___INT (normalize3 kl) config (-1)
|Lbl_'Pipe'Int__INT -> eval_'Pipe'Int__INT (normalize2 kl) config (-1)
|Lbl_dividesInt__INT -> eval_dividesInt__INT (normalize2 kl) config (-1)
|LblinitIndexCell -> evalinitIndexCell (normalize0 kl) config (-1)
|LblisStateCellMap -> evalisStateCellMap (normalize1 kl) config (-1)
|LblisFunDefCellMap -> evalisFunDefCellMap (normalize1 kl) config (-1)
|LblrfindString -> evalrfindString (normalize3 kl) config (-1)
|Lbl'Hash'stat'LPar'_'RPar'_K'Hyph'IO -> eval'Hash'stat'LPar'_'RPar'_K'Hyph'IO (normalize1 kl) config (-1)
|LblupdateList -> evalupdateList (normalize3 kl) config (-1)
|LblSet'Coln'choice -> evalSet'Coln'choice (normalize1 kl) config (-1)
|LblcategoryChar -> evalcategoryChar (normalize1 kl) config (-1)
|LblSet'Coln'difference -> evalSet'Coln'difference (normalize2 kl) config (-1)
|LblfreshInt -> evalfreshInt (normalize1 kl) config (-1)
|LblisKCellOpt -> evalisKCellOpt (normalize1 kl) config (-1)
|Lbl'Hash'write'LPar'_'Comm'_'RPar'_K'Hyph'IO -> eval'Hash'write'LPar'_'Comm'_'RPar'_K'Hyph'IO (normalize2 kl) config (-1)
|LblisBlock -> evalisBlock (normalize1 kl) config (-1)
|LblisParameters -> evalisParameters (normalize1 kl) config (-1)
|Lbl_xorInt__INT -> eval_xorInt__INT (normalize2 kl) config (-1)
|LblMap'Coln'lookupOrDefault -> evalMap'Coln'lookupOrDefault (normalize3 kl) config (-1)
|LblString2Float -> evalString2Float (normalize1 kl) config (-1)
|Lbl'Hash'if_'Hash'then_'Hash'else_'Hash'fi_K'Hyph'EQUAL -> eval'Hash'if_'Hash'then_'Hash'else_'Hash'fi_K'Hyph'EQUAL (normalize3 kl) config (-1)
|LblinitStateCell -> evalinitStateCell (normalize1 kl) config (-1)
|Lbl'Hash'stdout_K'Hyph'IO -> eval'Hash'stdout_K'Hyph'IO (normalize0 kl) config (-1)
|Lbl_'And'Int__INT -> eval_'And'Int__INT (normalize2 kl) config (-1)
|Lbl'Hash'borrowimmck -> eval'Hash'borrowimmck (normalize5 kl) config (-1)
|Lbl_'EqlsSlshEqls'Int__INT -> eval_'EqlsSlshEqls'Int__INT (normalize2 kl) config (-1)
|Lbl_'_LT__LT_'Int__INT -> eval_'_LT__LT_'Int__INT (normalize2 kl) config (-1)
|Lbllog2Int -> evallog2Int (normalize1 kl) config (-1)
|Lbl'Hash'stdin_K'Hyph'IO -> eval'Hash'stdin_K'Hyph'IO (normalize0 kl) config (-1)
|LblBase2String -> evalBase2String (normalize2 kl) config (-1)
|LblListItem -> evalListItem (normalize1 kl) config (-1)
|LblisWriteCell -> evalisWriteCell (normalize1 kl) config (-1)
|LblisStream -> evalisStream (normalize1 kl) config (-1)
|Lbl_'_GT_Eqls'String__STRING -> eval_'_GT_Eqls'String__STRING (normalize2 kl) config (-1)
|Lbl'Stop'FunDefCellMap -> eval'Stop'FunDefCellMap (normalize0 kl) config (-1)
|Lbl_'_LT_Eqls'Map__MAP -> eval_'_LT_Eqls'Map__MAP (normalize2 kl) config (-1)
|LblnewUUID_STRING -> evalnewUUID_STRING (normalize0 kl) config (-1)
|LblsizeMap -> evalsizeMap (normalize1 kl) config (-1)
|LblisId -> evalisId (normalize1 kl) config (-1)
|LblsubstrString -> evalsubstrString (normalize3 kl) config (-1)
|Lblsize -> evalsize (normalize1 kl) config (-1)
|LblisIndexes -> evalisIndexes (normalize1 kl) config (-1)
|LblinitTimerCell -> evalinitTimerCell (normalize0 kl) config (-1)
|Lbl'Hash'unwrapVal -> eval'Hash'unwrapVal (normalize1 kl) config (-1)
|LblisFretCellOpt -> evalisFretCellOpt (normalize1 kl) config (-1)
|Lbl'Hash'existRef -> eval'Hash'existRef (normalize3 kl) config (-1)
|LblinitStatesCell -> evalinitStatesCell (normalize1 kl) config (-1)
|LblisWriteCellOpt -> evalisWriteCellOpt (normalize1 kl) config (-1)
|Lbl_inList_ -> eval_inList_ (normalize2 kl) config (-1)
|LblinitFunDefCell -> evalinitFunDefCell (normalize0 kl) config (-1)
|LblminInt'LPar'_'Comm'_'RPar'_INT -> evalminInt'LPar'_'Comm'_'RPar'_INT (normalize2 kl) config (-1)
|LblisMap -> evalisMap (normalize1 kl) config (-1)
|LblsrandInt -> evalsrandInt (normalize1 kl) config (-1)
|LblisKItem -> evalisKItem (normalize1 kl) config (-1)
|LblisStoreCell -> evalisStoreCell (normalize1 kl) config (-1)
|LblisStmts -> evalisStmts (normalize1 kl) config (-1)
|LblList'Coln'set -> evalList'Coln'set (normalize3 kl) config (-1)
|LblString2Base -> evalString2Base (normalize2 kl) config (-1)
|LblisTCellFragment -> evalisTCellFragment (normalize1 kl) config (-1)
|LblisStatesCellFragment -> evalisStatesCellFragment (normalize1 kl) config (-1)
|Lblreplace'LPar'_'Comm'_'Comm'_'Comm'_'RPar'_STRING -> evalreplace'LPar'_'Comm'_'Comm'_'Comm'_'RPar'_STRING (normalize4 kl) config (-1)
|LblisFbodyCell -> evalisFbodyCell (normalize1 kl) config (-1)
|Lbl_'Slsh'Int__INT -> eval_'Slsh'Int__INT (normalize2 kl) config (-1)
|Lbl_'LSqB'_'_LT_Hyph'_'RSqB'_MAP -> eval_'LSqB'_'_LT_Hyph'_'RSqB'_MAP (normalize3 kl) config (-1)
|Lbl'Hash'tell'LPar'_'RPar'_K'Hyph'IO -> eval'Hash'tell'LPar'_'RPar'_K'Hyph'IO (normalize1 kl) config (-1)
|Lblkeys -> evalkeys (normalize1 kl) config (-1)
|LblisParameter -> evalisParameter (normalize1 kl) config (-1)
|LblisLifetime -> evalisLifetime (normalize1 kl) config (-1)
|LblisFparamsCell -> evalisFparamsCell (normalize1 kl) config (-1)
|LblgetKLabel -> evalgetKLabel (normalize1 kl) config (-1)
|LblisEnvCellOpt -> evalisEnvCellOpt (normalize1 kl) config (-1)
|LblisExp -> evalisExp (normalize1 kl) config (-1)
|Lbl'Hash'seekEnd'LPar'_'Comm'_'RPar'_K'Hyph'IO -> eval'Hash'seekEnd'LPar'_'Comm'_'RPar'_K'Hyph'IO (normalize2 kl) config (-1)
|LblisLOCK -> evalisLOCK (normalize1 kl) config (-1)
|LblisFretCell -> evalisFretCell (normalize1 kl) config (-1)
| _ -> [denormalize c])
| _ -> [denormalize c]
let rec get_next_op_from_exp(c: kitem) : (k -> k * (step_function)) = step
and step (c:k) : k * step_function =
 try let config = c in match c with 
| _ -> lookups_step c c (-1)
with Sys.Break -> raise (Stuck c)
and lookups_step (c: k) (config: k) (guard: int) : k * step_function = match c with 
| (KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',(var_0_808)) :: []),(var_1_809),(var_2_810),(var_3_811)) :: []) when guard < 74 -> (match (var_0_808) with 
| [Map (_,_,collection)] -> let (choice, f) = (KMap.fold (fun e v (result, f) -> let rec stepElt = fun guard -> if result == interned_bottom then (match e with (*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(HOLE~>`#freezer#Deallocate0_`(.KList)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#Deallocate(HOLE)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(isExp(HOLE),`_andBool_`(#token("true","Bool"),`notBool_`(isKResult(HOLE))))) ensures #token("true","Bool") [UNIQUE_ID(527ef7144735dca2f7b4866cf493ea2a875b223f5a36a7a42bee2968a3b0781b) heat() klabel(#Deallocate) org.kframework.attributes.Location(Location(433,12,433,48)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) productionID(746115872) strict()]|}*)
| (var_4_812) as e22 when guard < 0 -> (let e = ((evalMap'Coln'lookup((var_0_808),e22) config (-1))) in match e with 
| [Bottom] -> (stepElt 0)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_813),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'Deallocate,(var_5_814 :: [])) :: var_6_815)) :: []),(var_7_816),(var_8_817),(var_9_818),(var_10_819),(var_11_820),(var_12_821)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e22) config (-1))) in match e with 
| [Bottom] -> (stepElt 0)
| ((Map (SortStateCellMap,_,_) as var_13_822) :: []) when ((((((true) && (true))) && (true))) && ((((isTrue (evalisExp((var_5_814 :: [])) config (-1)))) && (((true) && ((not ((isTrue (evalisKResult((var_5_814 :: [])) config (-1))))))))))) && (((compare var_4_812 var_4_813) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e22,(KApply8(Lbl'_LT_'state'_GT_',e22,(KApply1(Lbl'_LT_'k'_GT_',(var_5_814 :: const'Hash'freezer'Hash'Deallocate0_ :: var_6_815)) :: []),(var_7_816),(var_8_817),(var_9_818),(var_10_819),(var_11_820),(var_12_821)) :: [])) config (-1))),(var_13_822 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 0))| _ -> (stepElt 0))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#borrowMutCK(L,BEG,END,L1)~>DotVar3),_1,`<store>`(`_Map_`(`_|->_`(L,#br(BEG,END,#mutRef(L1))),DotVar4)),_2,_3,_4,_5)),DotVar1)``),_6,_7,_8) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#lvDref(#loc(L))~>DotVar3),_1,`<store>`(_9),_2,_3,_4,_5),`Map:lookup`(_10,_0))),#match(DotVar4,`_[_<-undef]`(_9,L))),#match(#br(BEG,END,#mutRef(L1)),`Map:lookup`(_9,L))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(`_andBool_`(`_andBool_`(isInt(END),isInt(L)),isInt(L1)),isInt(BEG))) ensures #token("true","Bool") [UNIQUE_ID(06baa83ab3e85d53cd0970445383a2452c346b648c7fabea864d505c4d4c9f92) contentStartColumn(6) contentStartLine(383) org.kframework.attributes.Location(Location(383,6,385,71)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_823) as e23 when guard < 1 -> (let e = ((evalMap'Coln'lookup((var_0_808),e23) config (-1))) in match e with 
| [Bottom] -> (stepElt 1)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_824),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'lvDref,(KApply1(Lbl'Hash'loc,((Int _ as var_5_825) :: [])) :: [])) :: var_9_826)) :: []),(var_10_827),(KApply1(Lbl'_LT_'store'_GT_',(var_17_828)) :: []),(var_12_829),(var_13_830),(var_14_831),(var_15_832)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_17_828),(var_5_825 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 1)
| ((Map (SortMap,_,_) as var_11_833) :: []) -> (let e = ((evalMap'Coln'lookup((var_17_828),(var_5_825 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 1)
| (KApply3(Lbl'Hash'br,((Int _ as var_6_834) :: []),((Int _ as var_7_835) :: []),(KApply1(Lbl'Hash'mutRef,((Int _ as var_8_836) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e23) config (-1))) in match e with 
| [Bottom] -> (stepElt 1)
| ((Map (SortStateCellMap,_,_) as var_16_837) :: []) when ((((((((((true) && (true))) && (true))) && (true))) && (true))) && (((((((true) && (true))) && (true))) && (true)))) && (((compare var_4_823 var_4_824) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e23,(KApply8(Lbl'_LT_'state'_GT_',e23,(KApply1(Lbl'_LT_'k'_GT_',(KApply4(Lbl'Hash'borrowMutCK,(var_5_825 :: []),(var_6_834 :: []),(var_7_835 :: []),(var_8_836 :: [])) :: var_9_826)) :: []),(var_10_827),(KApply1(Lbl'_LT_'store'_GT_',((eval_Map_(((eval_'PipeHyph_GT_'_((var_5_825 :: []),(KApply3(Lbl'Hash'br,(var_6_834 :: []),(var_7_835 :: []),(KApply1(Lbl'Hash'mutRef,(var_8_836 :: [])) :: [])) :: [])) config (-1))),(var_11_833 :: [])) config (-1)))) :: []),(var_12_829),(var_13_830),(var_14_831),(var_15_832)) :: [])) config (-1))),(var_16_837 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 1))| _ -> (stepElt 1))| _ -> (stepElt 1))| _ -> (stepElt 1))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(HOLE~>`#freezer#lvDref0_`(.KList)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#lvDref(HOLE)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(isExp(HOLE),`_andBool_`(#token("true","Bool"),`notBool_`(isKResult(HOLE))))) ensures #token("true","Bool") [UNIQUE_ID(50da0121afe4a4129fdb9a9bd6942c132fad806055754ee56529c5b837fa9a91) heat() klabel(#lvDref) org.kframework.attributes.Location(Location(373,12,373,40)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) productionID(1533985074) strict()]|}*)
| (var_4_838) as e24 when guard < 2 -> (let e = ((evalMap'Coln'lookup((var_0_808),e24) config (-1))) in match e with 
| [Bottom] -> (stepElt 2)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_839),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'lvDref,(var_5_840 :: [])) :: var_6_841)) :: []),(var_7_842),(var_8_843),(var_9_844),(var_10_845),(var_11_846),(var_12_847)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e24) config (-1))) in match e with 
| [Bottom] -> (stepElt 2)
| ((Map (SortStateCellMap,_,_) as var_13_848) :: []) when ((((((true) && (true))) && (true))) && ((((isTrue (evalisExp((var_5_840 :: [])) config (-1)))) && (((true) && ((not ((isTrue (evalisKResult((var_5_840 :: [])) config (-1))))))))))) && (((compare var_4_838 var_4_839) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e24,(KApply8(Lbl'_LT_'state'_GT_',e24,(KApply1(Lbl'_LT_'k'_GT_',(var_5_840 :: const'Hash'freezer'Hash'lvDref0_ :: var_6_841)) :: []),(var_7_842),(var_8_843),(var_9_844),(var_10_845),(var_11_846),(var_12_847)) :: [])) config (-1))),(var_13_848 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 2))| _ -> (stepElt 2))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#borrowImmCK(L,BEG,END,L1)~>DotVar3),_1,`<store>`(`_Map_`(`_|->_`(L,#br(BEG,END,#immRef(L1))),DotVar4)),_2,_3,_4,_5)),DotVar1)``),_6,_7,_8) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#lvDref(#loc(L))~>DotVar3),_1,`<store>`(_9),_2,_3,_4,_5),`Map:lookup`(_10,_0))),#match(DotVar4,`_[_<-undef]`(_9,L))),#match(#br(BEG,END,#immRef(L1)),`Map:lookup`(_9,L))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(`_andBool_`(`_andBool_`(isInt(END),isInt(L)),isInt(L1)),isInt(BEG))) ensures #token("true","Bool") [UNIQUE_ID(311563087fa06964cc0a7e15ad73beec4125de80901afe8ca01282811b731f9c) contentStartColumn(6) contentStartLine(255) org.kframework.attributes.Location(Location(255,6,257,71)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_849) as e25 when guard < 3 -> (let e = ((evalMap'Coln'lookup((var_0_808),e25) config (-1))) in match e with 
| [Bottom] -> (stepElt 3)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_850),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'lvDref,(KApply1(Lbl'Hash'loc,((Int _ as var_5_851) :: [])) :: [])) :: var_9_852)) :: []),(var_10_853),(KApply1(Lbl'_LT_'store'_GT_',(var_17_854)) :: []),(var_12_855),(var_13_856),(var_14_857),(var_15_858)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_17_854),(var_5_851 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 3)
| ((Map (SortMap,_,_) as var_11_859) :: []) -> (let e = ((evalMap'Coln'lookup((var_17_854),(var_5_851 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 3)
| (KApply3(Lbl'Hash'br,((Int _ as var_6_860) :: []),((Int _ as var_7_861) :: []),(KApply1(Lbl'Hash'immRef,((Int _ as var_8_862) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e25) config (-1))) in match e with 
| [Bottom] -> (stepElt 3)
| ((Map (SortStateCellMap,_,_) as var_16_863) :: []) when ((((((((((true) && (true))) && (true))) && (true))) && (true))) && (((((((true) && (true))) && (true))) && (true)))) && (((compare var_4_850 var_4_849) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e25,(KApply8(Lbl'_LT_'state'_GT_',e25,(KApply1(Lbl'_LT_'k'_GT_',(KApply4(Lbl'Hash'borrowImmCK,(var_5_851 :: []),(var_6_860 :: []),(var_7_861 :: []),(var_8_862 :: [])) :: var_9_852)) :: []),(var_10_853),(KApply1(Lbl'_LT_'store'_GT_',((eval_Map_(((eval_'PipeHyph_GT_'_((var_5_851 :: []),(KApply3(Lbl'Hash'br,(var_6_860 :: []),(var_7_861 :: []),(KApply1(Lbl'Hash'immRef,(var_8_862 :: [])) :: [])) :: [])) config (-1))),(var_11_859 :: [])) config (-1)))) :: []),(var_12_855),(var_13_856),(var_14_857),(var_15_858)) :: [])) config (-1))),(var_16_863 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 3))| _ -> (stepElt 3))| _ -> (stepElt 3))| _ -> (stepElt 3))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(DotVar3),_1,`<store>`(`_Map_`(`_|->_`(F,`#uninit_OSL-SYNTAX`(.KList)),DotVar4)),_2,_3,_4,_5)),DotVar1)``),_6,_7,_8) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#uninitialize(#loc(F))~>DotVar3),_1,`<store>`(_9),_2,_3,_4,_5),`Map:lookup`(_10,_0))),#match(DotVar4,`_[_<-undef]`(_9,F))),#match(_68,`Map:lookup`(_9,F))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(isKItem(_68),isInt(F))) ensures #token("true","Bool") [UNIQUE_ID(b8f3536fd37c0603e5c9944f77297ce03c8a3b732c5c575eeb9dd102208bf8da) contentStartColumn(6) contentStartLine(161) org.kframework.attributes.Location(Location(161,6,162,51)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_864) as e26 when guard < 4 -> (let e = ((evalMap'Coln'lookup((var_0_808),e26) config (-1))) in match e with 
| [Bottom] -> (stepElt 4)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_865),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'uninitialize,(KApply1(Lbl'Hash'loc,((Int _ as var_7_866) :: [])) :: [])) :: var_5_867)) :: []),(var_6_868),(KApply1(Lbl'_LT_'store'_GT_',(var_14_869)) :: []),(var_9_870),(var_10_871),(var_11_872),(var_12_873)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_14_869),(var_7_866 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 4)
| ((Map (SortMap,_,_) as var_8_874) :: []) -> (let e = ((evalMap'Coln'lookup((var_14_869),(var_7_866 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 4)
| (var_15_875 :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e26) config (-1))) in match e with 
| [Bottom] -> (stepElt 4)
| ((Map (SortStateCellMap,_,_) as var_13_876) :: []) when ((((((((((true) && (true))) && (true))) && (true))) && (true))) && (((true) && (true)))) && (((compare var_4_865 var_4_864) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e26,(KApply8(Lbl'_LT_'state'_GT_',e26,(KApply1(Lbl'_LT_'k'_GT_',(var_5_867)) :: []),(var_6_868),(KApply1(Lbl'_LT_'store'_GT_',((eval_Map_(((eval_'PipeHyph_GT_'_((var_7_866 :: []),(const'Hash'uninit_OSL'Hyph'SYNTAX :: [])) config (-1))),(var_8_874 :: [])) config (-1)))) :: []),(var_9_870),(var_10_871),(var_11_872),(var_12_873)) :: [])) config (-1))),(var_13_876 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 4))| _ -> (stepElt 4))| _ -> (stepElt 4))| _ -> (stepElt 4))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#Deallocate(HOLE)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(HOLE~>`#freezer#Deallocate0_`(.KList)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(isExp(HOLE),`_andBool_`(#token("true","Bool"),isKResult(HOLE)))) ensures #token("true","Bool") [UNIQUE_ID(deb5cf048b96ccb63084a9440ca74ab2b8709173096ad9f9481f0e7c61499d5d) cool() klabel(#Deallocate) org.kframework.attributes.Location(Location(433,12,433,48)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) productionID(746115872) strict()]|}*)
| (var_4_877) as e27 when guard < 5 -> (let e = ((evalMap'Coln'lookup((var_0_808),e27) config (-1))) in match e with 
| [Bottom] -> (stepElt 5)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_878),(KApply1(Lbl'_LT_'k'_GT_',(var_5_879 :: KApply0(Lbl'Hash'freezer'Hash'Deallocate0_) :: var_6_880)) :: []),(var_7_881),(var_8_882),(var_9_883),(var_10_884),(var_11_885),(var_12_886)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e27) config (-1))) in match e with 
| [Bottom] -> (stepElt 5)
| ((Map (SortStateCellMap,_,_) as var_13_887) :: []) when ((((((true) && (true))) && (true))) && ((((isTrue (evalisExp((var_5_879 :: [])) config (-1)))) && (((true) && ((isTrue (evalisKResult((var_5_879 :: [])) config (-1))))))))) && (((compare var_4_877 var_4_878) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e27,(KApply8(Lbl'_LT_'state'_GT_',e27,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'Deallocate,(var_5_879 :: [])) :: var_6_880)) :: []),(var_7_881),(var_8_882),(var_9_883),(var_10_884),(var_11_885),(var_12_886)) :: [])) config (-1))),(var_13_887 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 5))| _ -> (stepElt 5))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(DotVar3),_1,`<store>`(`_Map_`(`_|->_`(L,`#uninit_OSL-SYNTAX`(.KList)),DotVar4)),_2,_3,_4,_5)),DotVar1)``),_6,_7,_8) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#Transferuninit(`#uninit_OSL-SYNTAX`(.KList),#loc(L))~>DotVar3),_1,`<store>`(_9),_2,_3,_4,_5),`Map:lookup`(_10,_0))),#match(DotVar4,`_[_<-undef]`(_9,L))),#match(_58,`Map:lookup`(_9,L))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(isKItem(_58),isInt(L))) ensures #token("true","Bool") [UNIQUE_ID(e1a3613f961632c0aaeb2da5d233e2d450bf4569257c10bcaffe80452458cfa3) contentStartColumn(6) contentStartLine(127) org.kframework.attributes.Location(Location(127,6,128,51)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_888) as e28 when guard < 6 -> (let e = ((evalMap'Coln'lookup((var_0_808),e28) config (-1))) in match e with 
| [Bottom] -> (stepElt 6)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_889),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'Transferuninit,(KApply0(Lbl'Hash'uninit_OSL'Hyph'SYNTAX) :: []),(KApply1(Lbl'Hash'loc,((Int _ as var_7_890) :: [])) :: [])) :: var_5_891)) :: []),(var_6_892),(KApply1(Lbl'_LT_'store'_GT_',(var_14_893)) :: []),(var_9_894),(var_10_895),(var_11_896),(var_12_897)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_14_893),(var_7_890 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 6)
| ((Map (SortMap,_,_) as var_8_898) :: []) -> (let e = ((evalMap'Coln'lookup((var_14_893),(var_7_890 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 6)
| (var_15_899 :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e28) config (-1))) in match e with 
| [Bottom] -> (stepElt 6)
| ((Map (SortStateCellMap,_,_) as var_13_900) :: []) when ((((((((((true) && (true))) && (true))) && (true))) && (true))) && (((true) && (true)))) && (((compare var_4_888 var_4_889) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e28,(KApply8(Lbl'_LT_'state'_GT_',e28,(KApply1(Lbl'_LT_'k'_GT_',(var_5_891)) :: []),(var_6_892),(KApply1(Lbl'_LT_'store'_GT_',((eval_Map_(((eval_'PipeHyph_GT_'_((var_7_890 :: []),(const'Hash'uninit_OSL'Hyph'SYNTAX :: [])) config (-1))),(var_8_898 :: [])) config (-1)))) :: []),(var_9_894),(var_10_895),(var_11_896),(var_12_897)) :: [])) config (-1))),(var_13_900 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 6))| _ -> (stepElt 6))| _ -> (stepElt 6))| _ -> (stepElt 6))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#Read(#borrowMutCK(L,BEG,END,L1))~>#loc(L1)~>DotVar3),_1,`<store>`(`_Map_`(`_|->_`(L,#br(BEG,END,#mutRef(L1))),DotVar4)),_2,_3,_4,_5)),DotVar1)``),_6,_7,_8) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#read(#loc(L))~>DotVar3),_1,`<store>`(_9),_2,_3,_4,_5),`Map:lookup`(_10,_0))),#match(DotVar4,`_[_<-undef]`(_9,L))),#match(#br(BEG,END,#mutRef(L1)),`Map:lookup`(_9,L))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(`_andBool_`(`_andBool_`(isInt(END),isInt(L)),isInt(L1)),isInt(BEG))) ensures #token("true","Bool") [UNIQUE_ID(7f772b7b274214985fe222aae8f0727d4fd0da770e94917f96deb5aa84ae59d1) contentStartColumn(6) contentStartLine(184) org.kframework.attributes.Location(Location(184,6,185,75)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_901) as e29 when guard < 7 -> (let e = ((evalMap'Coln'lookup((var_0_808),e29) config (-1))) in match e with 
| [Bottom] -> (stepElt 7)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_902),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'read,(KApply1(Lbl'Hash'loc,((Int _ as var_5_903) :: [])) :: [])) :: var_9_904)) :: []),(var_10_905),(KApply1(Lbl'_LT_'store'_GT_',(var_17_906)) :: []),(var_12_907),(var_13_908),(var_14_909),(var_15_910)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_17_906),(var_5_903 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 7)
| ((Map (SortMap,_,_) as var_11_911) :: []) -> (let e = ((evalMap'Coln'lookup((var_17_906),(var_5_903 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 7)
| (KApply3(Lbl'Hash'br,((Int _ as var_6_912) :: []),((Int _ as var_7_913) :: []),(KApply1(Lbl'Hash'mutRef,((Int _ as var_8_914) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e29) config (-1))) in match e with 
| [Bottom] -> (stepElt 7)
| ((Map (SortStateCellMap,_,_) as var_16_915) :: []) when ((((((((((true) && (true))) && (true))) && (true))) && (true))) && (((((((true) && (true))) && (true))) && (true)))) && (((compare var_4_902 var_4_901) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e29,(KApply8(Lbl'_LT_'state'_GT_',e29,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'Read,(KApply4(Lbl'Hash'borrowMutCK,(var_5_903 :: []),(var_6_912 :: []),(var_7_913 :: []),(var_8_914 :: [])) :: [])) :: KApply1(Lbl'Hash'loc,(var_8_914 :: [])) :: var_9_904)) :: []),(var_10_905),(KApply1(Lbl'_LT_'store'_GT_',((eval_Map_(((eval_'PipeHyph_GT_'_((var_5_903 :: []),(KApply3(Lbl'Hash'br,(var_6_912 :: []),(var_7_913 :: []),(KApply1(Lbl'Hash'mutRef,(var_8_914 :: [])) :: [])) :: [])) config (-1))),(var_11_911 :: [])) config (-1)))) :: []),(var_12_907),(var_13_908),(var_14_909),(var_15_910)) :: [])) config (-1))),(var_16_915 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 7))| _ -> (stepElt 7))| _ -> (stepElt 7))| _ -> (stepElt 7))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(DotVar3),_1,`<store>`(`_Map_`(`_|->_`(L,#rs(R)),DotVar4)),_2,_3,_4,_5)),DotVar1)``),_6,_7,_8) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#Transfer(#rs(R),#loc(L))~>DotVar3),_1,`<store>`(_9),_2,_3,_4,_5),`Map:lookup`(_10,_0))),#match(_46,`Map:lookup`(_9,L))),#match(DotVar4,`_[_<-undef]`(_9,L))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(`_andBool_`(isKItem(_46),isProps(R)),isInt(L))) ensures #token("true","Bool") [UNIQUE_ID(27831a875e75b349000198dc7944082770d313452edf63daf53cb87277560e9a) contentStartColumn(6) contentStartLine(124) org.kframework.attributes.Location(Location(124,6,125,50)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_916) as e30 when guard < 8 -> (let e = ((evalMap'Coln'lookup((var_0_808),e30) config (-1))) in match e with 
| [Bottom] -> (stepElt 8)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_917),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'Transfer,(KApply1(Lbl'Hash'rs,(var_8_918 :: [])) :: []),(KApply1(Lbl'Hash'loc,((Int _ as var_7_919) :: [])) :: [])) :: var_5_920)) :: []),(var_6_921),(KApply1(Lbl'_LT_'store'_GT_',(var_15_922)) :: []),(var_10_923),(var_11_924),(var_12_925),(var_13_926)) :: []) -> (let e = ((evalMap'Coln'lookup((var_15_922),(var_7_919 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 8)
| (var_16_927 :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_15_922),(var_7_919 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 8)
| ((Map (SortMap,_,_) as var_9_928) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e30) config (-1))) in match e with 
| [Bottom] -> (stepElt 8)
| ((Map (SortStateCellMap,_,_) as var_14_929) :: []) when ((((((((((true) && (true))) && (true))) && (true))) && (true))) && (((((true) && ((isTrue (evalisProps((var_8_918 :: [])) config (-1)))))) && (true)))) && (((compare var_4_917 var_4_916) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e30,(KApply8(Lbl'_LT_'state'_GT_',e30,(KApply1(Lbl'_LT_'k'_GT_',(var_5_920)) :: []),(var_6_921),(KApply1(Lbl'_LT_'store'_GT_',((eval_Map_(((eval_'PipeHyph_GT_'_((var_7_919 :: []),(KApply1(Lbl'Hash'rs,(var_8_918 :: [])) :: [])) config (-1))),(var_9_928 :: [])) config (-1)))) :: []),(var_10_923),(var_11_924),(var_12_925),(var_13_926)) :: [])) config (-1))),(var_14_929 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 8))| _ -> (stepElt 8))| _ -> (stepElt 8))| _ -> (stepElt 8))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(HOLE~>`#freezer#Transferuninit0_`(K0)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#Transferuninit(K0,HOLE)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(`_andBool_`(isExp(HOLE),isK(K0)),`_andBool_`(#token("true","Bool"),`notBool_`(isKResult(HOLE))))) ensures #token("true","Bool") [UNIQUE_ID(aaa9546198ef2350904d1504fad2003244643d3a8b2ae5c8e13ac25a234266bd) heat() klabel(#Transferuninit) org.kframework.attributes.Location(Location(44,12,44,46)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) productionID(1066513687) strict(2)]|}*)
| (var_4_930) as e31 when guard < 9 -> (let e = ((evalMap'Coln'lookup((var_0_808),e31) config (-1))) in match e with 
| [Bottom] -> (stepElt 9)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_931),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'Transferuninit,(var_6_932),(var_5_933 :: [])) :: var_7_934)) :: []),(var_8_935),(var_9_936),(var_10_937),(var_11_938),(var_12_939),(var_13_940)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e31) config (-1))) in match e with 
| [Bottom] -> (stepElt 9)
| ((Map (SortStateCellMap,_,_) as var_14_941) :: []) when ((((((true) && (true))) && (true))) && ((((((isTrue (evalisExp((var_5_933 :: [])) config (-1)))) && (true))) && (((true) && ((not ((isTrue (evalisKResult((var_5_933 :: [])) config (-1))))))))))) && (((compare var_4_931 var_4_930) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e31,(KApply8(Lbl'_LT_'state'_GT_',e31,(KApply1(Lbl'_LT_'k'_GT_',(var_5_933 :: KApply1(Lbl'Hash'freezer'Hash'Transferuninit0_,(var_6_932)) :: var_7_934)) :: []),(var_8_935),(var_9_936),(var_10_937),(var_11_938),(var_12_939),(var_13_940)) :: [])) config (-1))),(var_14_941 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 9))| _ -> (stepElt 9))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(`#removeState_CONTROL`(.KList)),`<env>`(ENV),`<store>`(STORE),`<stack>`(STACK),_1,_2,_3)),`StateCellMapItem`(`<index>`(N),`<state>`(`<index>`(N),`<k>`(Pro),`<env>`(ENV1),`<store>`(STORE1),`<stack>`(STACK1),_4,_5,_6))),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#loopSep(N)~>Rest),`<env>`(ENV),`<store>`(STORE),`<stack>`(STACK),_1,_2,_3),`Map:lookup`(_10,_0))),#match(`<state>`(`<index>`(N),`<k>`(Pro),`<env>`(ENV1),`<store>`(STORE1),`<stack>`(STACK1),_4,_5,_6),`Map:lookup`(_10,`<index>`(N)))),#match(DotVar1,`_[_<-undef]`(`_[_<-undef]`(_10,_0),`<index>`(N)))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isMap(ENV1),isMap(ENV)),isInt(N)),isK(Rest)),isMap(STORE)),isK(Pro)),isList(STACK)),isList(STACK1)),isMap(STORE1)),`_andBool_`(`_==K_`(Pro,#compare(Rest)),#compareS(STORE,STORE1)))) ensures #token("true","Bool") [UNIQUE_ID(dcbde4804b469daa0fe01b15d7c401ae3f491a6aa8f44e3621e29754c61c0361) contentStartColumn(6) contentStartLine(88) org.kframework.attributes.Location(Location(88,6,103,72)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (var_4_942) as e32 when guard < 10 -> (let e = ((evalMap'Coln'lookup((var_0_808),e32) config (-1))) in match e with 
| [Bottom] -> (stepElt 10)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_943),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'loopSep,((Int _ as var_11_944) :: [])) :: var_20_945)) :: []),(KApply1(Lbl'_LT_'env'_GT_',((Map (SortMap,_,_) as var_5_946) :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',((Map (SortMap,_,_) as var_6_947) :: [])) :: []),(KApply1(Lbl'_LT_'stack'_GT_',((List (SortList,_,_) as var_7_948) :: [])) :: []),(var_8_949),(var_9_950),(var_10_951)) :: []) -> (let e = ((evalMap'Coln'lookup((var_0_808),(KApply1(Lbl'_LT_'index'_GT_',(var_11_944 :: [])) :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 10)
| (KApply8(Lbl'_LT_'state'_GT_',(KApply1(Lbl'_LT_'index'_GT_',((Int _ as var_11_952) :: [])) :: []),(KApply1(Lbl'_LT_'k'_GT_',(var_12_953)) :: []),(KApply1(Lbl'_LT_'env'_GT_',((Map (SortMap,_,_) as var_13_954) :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',((Map (SortMap,_,_) as var_14_955) :: [])) :: []),(KApply1(Lbl'_LT_'stack'_GT_',((List (SortList,_,_) as var_15_956) :: [])) :: []),(var_16_957),(var_17_958),(var_18_959)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'(((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e32) config (-1))),(KApply1(Lbl'_LT_'index'_GT_',(var_11_944 :: [])) :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 10)
| ((Map (SortStateCellMap,_,_) as var_19_960) :: []) when ((((((((true) && (true))) && (true))) && (true))) && (((((((((((((((((((true) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && ((((isTrue (eval_'EqlsEqls'K_((var_12_953),(KApply1(Lbl'Hash'compare,(var_20_945)) :: [])) config (-1)))) && ((isTrue (eval'Hash'compareS((var_6_947 :: []),(var_14_955 :: [])) config (-1))))))))) && (((compare var_4_942 var_4_943) = 0) && ((compare_kitem var_11_944 var_11_952) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((eval_StateCellMap_(((evalStateCellMapItem(e32,(KApply8(Lbl'_LT_'state'_GT_',e32,(KApply1(Lbl'_LT_'k'_GT_',(const'Hash'removeState_CONTROL :: [])) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_5_946 :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',(var_6_947 :: [])) :: []),(KApply1(Lbl'_LT_'stack'_GT_',(var_7_948 :: [])) :: []),(var_8_949),(var_9_950),(var_10_951)) :: [])) config (-1))),((evalStateCellMapItem((KApply1(Lbl'_LT_'index'_GT_',(var_11_944 :: [])) :: []),(KApply8(Lbl'_LT_'state'_GT_',(KApply1(Lbl'_LT_'index'_GT_',(var_11_944 :: [])) :: []),(KApply1(Lbl'_LT_'k'_GT_',(var_12_953)) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_13_954 :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',(var_14_955 :: [])) :: []),(KApply1(Lbl'_LT_'stack'_GT_',(var_15_956 :: [])) :: []),(var_16_957),(var_17_958),(var_18_959)) :: [])) config (-1)))) config (-1))),(var_19_960 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 10))| _ -> (stepElt 10))| _ -> (stepElt 10))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(HOLE~>`#freezer#Transfer0_`(K0)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#Transfer(K0,HOLE)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(`_andBool_`(isExp(HOLE),isK(K0)),`_andBool_`(#token("true","Bool"),`notBool_`(isKResult(HOLE))))) ensures #token("true","Bool") [UNIQUE_ID(b26dd0a38c100416025cd949eb36be020f9c9527ef30016506520f476a76fa6d) heat() klabel(#Transfer) org.kframework.attributes.Location(Location(42,12,42,38)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) productionID(1329315688) strict()]|}*)
| (var_4_961) as e33 when guard < 11 -> (let e = ((evalMap'Coln'lookup((var_0_808),e33) config (-1))) in match e with 
| [Bottom] -> (stepElt 11)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_962),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'Transfer,(var_6_963),(var_5_964 :: [])) :: var_7_965)) :: []),(var_8_966),(var_9_967),(var_10_968),(var_11_969),(var_12_970),(var_13_971)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e33) config (-1))) in match e with 
| [Bottom] -> (stepElt 11)
| ((Map (SortStateCellMap,_,_) as var_14_972) :: []) when ((((((true) && (true))) && (true))) && ((((((isTrue (evalisExp((var_5_964 :: [])) config (-1)))) && (true))) && (((true) && ((not ((isTrue (evalisKResult((var_5_964 :: [])) config (-1))))))))))) && (((compare var_4_961 var_4_962) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e33,(KApply8(Lbl'_LT_'state'_GT_',e33,(KApply1(Lbl'_LT_'k'_GT_',(var_5_964 :: KApply1(Lbl'Hash'freezer'Hash'Transfer0_,(var_6_963)) :: var_7_965)) :: []),(var_8_966),(var_9_967),(var_10_968),(var_11_969),(var_12_970),(var_13_971)) :: [])) config (-1))),(var_14_972 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 11))| _ -> (stepElt 11))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(V~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(V~>`.List{"___OSL-SYNTAX"}`(.KList)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),isValue(V)) ensures #token("true","Bool") [UNIQUE_ID(ba0cd2a310839620f3de02ba0066bfe27b5ba1d277bca3eecdc7e10f96cd03da) contentStartColumn(6) contentStartLine(23) org.kframework.attributes.Location(Location(23,6,23,28)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_973) as e34 when guard < 12 -> (let e = ((evalMap'Coln'lookup((var_0_808),e34) config (-1))) in match e with 
| [Bottom] -> (stepElt 12)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_974),(KApply1(Lbl'_LT_'k'_GT_',(var_5_975 :: KApply0(Lbl'Stop'List'LBraQuot'___OSL'Hyph'SYNTAX'QuotRBra') :: var_6_976)) :: []),(var_7_977),(var_8_978),(var_9_979),(var_10_980),(var_11_981),(var_12_982)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e34) config (-1))) in match e with 
| [Bottom] -> (stepElt 12)
| ((Map (SortStateCellMap,_,_) as var_13_983) :: []) when ((((((true) && (true))) && (true))) && ((isTrue (evalisValue((var_5_975 :: [])) config (-1))))) && (((compare var_4_973 var_4_974) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e34,(KApply8(Lbl'_LT_'state'_GT_',e34,(KApply1(Lbl'_LT_'k'_GT_',(var_5_975 :: var_6_976)) :: []),(var_7_977),(var_8_978),(var_9_979),(var_10_980),(var_11_981),(var_12_982)) :: [])) config (-1))),(var_13_983 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 12))| _ -> (stepElt 12))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#Read(#read(#loc(L)))~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#Read(#loc(L))~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),isInt(L)) ensures #token("true","Bool") [UNIQUE_ID(e3648e1177613979775f9d7040c930da4608f7bda33c5413428bc0c78ff9e116) contentStartColumn(6) contentStartLine(180) org.kframework.attributes.Location(Location(180,6,180,48)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_984) as e35 when guard < 13 -> (let e = ((evalMap'Coln'lookup((var_0_808),e35) config (-1))) in match e with 
| [Bottom] -> (stepElt 13)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_985),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'Read,(KApply1(Lbl'Hash'loc,((Int _ as var_5_986) :: [])) :: [])) :: var_6_987)) :: []),(var_7_988),(var_8_989),(var_9_990),(var_10_991),(var_11_992),(var_12_993)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e35) config (-1))) in match e with 
| [Bottom] -> (stepElt 13)
| ((Map (SortStateCellMap,_,_) as var_13_994) :: []) when ((((((true) && (true))) && (true))) && (true)) && (((compare var_4_984 var_4_985) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e35,(KApply8(Lbl'_LT_'state'_GT_',e35,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'Read,(KApply1(Lbl'Hash'read,(KApply1(Lbl'Hash'loc,(var_5_986 :: [])) :: [])) :: [])) :: var_6_987)) :: []),(var_7_988),(var_8_989),(var_9_990),(var_10_991),(var_11_992),(var_12_993)) :: [])) config (-1))),(var_13_994 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 13))| _ -> (stepElt 13))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(HOLE~>`#freezer#Read0_`(.KList)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#Read(HOLE)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(isK(HOLE),`_andBool_`(#token("true","Bool"),`notBool_`(isKResult(HOLE))))) ensures #token("true","Bool") [UNIQUE_ID(043dcdc69e66d003dd62a59472edd4f2d0b41eb5bb133676e0bcbc0637d450fa) heat() klabel(#Read) org.kframework.attributes.Location(Location(207,12,207,40)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) productionID(189207010) strict()]|}*)
| (var_4_995) as e36 when guard < 14 -> (let e = ((evalMap'Coln'lookup((var_0_808),e36) config (-1))) in match e with 
| [Bottom] -> (stepElt 14)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_996),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'Read,(var_5_997)) :: var_6_998)) :: []),(var_7_999),(var_8_1000),(var_9_1001),(var_10_1002),(var_11_1003),(var_12_1004)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e36) config (-1))) in match e with 
| [Bottom] -> (stepElt 14)
| ((Map (SortStateCellMap,_,_) as var_13_1005) :: []) when ((((((true) && (true))) && (true))) && (((true) && (((true) && ((not ((isTrue (evalisKResult((var_5_997)) config (-1))))))))))) && (((compare var_4_995 var_4_996) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e36,(KApply8(Lbl'_LT_'state'_GT_',e36,(KApply1(Lbl'_LT_'k'_GT_',(var_5_997 @ const'Hash'freezer'Hash'Read0_ :: var_6_998)) :: []),(var_7_999),(var_8_1000),(var_9_1001),(var_10_1002),(var_11_1003),(var_12_1004)) :: [])) config (-1))),(var_13_1005 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 14))| _ -> (stepElt 14))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(HOLE~>`#freezer#TransferIB1_`(K1)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#TransferIB(HOLE,K1)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(`_andBool_`(isK(HOLE),isK(K1)),`_andBool_`(#token("true","Bool"),`notBool_`(isKResult(HOLE))))) ensures #token("true","Bool") [UNIQUE_ID(7e755c2fab4f677cb25527783d30641efb49575f5152fc292709f8973f8511d1) heat() klabel(#TransferIB) org.kframework.attributes.Location(Location(157,12,157,51)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) productionID(24293395) strict(1)]|}*)
| (var_4_1006) as e37 when guard < 15 -> (let e = ((evalMap'Coln'lookup((var_0_808),e37) config (-1))) in match e with 
| [Bottom] -> (stepElt 15)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1007),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'TransferIB,(var_5_1008),(var_6_1009)) :: var_7_1010)) :: []),(var_8_1011),(var_9_1012),(var_10_1013),(var_11_1014),(var_12_1015),(var_13_1016)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e37) config (-1))) in match e with 
| [Bottom] -> (stepElt 15)
| ((Map (SortStateCellMap,_,_) as var_14_1017) :: []) when ((((((true) && (true))) && (true))) && (((((true) && (true))) && (((true) && ((not ((isTrue (evalisKResult((var_5_1008)) config (-1))))))))))) && (((compare var_4_1007 var_4_1006) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e37,(KApply8(Lbl'_LT_'state'_GT_',e37,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1008 @ KApply1(Lbl'Hash'freezer'Hash'TransferIB1_,(var_6_1009)) :: var_7_1010)) :: []),(var_8_1011),(var_9_1012),(var_10_1013),(var_11_1014),(var_12_1015),(var_13_1016)) :: [])) config (-1))),(var_14_1017 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 15))| _ -> (stepElt 15))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#loc(L)~>DotVar3),`<env>`(`_Map_`(`_|->_`(X,L),DotVar4)),_1,_2,_3,_4,_5)),DotVar1)``),_6,_7,_8) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#lv(X)~>DotVar3),`<env>`(_9),_1,_2,_3,_4,_5),`Map:lookup`(_10,_0))),#match(L,`Map:lookup`(_9,X))),#match(DotVar4,`_[_<-undef]`(_9,X))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(isExp(X),isInt(L))) ensures #token("true","Bool") [UNIQUE_ID(1bf6ca92cd4edf6de4fae941359229599d4c96b05161d8ac101c81cd6d5ab905) contentStartColumn(6) contentStartLine(234) org.kframework.attributes.Location(Location(234,6,235,38)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1018) as e38 when guard < 16 -> (let e = ((evalMap'Coln'lookup((var_0_808),e38) config (-1))) in match e with 
| [Bottom] -> (stepElt 16)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1019),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'lv,(var_7_1020 :: [])) :: var_6_1021)) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_15_1022)) :: []),(var_9_1023),(var_10_1024),(var_11_1025),(var_12_1026),(var_13_1027)) :: []) -> (let e = ((evalMap'Coln'lookup((var_15_1022),(var_7_1020 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 16)
| ((Int _ as var_5_1028) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_15_1022),(var_7_1020 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 16)
| ((Map (SortMap,_,_) as var_8_1029) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e38) config (-1))) in match e with 
| [Bottom] -> (stepElt 16)
| ((Map (SortStateCellMap,_,_) as var_14_1030) :: []) when ((((((((((true) && (true))) && (true))) && (true))) && (true))) && ((((isTrue (evalisExp((var_7_1020 :: [])) config (-1)))) && (true)))) && (((compare var_4_1019 var_4_1018) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e38,(KApply8(Lbl'_LT_'state'_GT_',e38,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'loc,(var_5_1028 :: [])) :: var_6_1021)) :: []),(KApply1(Lbl'_LT_'env'_GT_',((eval_Map_(((eval_'PipeHyph_GT_'_((var_7_1020 :: []),(var_5_1028 :: [])) config (-1))),(var_8_1029 :: [])) config (-1)))) :: []),(var_9_1023),(var_10_1024),(var_11_1025),(var_12_1026),(var_13_1027)) :: [])) config (-1))),(var_14_1030 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 16))| _ -> (stepElt 16))| _ -> (stepElt 16))| _ -> (stepElt 16))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#TransferIB(HOLE,K1)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(HOLE~>`#freezer#TransferIB1_`(K1)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(`_andBool_`(isK(HOLE),isK(K1)),`_andBool_`(#token("true","Bool"),isKResult(HOLE)))) ensures #token("true","Bool") [UNIQUE_ID(2c536c23c3867d73948f213fefcca335737876b051501ad6bb772ceda903eeb1) cool() klabel(#TransferIB) org.kframework.attributes.Location(Location(157,12,157,51)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) productionID(24293395) strict(1)]|}*)
| (var_4_1031) as e39 when guard < 17 -> (let e = ((evalMap'Coln'lookup((var_0_808),e39) config (-1))) in match e with 
| [Bottom] -> (stepElt 17)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1032),(KApply1(Lbl'_LT_'k'_GT_',(var_5_1033 :: KApply1(Lbl'Hash'freezer'Hash'TransferIB1_,(var_6_1034)) :: var_7_1035)) :: []),(var_8_1036),(var_9_1037),(var_10_1038),(var_11_1039),(var_12_1040),(var_13_1041)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e39) config (-1))) in match e with 
| [Bottom] -> (stepElt 17)
| ((Map (SortStateCellMap,_,_) as var_14_1042) :: []) when ((((((true) && (true))) && (true))) && (((((true) && (true))) && (((true) && ((isTrue (evalisKResult((var_5_1033 :: [])) config (-1))))))))) && (((compare var_4_1032 var_4_1031) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e39,(KApply8(Lbl'_LT_'state'_GT_',e39,(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'TransferIB,(var_5_1033 :: []),(var_6_1034)) :: var_7_1035)) :: []),(var_8_1036),(var_9_1037),(var_10_1038),(var_11_1039),(var_12_1040),(var_13_1041)) :: [])) config (-1))),(var_14_1042 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 17))| _ -> (stepElt 17))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(HOLE~>`#freezer#Transfer1_`(K1)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#Transfer(HOLE,K1)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(`_andBool_`(isK(HOLE),isExp(K1)),`_andBool_`(#token("true","Bool"),`notBool_`(isKResult(HOLE))))) ensures #token("true","Bool") [UNIQUE_ID(3d34ba2b277708b0f07ef0ab89efd5fed4c3d45d2157a5343610a215b31279bf) heat() klabel(#Transfer) org.kframework.attributes.Location(Location(42,12,42,38)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) productionID(1329315688) strict()]|}*)
| (var_4_1043) as e40 when guard < 18 -> (let e = ((evalMap'Coln'lookup((var_0_808),e40) config (-1))) in match e with 
| [Bottom] -> (stepElt 18)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1044),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'Transfer,(var_5_1045),(var_6_1046 :: [])) :: var_7_1047)) :: []),(var_8_1048),(var_9_1049),(var_10_1050),(var_11_1051),(var_12_1052),(var_13_1053)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e40) config (-1))) in match e with 
| [Bottom] -> (stepElt 18)
| ((Map (SortStateCellMap,_,_) as var_14_1054) :: []) when ((((((true) && (true))) && (true))) && (((((true) && ((isTrue (evalisExp((var_6_1046 :: [])) config (-1)))))) && (((true) && ((not ((isTrue (evalisKResult((var_5_1045)) config (-1))))))))))) && (((compare var_4_1044 var_4_1043) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e40,(KApply8(Lbl'_LT_'state'_GT_',e40,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1045 @ KApply1(Lbl'Hash'freezer'Hash'Transfer1_,(var_6_1046 :: [])) :: var_7_1047)) :: []),(var_8_1048),(var_9_1049),(var_10_1050),(var_11_1051),(var_12_1052),(var_13_1053)) :: [])) config (-1))),(var_14_1054 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 18))| _ -> (stepElt 18))
(*{| rule `<T>`(`<states>`(``_9=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(DotVar3),_1,_2,_3,_4,_5,`<indexes>`(#indexes(`_+Int_`(C,#token("1","Int")),_88)))),DotVar1)``),_6,_7,_8) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_9),#match(`<state>`(_0,`<k>`(`#increaseIndex_OSL`(.KList)~>DotVar3),_1,_2,_3,_4,_5,`<indexes>`(#indexes(C,_88))),`Map:lookup`(_9,_0))),#match(DotVar1,`_[_<-undef]`(_9,_0))),`_andBool_`(isInt(_88),isInt(C))) ensures #token("true","Bool") [UNIQUE_ID(5d5b5ca93c74d7556f2f90904f3761f73bed9c75b0b1edcfbe087511bfb4ecc4) contentStartColumn(6) contentStartLine(76) org.kframework.attributes.Location(Location(76,6,77,63)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1055) as e41 when guard < 19 -> (let e = ((evalMap'Coln'lookup((var_0_808),e41) config (-1))) in match e with 
| [Bottom] -> (stepElt 19)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1056),(KApply1(Lbl'_LT_'k'_GT_',(KApply0(Lbl'Hash'increaseIndex_OSL) :: var_5_1057)) :: []),(var_6_1058),(var_7_1059),(var_8_1060),(var_9_1061),(var_10_1062),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,((Int _ as var_11_1063) :: []),((Int _ as var_12_1064) :: [])) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e41) config (-1))) in match e with 
| [Bottom] -> (stepElt 19)
| ((Map (SortStateCellMap,_,_) as var_13_1065) :: []) when ((((((true) && (true))) && (true))) && (((true) && (true)))) && (((compare var_4_1056 var_4_1055) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e41,(KApply8(Lbl'_LT_'state'_GT_',e41,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1057)) :: []),(var_6_1058),(var_7_1059),(var_8_1060),(var_9_1061),(var_10_1062),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,((eval_'Plus'Int_((var_11_1063 :: []),((Lazy.force int1) :: [])) config (-1))),(var_12_1064 :: [])) :: [])) :: [])) :: [])) config (-1))),(var_13_1065 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 19))| _ -> (stepElt 19))
(*{| rule `<T>`(`<states>`(``_6=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(DotVar3),`<env>`(`_[_<-_]_MAP`(Rho,X,N)),`<store>`(`_Map_`(`_|->_`(N,`#uninit_OSL-SYNTAX`(.KList)),DotVar4)),`<stack>`(`_List_`(`ListItem`(X),DotVar5)),_1,`<timer>`(`_+Int_`(TI,#token("1","Int"))),`<indexes>`(#indexes(`_+Int_`(N,#token("1","Int")),_74)))),DotVar1)``),_2,_3,_4) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_6),#match(`<state>`(_0,`<k>`(#decl(X)~>DotVar3),`<env>`(Rho),`<store>`(_5),`<stack>`(DotVar5),_1,`<timer>`(TI),`<indexes>`(#indexes(N,_74))),`Map:lookup`(_6,_0))),#match(DotVar1,`_[_<-undef]`(_6,_0))),#match(DotVar4,_5)),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(TI),isMap(Rho)),isInt(N)),isId(X)),isInt(_74))) ensures #token("true","Bool") [UNIQUE_ID(781a132fd4e961f96969c620d3e3eaec1adfcb62cbc20d38535d4caabb8704c0) contentStartColumn(6) contentStartLine(27) org.kframework.attributes.Location(Location(27,6,33,59)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1066) as e42 when guard < 20 -> (let e = ((evalMap'Coln'lookup((var_0_808),e42) config (-1))) in match e with 
| [Bottom] -> (stepElt 20)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1067),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'decl,(var_7_1068 :: [])) :: var_5_1069)) :: []),(KApply1(Lbl'_LT_'env'_GT_',((Map (SortMap,_,_) as var_6_1070) :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',(var_15_1071)) :: []),(KApply1(Lbl'_LT_'stack'_GT_',((List (SortList,_,_) as var_10_1072) :: [])) :: []),(var_11_1073),(KApply1(Lbl'_LT_'timer'_GT_',((Int _ as var_12_1074) :: [])) :: []),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,((Int _ as var_8_1075) :: []),((Int _ as var_13_1076) :: [])) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e42) config (-1))) in match e with 
| [Bottom] -> (stepElt 20)
| ((Map (SortStateCellMap,_,_) as var_14_1077) :: []) -> (let e = (var_15_1071) in match e with 
| [Bottom] -> (stepElt 20)
| ((Map (SortMap,_,_) as var_9_1078) :: []) when ((((((((true) && (true))) && (true))) && (true))) && (((((((((true) && (true))) && (true))) && ((isTrue (evalisId((var_7_1068 :: [])) config (-1)))))) && (true)))) && (((compare var_4_1067 var_4_1066) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e42,(KApply8(Lbl'_LT_'state'_GT_',e42,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1069)) :: []),(KApply1(Lbl'_LT_'env'_GT_',((eval_'LSqB'_'_LT_Hyph'_'RSqB'_MAP((var_6_1070 :: []),(var_7_1068 :: []),(var_8_1075 :: [])) config (-1)))) :: []),(KApply1(Lbl'_LT_'store'_GT_',((eval_Map_(((eval_'PipeHyph_GT_'_((var_8_1075 :: []),(const'Hash'uninit_OSL'Hyph'SYNTAX :: [])) config (-1))),(var_9_1078 :: [])) config (-1)))) :: []),(KApply1(Lbl'_LT_'stack'_GT_',((eval_List_(((evalListItem((var_7_1068 :: [])) config (-1))),(var_10_1072 :: [])) config (-1)))) :: []),(var_11_1073),(KApply1(Lbl'_LT_'timer'_GT_',((eval_'Plus'Int_((var_12_1074 :: []),((Lazy.force int1) :: [])) config (-1)))) :: []),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,((eval_'Plus'Int_((var_8_1075 :: []),((Lazy.force int1) :: [])) config (-1))),(var_13_1076 :: [])) :: [])) :: [])) :: [])) config (-1))),(var_14_1077 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 20))| _ -> (stepElt 20))| _ -> (stepElt 20))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#TransferIB(#read(#loc(F)),#loc(L))~>DotVar3),_1,`<store>`(`_Map_`(`_|->_`(F,#br(BEG,END,#immRef(L1))),DotVar4)),_2,_3,_4,_5)),DotVar1)``),_6,_7,_8) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#TransferV(#loc(F),#loc(L))~>DotVar3),_1,`<store>`(_9),_2,_3,_4,_5),`Map:lookup`(_10,_0))),#match(DotVar4,`_[_<-undef]`(_9,F))),#match(#br(BEG,END,#immRef(L1)),`Map:lookup`(_9,F))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(END),isInt(F)),isInt(L)),isInt(L1)),isInt(BEG))) ensures #token("true","Bool") [UNIQUE_ID(94336861b840d096a8efbc4d1f5998623d9d19f056d669ff7d2ba7d39e8ff3c7) contentStartColumn(6) contentStartLine(144) org.kframework.attributes.Location(Location(144,6,145,61)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1079) as e43 when guard < 21 -> (let e = ((evalMap'Coln'lookup((var_0_808),e43) config (-1))) in match e with 
| [Bottom] -> (stepElt 21)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1080),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'TransferV,(KApply1(Lbl'Hash'loc,((Int _ as var_5_1081) :: [])) :: []),(KApply1(Lbl'Hash'loc,((Int _ as var_6_1082) :: [])) :: [])) :: var_7_1083)) :: []),(var_8_1084),(KApply1(Lbl'_LT_'store'_GT_',(var_18_1085)) :: []),(var_13_1086),(var_14_1087),(var_15_1088),(var_16_1089)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_18_1085),(var_5_1081 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 21)
| ((Map (SortMap,_,_) as var_12_1090) :: []) -> (let e = ((evalMap'Coln'lookup((var_18_1085),(var_5_1081 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 21)
| (KApply3(Lbl'Hash'br,((Int _ as var_9_1091) :: []),((Int _ as var_10_1092) :: []),(KApply1(Lbl'Hash'immRef,((Int _ as var_11_1093) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e43) config (-1))) in match e with 
| [Bottom] -> (stepElt 21)
| ((Map (SortStateCellMap,_,_) as var_17_1094) :: []) when ((((((((((true) && (true))) && (true))) && (true))) && (true))) && (((((((((true) && (true))) && (true))) && (true))) && (true)))) && (((compare var_4_1080 var_4_1079) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e43,(KApply8(Lbl'_LT_'state'_GT_',e43,(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'TransferIB,(KApply1(Lbl'Hash'read,(KApply1(Lbl'Hash'loc,(var_5_1081 :: [])) :: [])) :: []),(KApply1(Lbl'Hash'loc,(var_6_1082 :: [])) :: [])) :: var_7_1083)) :: []),(var_8_1084),(KApply1(Lbl'_LT_'store'_GT_',((eval_Map_(((eval_'PipeHyph_GT_'_((var_5_1081 :: []),(KApply3(Lbl'Hash'br,(var_9_1091 :: []),(var_10_1092 :: []),(KApply1(Lbl'Hash'immRef,(var_11_1093 :: [])) :: [])) :: [])) config (-1))),(var_12_1090 :: [])) config (-1)))) :: []),(var_13_1086),(var_14_1087),(var_15_1088),(var_16_1089)) :: [])) config (-1))),(var_17_1094 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 21))| _ -> (stepElt 21))| _ -> (stepElt 21))| _ -> (stepElt 21))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#Deallocate(#rs(Ps))~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),isProps(Ps)) ensures #token("true","Bool") [UNIQUE_ID(73e3a9056a98d857f08237e3636ab8a9b6f85ab45d2a8d4cbb638ab8305dd3cd) contentStartColumn(6) contentStartLine(375) org.kframework.attributes.Location(Location(375,6,375,37)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1095) as e44 when guard < 22 -> (let e = ((evalMap'Coln'lookup((var_0_808),e44) config (-1))) in match e with 
| [Bottom] -> (stepElt 22)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1096),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'Deallocate,(KApply1(Lbl'Hash'rs,(var_13_1097 :: [])) :: [])) :: var_5_1098)) :: []),(var_6_1099),(var_7_1100),(var_8_1101),(var_9_1102),(var_10_1103),(var_11_1104)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e44) config (-1))) in match e with 
| [Bottom] -> (stepElt 22)
| ((Map (SortStateCellMap,_,_) as var_12_1105) :: []) when ((((((true) && (true))) && (true))) && ((isTrue (evalisProps((var_13_1097 :: [])) config (-1))))) && (((compare var_4_1096 var_4_1095) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e44,(KApply8(Lbl'_LT_'state'_GT_',e44,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1098)) :: []),(var_6_1099),(var_7_1100),(var_8_1101),(var_9_1102),(var_10_1103),(var_11_1104)) :: [])) config (-1))),(var_12_1105 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 22))| _ -> (stepElt 22))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#lvDref(HOLE)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(HOLE~>`#freezer#lvDref0_`(.KList)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(isExp(HOLE),`_andBool_`(#token("true","Bool"),isKResult(HOLE)))) ensures #token("true","Bool") [UNIQUE_ID(9964aafc9c528c3e0736c598f8da73ffb796d10a23226ee1594017700a99f9cc) cool() klabel(#lvDref) org.kframework.attributes.Location(Location(373,12,373,40)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) productionID(1533985074) strict()]|}*)
| (var_4_1106) as e45 when guard < 23 -> (let e = ((evalMap'Coln'lookup((var_0_808),e45) config (-1))) in match e with 
| [Bottom] -> (stepElt 23)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1107),(KApply1(Lbl'_LT_'k'_GT_',(var_5_1108 :: KApply0(Lbl'Hash'freezer'Hash'lvDref0_) :: var_6_1109)) :: []),(var_7_1110),(var_8_1111),(var_9_1112),(var_10_1113),(var_11_1114),(var_12_1115)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e45) config (-1))) in match e with 
| [Bottom] -> (stepElt 23)
| ((Map (SortStateCellMap,_,_) as var_13_1116) :: []) when ((((((true) && (true))) && (true))) && ((((isTrue (evalisExp((var_5_1108 :: [])) config (-1)))) && (((true) && ((isTrue (evalisKResult((var_5_1108 :: [])) config (-1))))))))) && (((compare var_4_1107 var_4_1106) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e45,(KApply8(Lbl'_LT_'state'_GT_',e45,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'lvDref,(var_5_1108 :: [])) :: var_6_1109)) :: []),(var_7_1110),(var_8_1111),(var_9_1112),(var_10_1113),(var_11_1114),(var_12_1115)) :: [])) config (-1))),(var_13_1116 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 23))| _ -> (stepElt 23))
(*{| rule `<T>`(`<states>`(``_6=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#loc(L1)~>DotVar3),_1,`<store>`(`_[_<-_]_MAP`(Rho,L,#br(BEG,TIMER,#immRef(L1)))),_2,`<write>`(WRITE),`<timer>`(TIMER),`<indexes>`(#indexes(C,_84)))),DotVar1)``),_3,_4,_5) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_6),#match(`<state>`(_0,`<k>`(#borrowImmCK(L,BEG,END,L1)~>DotVar3),_1,`<store>`(Rho),_2,`<write>`(WRITE),`<timer>`(TIMER),`<indexes>`(#indexes(C,_84))),`Map:lookup`(_6,_0))),#match(DotVar1,`_[_<-undef]`(_6,_0))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(TIMER),isInt(_84)),isInt(END)),isMap(Rho)),isInt(C)),isSet(WRITE)),isInt(L)),isInt(L1)),isInt(BEG)),`_andBool_`(`_==Bool__BOOL`(#borrowimmck(L,Rho,BEG,TIMER,L1),#token("false","Bool")),#writeCK(L1,BEG,TIMER,WRITE)))) ensures #token("true","Bool") [UNIQUE_ID(774bc0f3dbb74bc132de7b2b715d70c72f463e973ee8010c8c5419db24152445) contentStartColumn(6) contentStartLine(204) org.kframework.attributes.Location(Location(204,6,210,45)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (var_4_1117) as e46 when guard < 24 -> (let e = ((evalMap'Coln'lookup((var_0_808),e46) config (-1))) in match e with 
| [Bottom] -> (stepElt 24)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1118),(KApply1(Lbl'_LT_'k'_GT_',(KApply4(Lbl'Hash'borrowImmCK,((Int _ as var_9_1119) :: []),((Int _ as var_10_1120) :: []),((Int _ as var_17_1121) :: []),((Int _ as var_5_1122) :: [])) :: var_6_1123)) :: []),(var_7_1124),(KApply1(Lbl'_LT_'store'_GT_',((Map (SortMap,_,_) as var_8_1125) :: [])) :: []),(var_12_1126),(KApply1(Lbl'_LT_'write'_GT_',((Set (SortSet,_,_) as var_13_1127) :: [])) :: []),(KApply1(Lbl'_LT_'timer'_GT_',((Int _ as var_11_1128) :: [])) :: []),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,((Int _ as var_14_1129) :: []),((Int _ as var_15_1130) :: [])) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e46) config (-1))) in match e with 
| [Bottom] -> (stepElt 24)
| ((Map (SortStateCellMap,_,_) as var_16_1131) :: []) when ((((((true) && (true))) && (true))) && (((((((((((((((((((true) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && ((((isTrue (eval_'EqlsEqls'Bool__BOOL(((eval'Hash'borrowimmck((var_9_1119 :: []),(var_8_1125 :: []),(var_10_1120 :: []),(var_11_1128 :: []),(var_5_1122 :: [])) config (-1))),((Bool false) :: [])) config (-1)))) && ((isTrue (eval'Hash'writeCK((var_5_1122 :: []),(var_10_1120 :: []),(var_11_1128 :: []),(var_13_1127 :: [])) config (-1))))))))) && (((compare var_4_1118 var_4_1117) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e46,(KApply8(Lbl'_LT_'state'_GT_',e46,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'loc,(var_5_1122 :: [])) :: var_6_1123)) :: []),(var_7_1124),(KApply1(Lbl'_LT_'store'_GT_',((eval_'LSqB'_'_LT_Hyph'_'RSqB'_MAP((var_8_1125 :: []),(var_9_1119 :: []),(KApply3(Lbl'Hash'br,(var_10_1120 :: []),(var_11_1128 :: []),(KApply1(Lbl'Hash'immRef,(var_5_1122 :: [])) :: [])) :: [])) config (-1)))) :: []),(var_12_1126),(KApply1(Lbl'_LT_'write'_GT_',(var_13_1127 :: [])) :: []),(KApply1(Lbl'_LT_'timer'_GT_',(var_11_1128 :: [])) :: []),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,(var_14_1129 :: []),(var_15_1130 :: [])) :: [])) :: [])) :: [])) config (-1))),(var_16_1131 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 24))| _ -> (stepElt 24))
(*{| rule `<T>`(`<states>`(``_9=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(DotVar3),_1,`<store>`(`_Map_`(`_|->_`(L,#br(C,C,#immRef(F))),DotVar4)),_2,_3,_4,`<indexes>`(#indexes(C,_60)))),DotVar1)``),_5,_6,_7) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_9),#match(`<state>`(_0,`<k>`(#TransferIB(#loc(F),#loc(L))~>DotVar3),_1,`<store>`(_8),_2,_3,_4,`<indexes>`(#indexes(C,_60))),`Map:lookup`(_9,_0))),#match(DotVar4,`_[_<-undef]`(_8,L))),#match(_59,`Map:lookup`(_8,L))),#match(DotVar1,`_[_<-undef]`(_9,_0))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(C),isKItem(_59)),isInt(_60)),isInt(F)),isInt(L))) ensures #token("true","Bool") [UNIQUE_ID(b1ffcff9e488c340a35a6982565b2fffa44e6dbf3ccd6704fe0c26fb25f90a3b) contentStartColumn(6) contentStartLine(152) org.kframework.attributes.Location(Location(152,6,154,49)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1132) as e47 when guard < 25 -> (let e = ((evalMap'Coln'lookup((var_0_808),e47) config (-1))) in match e with 
| [Bottom] -> (stepElt 25)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1133),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'TransferIB,(KApply1(Lbl'Hash'loc,((Int _ as var_9_1134) :: [])) :: []),(KApply1(Lbl'Hash'loc,((Int _ as var_7_1135) :: [])) :: [])) :: var_5_1136)) :: []),(var_6_1137),(KApply1(Lbl'_LT_'store'_GT_',(var_16_1138)) :: []),(var_11_1139),(var_12_1140),(var_13_1141),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,((Int _ as var_8_1142) :: []),((Int _ as var_14_1143) :: [])) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_16_1138),(var_7_1135 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 25)
| ((Map (SortMap,_,_) as var_10_1144) :: []) -> (let e = ((evalMap'Coln'lookup((var_16_1138),(var_7_1135 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 25)
| (var_17_1145 :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e47) config (-1))) in match e with 
| [Bottom] -> (stepElt 25)
| ((Map (SortStateCellMap,_,_) as var_15_1146) :: []) when ((((((((((true) && (true))) && (true))) && (true))) && (true))) && (((((((((true) && (true))) && (true))) && (true))) && (true)))) && (((compare var_4_1133 var_4_1132) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e47,(KApply8(Lbl'_LT_'state'_GT_',e47,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1136)) :: []),(var_6_1137),(KApply1(Lbl'_LT_'store'_GT_',((eval_Map_(((eval_'PipeHyph_GT_'_((var_7_1135 :: []),(KApply3(Lbl'Hash'br,(var_8_1142 :: []),(var_8_1142 :: []),(KApply1(Lbl'Hash'immRef,(var_9_1134 :: [])) :: [])) :: [])) config (-1))),(var_10_1144 :: [])) config (-1)))) :: []),(var_11_1139),(var_12_1140),(var_13_1141),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,(var_8_1142 :: []),(var_14_1143 :: [])) :: [])) :: [])) :: [])) config (-1))),(var_15_1146 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 25))| _ -> (stepElt 25))| _ -> (stepElt 25))| _ -> (stepElt 25))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#Transferuninit(K0,HOLE)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(HOLE~>`#freezer#Transferuninit0_`(K0)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(`_andBool_`(isExp(HOLE),isK(K0)),`_andBool_`(#token("true","Bool"),isKResult(HOLE)))) ensures #token("true","Bool") [UNIQUE_ID(f24f15bf129541fe19096e1c2f8cf608f3c3db61efae7d1fe75d79e06f123796) cool() klabel(#Transferuninit) org.kframework.attributes.Location(Location(44,12,44,46)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) productionID(1066513687) strict(2)]|}*)
| (var_4_1147) as e48 when guard < 26 -> (let e = ((evalMap'Coln'lookup((var_0_808),e48) config (-1))) in match e with 
| [Bottom] -> (stepElt 26)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1148),(KApply1(Lbl'_LT_'k'_GT_',(var_6_1149 :: KApply1(Lbl'Hash'freezer'Hash'Transferuninit0_,(var_5_1150)) :: var_7_1151)) :: []),(var_8_1152),(var_9_1153),(var_10_1154),(var_11_1155),(var_12_1156),(var_13_1157)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e48) config (-1))) in match e with 
| [Bottom] -> (stepElt 26)
| ((Map (SortStateCellMap,_,_) as var_14_1158) :: []) when ((((((true) && (true))) && (true))) && ((((((isTrue (evalisExp((var_6_1149 :: [])) config (-1)))) && (true))) && (((true) && ((isTrue (evalisKResult((var_6_1149 :: [])) config (-1))))))))) && (((compare var_4_1148 var_4_1147) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e48,(KApply8(Lbl'_LT_'state'_GT_',e48,(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'Transferuninit,(var_5_1150),(var_6_1149 :: [])) :: var_7_1151)) :: []),(var_8_1152),(var_9_1153),(var_10_1154),(var_11_1155),(var_12_1156),(var_13_1157)) :: [])) config (-1))),(var_14_1158 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 26))| _ -> (stepElt 26))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#Read(HOLE)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(HOLE~>`#freezer#Read0_`(.KList)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(isK(HOLE),`_andBool_`(#token("true","Bool"),isKResult(HOLE)))) ensures #token("true","Bool") [UNIQUE_ID(36df34e3632848a8cb874a29eb37c134af30f69f7d949ca219829fbf286ab2ae) cool() klabel(#Read) org.kframework.attributes.Location(Location(207,12,207,40)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) productionID(189207010) strict()]|}*)
| (var_4_1159) as e49 when guard < 27 -> (let e = ((evalMap'Coln'lookup((var_0_808),e49) config (-1))) in match e with 
| [Bottom] -> (stepElt 27)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1160),(KApply1(Lbl'_LT_'k'_GT_',(var_5_1161 :: KApply0(Lbl'Hash'freezer'Hash'Read0_) :: var_6_1162)) :: []),(var_7_1163),(var_8_1164),(var_9_1165),(var_10_1166),(var_11_1167),(var_12_1168)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e49) config (-1))) in match e with 
| [Bottom] -> (stepElt 27)
| ((Map (SortStateCellMap,_,_) as var_13_1169) :: []) when ((((((true) && (true))) && (true))) && (((true) && (((true) && ((isTrue (evalisKResult((var_5_1161 :: [])) config (-1))))))))) && (((compare var_4_1159 var_4_1160) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e49,(KApply8(Lbl'_LT_'state'_GT_',e49,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'Read,(var_5_1161 :: [])) :: var_6_1162)) :: []),(var_7_1163),(var_8_1164),(var_9_1165),(var_10_1166),(var_11_1167),(var_12_1168)) :: [])) config (-1))),(var_13_1169 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 27))| _ -> (stepElt 27))
(*{| rule `<T>`(`<states>`(``_9=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(DotVar3),_1,_2,_3,_4,`<timer>`(`_+Int_`(TIMER,#token("1","Int"))),_5)),DotVar1)``),_6,_7,_8) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_9),#match(`<state>`(_0,`<k>`(`#increaseTimer_OSL`(.KList)~>DotVar3),_1,_2,_3,_4,`<timer>`(TIMER),_5),`Map:lookup`(_9,_0))),#match(DotVar1,`_[_<-undef]`(_9,_0))),isInt(TIMER)) ensures #token("true","Bool") [UNIQUE_ID(929c1a50e8eb0fb145cbfb12bfb5bb190beb76124484dad4ee28c2160552203c) contentStartColumn(6) contentStartLine(79) org.kframework.attributes.Location(Location(79,6,80,48)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1170) as e50 when guard < 28 -> (let e = ((evalMap'Coln'lookup((var_0_808),e50) config (-1))) in match e with 
| [Bottom] -> (stepElt 28)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1171),(KApply1(Lbl'_LT_'k'_GT_',(KApply0(Lbl'Hash'increaseTimer_OSL) :: var_5_1172)) :: []),(var_6_1173),(var_7_1174),(var_8_1175),(var_9_1176),(KApply1(Lbl'_LT_'timer'_GT_',((Int _ as var_10_1177) :: [])) :: []),(var_11_1178)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e50) config (-1))) in match e with 
| [Bottom] -> (stepElt 28)
| ((Map (SortStateCellMap,_,_) as var_12_1179) :: []) when ((((((true) && (true))) && (true))) && (true)) && (((compare var_4_1171 var_4_1170) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e50,(KApply8(Lbl'_LT_'state'_GT_',e50,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1172)) :: []),(var_6_1173),(var_7_1174),(var_8_1175),(var_9_1176),(KApply1(Lbl'_LT_'timer'_GT_',((eval_'Plus'Int_((var_10_1177 :: []),((Lazy.force int1) :: [])) config (-1)))) :: []),(var_11_1178)) :: [])) config (-1))),(var_12_1179 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 28))| _ -> (stepElt 28))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(`newResource(_)_OSL-SYNTAX`(Ps)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#lv(`newResource(_)_OSL-SYNTAX`(Ps))~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),isProps(Ps)) ensures #token("true","Bool") [UNIQUE_ID(49c921bc79f7df504d996bd00a12ba077ca601a2602294f622166c698d8675b0) contentStartColumn(6) contentStartLine(40) org.kframework.attributes.Location(Location(40,6,40,51)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1180) as e51 when guard < 29 -> (let e = ((evalMap'Coln'lookup((var_0_808),e51) config (-1))) in match e with 
| [Bottom] -> (stepElt 29)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1181),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'lv,(KApply1(LblnewResource'LPar'_'RPar'_OSL'Hyph'SYNTAX,(var_5_1182 :: [])) :: [])) :: var_6_1183)) :: []),(var_7_1184),(var_8_1185),(var_9_1186),(var_10_1187),(var_11_1188),(var_12_1189)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e51) config (-1))) in match e with 
| [Bottom] -> (stepElt 29)
| ((Map (SortStateCellMap,_,_) as var_13_1190) :: []) when ((((((true) && (true))) && (true))) && ((isTrue (evalisProps((var_5_1182 :: [])) config (-1))))) && (((compare var_4_1180 var_4_1181) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e51,(KApply8(Lbl'_LT_'state'_GT_',e51,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(LblnewResource'LPar'_'RPar'_OSL'Hyph'SYNTAX,(var_5_1182 :: [])) :: var_6_1183)) :: []),(var_7_1184),(var_8_1185),(var_9_1186),(var_10_1187),(var_11_1188),(var_12_1189)) :: [])) config (-1))),(var_13_1190 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 29))| _ -> (stepElt 29))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`.StateCellMap`(.KList),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(`#removeState_CONTROL`(.KList)),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))) ensures #token("true","Bool") [UNIQUE_ID(7290f055c528648030b41b64f07663f7ce9a92f59c0b758de2382df185599d88) contentStartColumn(8) contentStartLine(108) org.kframework.attributes.Location(Location(108,8,111,25)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_5_1191) as e52 when guard < 30 -> (let e = ((evalMap'Coln'lookup((var_0_808),e52) config (-1))) in match e with 
| [Bottom] -> (stepElt 30)
| (KApply8(Lbl'_LT_'state'_GT_',(var_5_1192),(KApply1(Lbl'_LT_'k'_GT_',(KApply0(Lbl'Hash'removeState_CONTROL) :: [])) :: []),(var_6_1193),(var_7_1194),(var_8_1195),(var_9_1196),(var_10_1197),(var_11_1198)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e52) config (-1))) in match e with 
| [Bottom] -> (stepElt 30)
| ((Map (SortStateCellMap,_,_) as var_4_1199) :: []) when ((((true) && (true))) && (true)) && (((compare var_5_1191 var_5_1192) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((Lazy.force const'Stop'StateCellMap)),(var_4_1199 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 30))| _ -> (stepElt 30))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(`.List{"___OSL-SYNTAX"}`(.KList)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))) ensures #token("true","Bool") [UNIQUE_ID(344d6052a56fe9b1f8c15cf6dd99963a026afce1d35a3e29a0e6734bd65b8261) contentStartColumn(6) contentStartLine(20) org.kframework.attributes.Location(Location(20,6,20,17)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1200) as e53 when guard < 31 -> (let e = ((evalMap'Coln'lookup((var_0_808),e53) config (-1))) in match e with 
| [Bottom] -> (stepElt 31)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1201),(KApply1(Lbl'_LT_'k'_GT_',(KApply0(Lbl'Stop'List'LBraQuot'___OSL'Hyph'SYNTAX'QuotRBra') :: var_5_1202)) :: []),(var_6_1203),(var_7_1204),(var_8_1205),(var_9_1206),(var_10_1207),(var_11_1208)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e53) config (-1))) in match e with 
| [Bottom] -> (stepElt 31)
| ((Map (SortStateCellMap,_,_) as var_12_1209) :: []) when ((((true) && (true))) && (true)) && (((compare var_4_1201 var_4_1200) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e53,(KApply8(Lbl'_LT_'state'_GT_',e53,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1202)) :: []),(var_6_1203),(var_7_1204),(var_8_1205),(var_9_1206),(var_10_1207),(var_11_1208)) :: [])) config (-1))),(var_12_1209 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 31))| _ -> (stepElt 31))
(*{| rule `<T>`(`<states>`(``_8=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(Ss~>`#blockend_BLOCK`(.KList)~>DotVar3),`<env>`(ENV),_1,`<stack>`(`_List_`(`ListItem`(ENV),DotVar4)),_2,_3,_4)),DotVar1)``),_5,_6,_7) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_8),#match(`<state>`(_0,`<k>`(#block(Ss)~>DotVar3),`<env>`(ENV),_1,`<stack>`(DotVar4),_2,_3,_4),`Map:lookup`(_8,_0))),#match(DotVar1,`_[_<-undef]`(_8,_0))),`_andBool_`(isMap(ENV),isStmts(Ss))) ensures #token("true","Bool") [UNIQUE_ID(808ffa833cb26a5dfa6a0b2e9d7282c710af0d1d2442297dfd1f7697e127b9ba) contentStartColumn(6) contentStartLine(13) org.kframework.attributes.Location(Location(13,6,15,49)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/block.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1210) as e54 when guard < 32 -> (let e = ((evalMap'Coln'lookup((var_0_808),e54) config (-1))) in match e with 
| [Bottom] -> (stepElt 32)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1211),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'block,(var_5_1212 :: [])) :: var_6_1213)) :: []),(KApply1(Lbl'_LT_'env'_GT_',((Map (SortMap,_,_) as var_7_1214) :: [])) :: []),(var_8_1215),(KApply1(Lbl'_LT_'stack'_GT_',((List (SortList,_,_) as var_9_1216) :: [])) :: []),(var_10_1217),(var_11_1218),(var_12_1219)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e54) config (-1))) in match e with 
| [Bottom] -> (stepElt 32)
| ((Map (SortStateCellMap,_,_) as var_13_1220) :: []) when ((((((true) && (true))) && (true))) && (((true) && ((isTrue (evalisStmts((var_5_1212 :: [])) config (-1))))))) && (((compare var_4_1210 var_4_1211) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e54,(KApply8(Lbl'_LT_'state'_GT_',e54,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1212 :: const'Hash'blockend_BLOCK :: var_6_1213)) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_7_1214 :: [])) :: []),(var_8_1215),(KApply1(Lbl'_LT_'stack'_GT_',((eval_List_(((evalListItem((var_7_1214 :: [])) config (-1))),(var_9_1216 :: [])) config (-1)))) :: []),(var_10_1217),(var_11_1218),(var_12_1219)) :: [])) config (-1))),(var_13_1220 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 32))| _ -> (stepElt 32))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#expStmt(HOLE)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(HOLE~>`#freezer#expStmt0_`(.KList)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(isExp(HOLE),`_andBool_`(#token("true","Bool"),isKResult(HOLE)))) ensures #token("true","Bool") [UNIQUE_ID(a8f1fc103e86f774e188b8c29afb4d411bcdfe291538cd0fa9b073f1b4156162) cool() klabel(#expStmt) org.kframework.attributes.Location(Location(50,12,50,73)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/osl-syntax.k)) productionID(2108297149) strict()]|}*)
| (var_4_1221) as e55 when guard < 33 -> (let e = ((evalMap'Coln'lookup((var_0_808),e55) config (-1))) in match e with 
| [Bottom] -> (stepElt 33)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1222),(KApply1(Lbl'_LT_'k'_GT_',(var_5_1223 :: KApply0(Lbl'Hash'freezer'Hash'expStmt0_) :: var_6_1224)) :: []),(var_7_1225),(var_8_1226),(var_9_1227),(var_10_1228),(var_11_1229),(var_12_1230)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e55) config (-1))) in match e with 
| [Bottom] -> (stepElt 33)
| ((Map (SortStateCellMap,_,_) as var_13_1231) :: []) when ((((((true) && (true))) && (true))) && ((((isTrue (evalisExp((var_5_1223 :: [])) config (-1)))) && (((true) && ((isTrue (evalisKResult((var_5_1223 :: [])) config (-1))))))))) && (((compare var_4_1221 var_4_1222) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e55,(KApply8(Lbl'_LT_'state'_GT_',e55,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'expStmt,(var_5_1223 :: [])) :: var_6_1224)) :: []),(var_7_1225),(var_8_1226),(var_9_1227),(var_10_1228),(var_11_1229),(var_12_1230)) :: [])) config (-1))),(var_13_1231 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 33))| _ -> (stepElt 33))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(val(HOLE)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(HOLE~>`#freezerval0_`(.KList)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(isExp(HOLE),`_andBool_`(#token("true","Bool"),isKResult(HOLE)))) ensures #token("true","Bool") [UNIQUE_ID(faac9720d8b496dd10b7c6563651e087c02f26e364b70825934fb2f8201b0701) cool() klabel(val) org.kframework.attributes.Location(Location(51,12,51,56)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/osl-syntax.k)) productionID(1112737073) strict()]|}*)
| (var_4_1232) as e56 when guard < 34 -> (let e = ((evalMap'Coln'lookup((var_0_808),e56) config (-1))) in match e with 
| [Bottom] -> (stepElt 34)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1233),(KApply1(Lbl'_LT_'k'_GT_',(var_5_1234 :: KApply0(Lbl'Hash'freezerval0_) :: var_6_1235)) :: []),(var_7_1236),(var_8_1237),(var_9_1238),(var_10_1239),(var_11_1240),(var_12_1241)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e56) config (-1))) in match e with 
| [Bottom] -> (stepElt 34)
| ((Map (SortStateCellMap,_,_) as var_13_1242) :: []) when ((((((true) && (true))) && (true))) && ((((isTrue (evalisExp((var_5_1234 :: [])) config (-1)))) && (((true) && ((isTrue (evalisKResult((var_5_1234 :: [])) config (-1))))))))) && (((compare var_4_1232 var_4_1233) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e56,(KApply8(Lbl'_LT_'state'_GT_',e56,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lblval,(var_5_1234 :: [])) :: var_6_1235)) :: []),(var_7_1236),(var_8_1237),(var_9_1238),(var_10_1239),(var_11_1240),(var_12_1241)) :: [])) config (-1))),(var_13_1242 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 34))| _ -> (stepElt 34))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#TransferMB(#read(#loc(F)),#loc(L))~>#uninitialize(#loc(F))~>DotVar3),_1,`<store>`(`_Map_`(`_|->_`(F,#br(BEG,END,#mutRef(L1))),DotVar4)),_2,_3,_4,_5)),DotVar1)``),_6,_7,_8) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#TransferV(#loc(F),#loc(L))~>DotVar3),_1,`<store>`(_9),_2,_3,_4,_5),`Map:lookup`(_10,_0))),#match(#br(BEG,END,#mutRef(L1)),`Map:lookup`(_9,F))),#match(DotVar4,`_[_<-undef]`(_9,F))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(END),isInt(F)),isInt(L)),isInt(L1)),isInt(BEG))) ensures #token("true","Bool") [UNIQUE_ID(60f8feb45e6ffc3325af23dcc421e7d8769da811013a7ff665c1222bc8a6564c) contentStartColumn(6) contentStartLine(147) org.kframework.attributes.Location(Location(147,6,150,61)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1243) as e57 when guard < 35 -> (let e = ((evalMap'Coln'lookup((var_0_808),e57) config (-1))) in match e with 
| [Bottom] -> (stepElt 35)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1244),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'TransferV,(KApply1(Lbl'Hash'loc,((Int _ as var_5_1245) :: [])) :: []),(KApply1(Lbl'Hash'loc,((Int _ as var_6_1246) :: [])) :: [])) :: var_7_1247)) :: []),(var_8_1248),(KApply1(Lbl'_LT_'store'_GT_',(var_18_1249)) :: []),(var_13_1250),(var_14_1251),(var_15_1252),(var_16_1253)) :: []) -> (let e = ((evalMap'Coln'lookup((var_18_1249),(var_5_1245 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 35)
| (KApply3(Lbl'Hash'br,((Int _ as var_9_1254) :: []),((Int _ as var_10_1255) :: []),(KApply1(Lbl'Hash'mutRef,((Int _ as var_11_1256) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_18_1249),(var_5_1245 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 35)
| ((Map (SortMap,_,_) as var_12_1257) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e57) config (-1))) in match e with 
| [Bottom] -> (stepElt 35)
| ((Map (SortStateCellMap,_,_) as var_17_1258) :: []) when ((((((((((true) && (true))) && (true))) && (true))) && (true))) && (((((((((true) && (true))) && (true))) && (true))) && (true)))) && (((compare var_4_1243 var_4_1244) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e57,(KApply8(Lbl'_LT_'state'_GT_',e57,(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'TransferMB,(KApply1(Lbl'Hash'read,(KApply1(Lbl'Hash'loc,(var_5_1245 :: [])) :: [])) :: []),(KApply1(Lbl'Hash'loc,(var_6_1246 :: [])) :: [])) :: KApply1(Lbl'Hash'uninitialize,(KApply1(Lbl'Hash'loc,(var_5_1245 :: [])) :: [])) :: var_7_1247)) :: []),(var_8_1248),(KApply1(Lbl'_LT_'store'_GT_',((eval_Map_(((eval_'PipeHyph_GT_'_((var_5_1245 :: []),(KApply3(Lbl'Hash'br,(var_9_1254 :: []),(var_10_1255 :: []),(KApply1(Lbl'Hash'mutRef,(var_11_1256 :: [])) :: [])) :: [])) config (-1))),(var_12_1257 :: [])) config (-1)))) :: []),(var_13_1250),(var_14_1251),(var_15_1252),(var_16_1253)) :: [])) config (-1))),(var_17_1258 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 35))| _ -> (stepElt 35))| _ -> (stepElt 35))| _ -> (stepElt 35))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#rs(Ps)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(`newResource(_)_OSL-SYNTAX`(Ps)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),isProps(Ps)) ensures #token("true","Bool") [UNIQUE_ID(8e50f140a5c4a28497b310a39fef8f99f631d432e37429b7c8407be34e4605ec) contentStartColumn(6) contentStartLine(17) org.kframework.attributes.Location(Location(17,6,17,51)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1259) as e58 when guard < 36 -> (let e = ((evalMap'Coln'lookup((var_0_808),e58) config (-1))) in match e with 
| [Bottom] -> (stepElt 36)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1260),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(LblnewResource'LPar'_'RPar'_OSL'Hyph'SYNTAX,(var_5_1261 :: [])) :: var_6_1262)) :: []),(var_7_1263),(var_8_1264),(var_9_1265),(var_10_1266),(var_11_1267),(var_12_1268)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e58) config (-1))) in match e with 
| [Bottom] -> (stepElt 36)
| ((Map (SortStateCellMap,_,_) as var_13_1269) :: []) when ((((((true) && (true))) && (true))) && ((isTrue (evalisProps((var_5_1261 :: [])) config (-1))))) && (((compare var_4_1260 var_4_1259) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e58,(KApply8(Lbl'_LT_'state'_GT_',e58,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'rs,(var_5_1261 :: [])) :: var_6_1262)) :: []),(var_7_1263),(var_8_1264),(var_9_1265),(var_10_1266),(var_11_1267),(var_12_1268)) :: [])) config (-1))),(var_13_1269 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 36))| _ -> (stepElt 36))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(V~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(val(V)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),isValue(V)) ensures #token("true","Bool") [UNIQUE_ID(d684bddc4a31306f52c63abb8f13971928a219a90e50c4fd84c025316017911f) contentStartColumn(6) contentStartLine(364) org.kframework.attributes.Location(Location(364,6,364,23)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1270) as e59 when guard < 37 -> (let e = ((evalMap'Coln'lookup((var_0_808),e59) config (-1))) in match e with 
| [Bottom] -> (stepElt 37)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1271),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lblval,(var_5_1272 :: [])) :: var_6_1273)) :: []),(var_7_1274),(var_8_1275),(var_9_1276),(var_10_1277),(var_11_1278),(var_12_1279)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e59) config (-1))) in match e with 
| [Bottom] -> (stepElt 37)
| ((Map (SortStateCellMap,_,_) as var_13_1280) :: []) when ((((((true) && (true))) && (true))) && ((isTrue (evalisValue((var_5_1272 :: [])) config (-1))))) && (((compare var_4_1271 var_4_1270) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e59,(KApply8(Lbl'_LT_'state'_GT_',e59,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1272 :: var_6_1273)) :: []),(var_7_1274),(var_8_1275),(var_9_1276),(var_10_1277),(var_11_1278),(var_12_1279)) :: [])) config (-1))),(var_13_1280 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 37))| _ -> (stepElt 37))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#loc(L)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#lv(#loc(L))~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),isInt(L)) ensures #token("true","Bool") [UNIQUE_ID(801964a9b766aa631b560eb7ece73aeed07d28c7704592c1df7a28d4dbb5076c) contentStartColumn(6) contentStartLine(236) org.kframework.attributes.Location(Location(236,6,236,33)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1281) as e60 when guard < 38 -> (let e = ((evalMap'Coln'lookup((var_0_808),e60) config (-1))) in match e with 
| [Bottom] -> (stepElt 38)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1282),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'lv,(KApply1(Lbl'Hash'loc,((Int _ as var_5_1283) :: [])) :: [])) :: var_6_1284)) :: []),(var_7_1285),(var_8_1286),(var_9_1287),(var_10_1288),(var_11_1289),(var_12_1290)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e60) config (-1))) in match e with 
| [Bottom] -> (stepElt 38)
| ((Map (SortStateCellMap,_,_) as var_13_1291) :: []) when ((((((true) && (true))) && (true))) && (true)) && (((compare var_4_1282 var_4_1281) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e60,(KApply8(Lbl'_LT_'state'_GT_',e60,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'loc,(var_5_1283 :: [])) :: var_6_1284)) :: []),(var_7_1285),(var_8_1286),(var_9_1287),(var_10_1288),(var_11_1289),(var_12_1290)) :: [])) config (-1))),(var_13_1291 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 38))| _ -> (stepElt 38))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#loc(I)~>DotVar3),`<env>`(`_Map_`(`_|->_`(X,I),DotVar4)),_1,_2,_3,_4,_5)),DotVar1)``),_6,_7,_8) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#lv(X)~>DotVar3),`<env>`(_9),_1,_2,_3,_4,_5),`Map:lookup`(_10,_0))),#match(I,`Map:lookup`(_9,X))),#match(DotVar4,`_[_<-undef]`(_9,X))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(isInt(I),isId(X))) ensures #token("true","Bool") [UNIQUE_ID(770d08e5054a5867192fe90d20604816a388232fea4041ee60ea87de44ee4c70) contentStartColumn(6) contentStartLine(230) org.kframework.attributes.Location(Location(230,6,231,39)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1292) as e61 when guard < 39 -> (let e = ((evalMap'Coln'lookup((var_0_808),e61) config (-1))) in match e with 
| [Bottom] -> (stepElt 39)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1293),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'lv,(var_7_1294 :: [])) :: var_6_1295)) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_15_1296)) :: []),(var_9_1297),(var_10_1298),(var_11_1299),(var_12_1300),(var_13_1301)) :: []) -> (let e = ((evalMap'Coln'lookup((var_15_1296),(var_7_1294 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 39)
| ((Int _ as var_5_1302) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_15_1296),(var_7_1294 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 39)
| ((Map (SortMap,_,_) as var_8_1303) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e61) config (-1))) in match e with 
| [Bottom] -> (stepElt 39)
| ((Map (SortStateCellMap,_,_) as var_14_1304) :: []) when ((((((((((true) && (true))) && (true))) && (true))) && (true))) && (((true) && ((isTrue (evalisId((var_7_1294 :: [])) config (-1))))))) && (((compare var_4_1293 var_4_1292) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e61,(KApply8(Lbl'_LT_'state'_GT_',e61,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'loc,(var_5_1302 :: [])) :: var_6_1295)) :: []),(KApply1(Lbl'_LT_'env'_GT_',((eval_Map_(((eval_'PipeHyph_GT_'_((var_7_1294 :: []),(var_5_1302 :: [])) config (-1))),(var_8_1303 :: [])) config (-1)))) :: []),(var_9_1297),(var_10_1298),(var_11_1299),(var_12_1300),(var_13_1301)) :: [])) config (-1))),(var_14_1304 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 39))| _ -> (stepElt 39))| _ -> (stepElt 39))| _ -> (stepElt 39))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(HOLE~>`#freezerval0_`(.KList)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(val(HOLE)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(isExp(HOLE),`_andBool_`(#token("true","Bool"),`notBool_`(isKResult(HOLE))))) ensures #token("true","Bool") [UNIQUE_ID(7fb72add0bfa65f44b945087907a6bc503589f93d093dacff150b549766b011f) heat() klabel(val) org.kframework.attributes.Location(Location(51,12,51,56)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/osl-syntax.k)) productionID(1112737073) strict()]|}*)
| (var_4_1305) as e62 when guard < 40 -> (let e = ((evalMap'Coln'lookup((var_0_808),e62) config (-1))) in match e with 
| [Bottom] -> (stepElt 40)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1306),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lblval,(var_5_1307 :: [])) :: var_6_1308)) :: []),(var_7_1309),(var_8_1310),(var_9_1311),(var_10_1312),(var_11_1313),(var_12_1314)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e62) config (-1))) in match e with 
| [Bottom] -> (stepElt 40)
| ((Map (SortStateCellMap,_,_) as var_13_1315) :: []) when ((((((true) && (true))) && (true))) && ((((isTrue (evalisExp((var_5_1307 :: [])) config (-1)))) && (((true) && ((not ((isTrue (evalisKResult((var_5_1307 :: [])) config (-1))))))))))) && (((compare var_4_1306 var_4_1305) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e62,(KApply8(Lbl'_LT_'state'_GT_',e62,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1307 :: const'Hash'freezerval0_ :: var_6_1308)) :: []),(var_7_1309),(var_8_1310),(var_9_1311),(var_10_1312),(var_11_1313),(var_12_1314)) :: [])) config (-1))),(var_13_1315 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 40))| _ -> (stepElt 40))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#TransferMB(HOLE,K1)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(HOLE~>`#freezer#TransferMB1_`(K1)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(`_andBool_`(isK(HOLE),isK(K1)),`_andBool_`(#token("true","Bool"),isKResult(HOLE)))) ensures #token("true","Bool") [UNIQUE_ID(f569cc11096e1a41a772e200c458db0be31c73282d8ad8671170d92595f0afce) cool() klabel(#TransferMB) org.kframework.attributes.Location(Location(158,12,158,51)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) productionID(1449605932) strict(1)]|}*)
| (var_4_1316) as e63 when guard < 41 -> (let e = ((evalMap'Coln'lookup((var_0_808),e63) config (-1))) in match e with 
| [Bottom] -> (stepElt 41)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1317),(KApply1(Lbl'_LT_'k'_GT_',(var_5_1318 :: KApply1(Lbl'Hash'freezer'Hash'TransferMB1_,(var_6_1319)) :: var_7_1320)) :: []),(var_8_1321),(var_9_1322),(var_10_1323),(var_11_1324),(var_12_1325),(var_13_1326)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e63) config (-1))) in match e with 
| [Bottom] -> (stepElt 41)
| ((Map (SortStateCellMap,_,_) as var_14_1327) :: []) when ((((((true) && (true))) && (true))) && (((((true) && (true))) && (((true) && ((isTrue (evalisKResult((var_5_1318 :: [])) config (-1))))))))) && (((compare var_4_1317 var_4_1316) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e63,(KApply8(Lbl'_LT_'state'_GT_',e63,(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'TransferMB,(var_5_1318 :: []),(var_6_1319)) :: var_7_1320)) :: []),(var_8_1321),(var_9_1322),(var_10_1323),(var_11_1324),(var_12_1325),(var_13_1326)) :: [])) config (-1))),(var_14_1327 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 41))| _ -> (stepElt 41))
(*{| rule `<T>`(`<states>`(``_8=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#Transferuninit(`#uninit_OSL-SYNTAX`(.KList),#lv(TX))~>`#increaseIndex_OSL`(.KList)~>`#increaseTimer_OSL`(.KList)~>DotVar3),`<env>`(ENV),_1,_2,`<write>`(`_Set_`(`SetItem`(#writev(#wv(TX,ENV),TR)),DotVar4)),`<timer>`(TR),_3)),DotVar1)``),_4,_5,_6) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_8),#match(`<state>`(_0,`<k>`(`transfer__;_OSL-SYNTAX`(`#uninit_OSL-SYNTAX`(.KList),TX)~>DotVar3),`<env>`(ENV),_1,_2,`<write>`(_7),`<timer>`(TR),_3),`Map:lookup`(_8,_0))),#match(DotVar1,`_[_<-undef]`(_8,_0))),#match(DotVar4,_7)),`_andBool_`(`_andBool_`(isMap(ENV),isExp(TX)),isInt(TR))) ensures #token("true","Bool") [UNIQUE_ID(a336f116919c1d481e47ada9fc303ec7f20f3006f8bac15059396482f7d26c32) contentStartColumn(6) contentStartLine(51) org.kframework.attributes.Location(Location(51,6,55,68)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1328) as e64 when guard < 42 -> (let e = ((evalMap'Coln'lookup((var_0_808),e64) config (-1))) in match e with 
| [Bottom] -> (stepElt 42)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1329),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbltransfer__'SCln'_OSL'Hyph'SYNTAX,(KApply0(Lbl'Hash'uninit_OSL'Hyph'SYNTAX) :: []),(var_5_1330 :: [])) :: var_6_1331)) :: []),(KApply1(Lbl'_LT_'env'_GT_',((Map (SortMap,_,_) as var_7_1332) :: [])) :: []),(var_8_1333),(var_9_1334),(KApply1(Lbl'_LT_'write'_GT_',(var_14_1335)) :: []),(KApply1(Lbl'_LT_'timer'_GT_',((Int _ as var_10_1336) :: [])) :: []),(var_12_1337)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e64) config (-1))) in match e with 
| [Bottom] -> (stepElt 42)
| ((Map (SortStateCellMap,_,_) as var_13_1338) :: []) -> (let e = (var_14_1335) in match e with 
| [Bottom] -> (stepElt 42)
| ((Set (SortSet,_,_) as var_11_1339) :: []) when ((((((((true) && (true))) && (true))) && (true))) && (((((true) && ((isTrue (evalisExp((var_5_1330 :: [])) config (-1)))))) && (true)))) && (((compare var_4_1328 var_4_1329) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e64,(KApply8(Lbl'_LT_'state'_GT_',e64,(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'Transferuninit,(const'Hash'uninit_OSL'Hyph'SYNTAX :: []),(KApply1(Lbl'Hash'lv,(var_5_1330 :: [])) :: [])) :: const'Hash'increaseIndex_OSL :: const'Hash'increaseTimer_OSL :: var_6_1331)) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_7_1332 :: [])) :: []),(var_8_1333),(var_9_1334),(KApply1(Lbl'_LT_'write'_GT_',((eval_Set_(((evalSetItem((KApply2(Lbl'Hash'writev,((eval'Hash'wv((var_5_1330 :: []),(var_7_1332 :: [])) config (-1))),(var_10_1336 :: [])) :: [])) config (-1))),(var_11_1339 :: [])) config (-1)))) :: []),(KApply1(Lbl'_LT_'timer'_GT_',(var_10_1336 :: [])) :: []),(var_12_1337)) :: [])) config (-1))),(var_13_1338 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 42))| _ -> (stepElt 42))| _ -> (stepElt 42))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#Transfer(HOLE,K1)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(HOLE~>`#freezer#Transfer1_`(K1)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(`_andBool_`(isK(HOLE),isExp(K1)),`_andBool_`(#token("true","Bool"),isKResult(HOLE)))) ensures #token("true","Bool") [UNIQUE_ID(31a91b01ef5b0d20c60373d38a77e91b20de80f3c0a0a78af5a106bacabe2548) cool() klabel(#Transfer) org.kframework.attributes.Location(Location(42,12,42,38)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) productionID(1329315688) strict()]|}*)
| (var_4_1340) as e65 when guard < 43 -> (let e = ((evalMap'Coln'lookup((var_0_808),e65) config (-1))) in match e with 
| [Bottom] -> (stepElt 43)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1341),(KApply1(Lbl'_LT_'k'_GT_',(var_5_1342 :: KApply1(Lbl'Hash'freezer'Hash'Transfer1_,(var_6_1343 :: [])) :: var_7_1344)) :: []),(var_8_1345),(var_9_1346),(var_10_1347),(var_11_1348),(var_12_1349),(var_13_1350)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e65) config (-1))) in match e with 
| [Bottom] -> (stepElt 43)
| ((Map (SortStateCellMap,_,_) as var_14_1351) :: []) when ((((((true) && (true))) && (true))) && (((((true) && ((isTrue (evalisExp((var_6_1343 :: [])) config (-1)))))) && (((true) && ((isTrue (evalisKResult((var_5_1342 :: [])) config (-1))))))))) && (((compare var_4_1341 var_4_1340) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e65,(KApply8(Lbl'_LT_'state'_GT_',e65,(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'Transfer,(var_5_1342 :: []),(var_6_1343 :: [])) :: var_7_1344)) :: []),(var_8_1345),(var_9_1346),(var_10_1347),(var_11_1348),(var_12_1349),(var_13_1350)) :: [])) config (-1))),(var_14_1351 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 43))| _ -> (stepElt 43))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#loopSep(`_+Int_`(N,#token("1","Int")))~>Rest),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#loopSep(N)~>Rest),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(isInt(N),isK(Rest))) ensures #token("true","Bool") [UNIQUE_ID(95155f8e1d3e57b6352e0a6ff1e1ae07491e461d5e5a801b399f665f55b3f61d) contentStartColumn(6) contentStartLine(80) org.kframework.attributes.Location(Location(80,6,80,71)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1352) as e66 when guard < 44 -> (let e = ((evalMap'Coln'lookup((var_0_808),e66) config (-1))) in match e with 
| [Bottom] -> (stepElt 44)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1353),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'loopSep,((Int _ as var_5_1354) :: [])) :: var_6_1355)) :: []),(var_7_1356),(var_8_1357),(var_9_1358),(var_10_1359),(var_11_1360),(var_12_1361)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e66) config (-1))) in match e with 
| [Bottom] -> (stepElt 44)
| ((Map (SortStateCellMap,_,_) as var_13_1362) :: []) when ((((((true) && (true))) && (true))) && (((true) && (true)))) && (((compare var_4_1353 var_4_1352) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e66,(KApply8(Lbl'_LT_'state'_GT_',e66,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'loopSep,((eval_'Plus'Int_((var_5_1354 :: []),((Lazy.force int1) :: [])) config (-1)))) :: var_6_1355)) :: []),(var_7_1356),(var_8_1357),(var_9_1358),(var_10_1359),(var_11_1360),(var_12_1361)) :: [])) config (-1))),(var_13_1362 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 44))| _ -> (stepElt 44))
(*{| rule `<T>`(`<states>`(``_8=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(DotVar3),`<env>`(ENV),`<store>`(`_Map_`(`_|->_`(L,`#uninit_OSL-SYNTAX`(.KList)),DotVar4)),_1,`<write>`(`_Set_`(`SetItem`(#writev(L,TR)),DotVar5)),`<timer>`(TR),_2)),DotVar1)``),_3,_4,_5) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_8),#match(`<state>`(_0,`<k>`(#Deallocate(#loc(L))~>DotVar3),`<env>`(ENV),`<store>`(_6),_1,`<write>`(_7),`<timer>`(TR),_2),`Map:lookup`(_8,_0))),#match(DotVar4,`_[_<-undef]`(_6,L))),#match(DotVar5,_7)),#match(DotVar1,`_[_<-undef]`(_8,_0))),#match(V,`Map:lookup`(_6,L))),`_andBool_`(`_andBool_`(`_andBool_`(isMap(ENV),isValue(V)),isInt(L)),isInt(TR))) ensures #token("true","Bool") [UNIQUE_ID(49fbc07019cc7cf49afc8ca69e2c809a44fdd7aed138b273ed842831ece71110) contentStartColumn(6) contentStartLine(438) org.kframework.attributes.Location(Location(438,6,442,58)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1363) as e67 when guard < 45 -> (let e = ((evalMap'Coln'lookup((var_0_808),e67) config (-1))) in match e with 
| [Bottom] -> (stepElt 45)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1364),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'Deallocate,(KApply1(Lbl'Hash'loc,((Int _ as var_7_1365) :: [])) :: [])) :: var_5_1366)) :: []),(KApply1(Lbl'_LT_'env'_GT_',((Map (SortMap,_,_) as var_6_1367) :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',(var_14_1368)) :: []),(var_9_1369),(KApply1(Lbl'_LT_'write'_GT_',(var_15_1370)) :: []),(KApply1(Lbl'_LT_'timer'_GT_',((Int _ as var_10_1371) :: [])) :: []),(var_12_1372)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_14_1368),(var_7_1365 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 45)
| ((Map (SortMap,_,_) as var_8_1373) :: []) -> (let e = (var_15_1370) in match e with 
| [Bottom] -> (stepElt 45)
| ((Set (SortSet,_,_) as var_11_1374) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e67) config (-1))) in match e with 
| [Bottom] -> (stepElt 45)
| ((Map (SortStateCellMap,_,_) as var_13_1375) :: []) -> (let e = ((evalMap'Coln'lookup((var_14_1368),(var_7_1365 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 45)
| (var_16_1376 :: []) when ((((((((((((true) && (true))) && (true))) && (true))) && (true))) && (true))) && (((((((true) && ((isTrue (evalisValue((var_16_1376 :: [])) config (-1)))))) && (true))) && (true)))) && (((compare var_4_1364 var_4_1363) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e67,(KApply8(Lbl'_LT_'state'_GT_',e67,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1366)) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_6_1367 :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',((eval_Map_(((eval_'PipeHyph_GT_'_((var_7_1365 :: []),(const'Hash'uninit_OSL'Hyph'SYNTAX :: [])) config (-1))),(var_8_1373 :: [])) config (-1)))) :: []),(var_9_1369),(KApply1(Lbl'_LT_'write'_GT_',((eval_Set_(((evalSetItem((KApply2(Lbl'Hash'writev,(var_7_1365 :: []),(var_10_1371 :: [])) :: [])) config (-1))),(var_11_1374 :: [])) config (-1)))) :: []),(KApply1(Lbl'_LT_'timer'_GT_',(var_10_1371 :: [])) :: []),(var_12_1372)) :: [])) config (-1))),(var_13_1375 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 45))| _ -> (stepElt 45))| _ -> (stepElt 45))| _ -> (stepElt 45))| _ -> (stepElt 45))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(`#void_OSL-SYNTAX`(.KList)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(V~>`#void_OSL-SYNTAX`(.KList)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),isValue(V)) ensures #token("true","Bool") [UNIQUE_ID(a317b06f426194f02e09bf4d67705fbcee304747025008ceae9e1e83e6b04fd4) contentStartColumn(6) contentStartLine(30) org.kframework.attributes.Location(Location(30,6,30,31)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/call.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1377) as e68 when guard < 46 -> (let e = ((evalMap'Coln'lookup((var_0_808),e68) config (-1))) in match e with 
| [Bottom] -> (stepElt 46)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1378),(KApply1(Lbl'_LT_'k'_GT_',(var_13_1379 :: KApply0(Lbl'Hash'void_OSL'Hyph'SYNTAX) :: var_5_1380)) :: []),(var_6_1381),(var_7_1382),(var_8_1383),(var_9_1384),(var_10_1385),(var_11_1386)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e68) config (-1))) in match e with 
| [Bottom] -> (stepElt 46)
| ((Map (SortStateCellMap,_,_) as var_12_1387) :: []) when ((((((true) && (true))) && (true))) && ((isTrue (evalisValue((var_13_1379 :: [])) config (-1))))) && (((compare var_4_1378 var_4_1377) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e68,(KApply8(Lbl'_LT_'state'_GT_',e68,(KApply1(Lbl'_LT_'k'_GT_',(const'Hash'void_OSL'Hyph'SYNTAX :: var_5_1380)) :: []),(var_6_1381),(var_7_1382),(var_8_1383),(var_9_1384),(var_10_1385),(var_11_1386)) :: [])) config (-1))),(var_12_1387 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 46))| _ -> (stepElt 46))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#read(#loc(L))~>DotVar3),`<env>`(`_Map_`(`_|->_`(X,L),DotVar4)),_1,_2,_3,_4,_5)),DotVar1)``),_6,_7,_8) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#read(X)~>DotVar3),`<env>`(_9),_1,_2,_3,_4,_5),`Map:lookup`(_10,_0))),#match(L,`Map:lookup`(_9,X))),#match(DotVar4,`_[_<-undef]`(_9,X))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(isId(X),isInt(L))) ensures #token("true","Bool") [UNIQUE_ID(3fa14ead58d654e5a721d8bd333705e9b3c206cc0e7309d94ad66782b365b810) contentStartColumn(6) contentStartLine(168) org.kframework.attributes.Location(Location(168,6,169,39)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1388) as e69 when guard < 47 -> (let e = ((evalMap'Coln'lookup((var_0_808),e69) config (-1))) in match e with 
| [Bottom] -> (stepElt 47)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1389),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'read,(var_7_1390 :: [])) :: var_6_1391)) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_15_1392)) :: []),(var_9_1393),(var_10_1394),(var_11_1395),(var_12_1396),(var_13_1397)) :: []) -> (let e = ((evalMap'Coln'lookup((var_15_1392),(var_7_1390 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 47)
| ((Int _ as var_5_1398) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_15_1392),(var_7_1390 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 47)
| ((Map (SortMap,_,_) as var_8_1399) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e69) config (-1))) in match e with 
| [Bottom] -> (stepElt 47)
| ((Map (SortStateCellMap,_,_) as var_14_1400) :: []) when ((((((((((true) && (true))) && (true))) && (true))) && (true))) && ((((isTrue (evalisId((var_7_1390 :: [])) config (-1)))) && (true)))) && (((compare var_4_1389 var_4_1388) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e69,(KApply8(Lbl'_LT_'state'_GT_',e69,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'read,(KApply1(Lbl'Hash'loc,(var_5_1398 :: [])) :: [])) :: var_6_1391)) :: []),(KApply1(Lbl'_LT_'env'_GT_',((eval_Map_(((eval_'PipeHyph_GT_'_((var_7_1390 :: []),(var_5_1398 :: [])) config (-1))),(var_8_1399 :: [])) config (-1)))) :: []),(var_9_1393),(var_10_1394),(var_11_1395),(var_12_1396),(var_13_1397)) :: [])) config (-1))),(var_14_1400 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 47))| _ -> (stepElt 47))| _ -> (stepElt 47))| _ -> (stepElt 47))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#Transfer(#rs(PS),#loc(L))~>DotVar3),_1,`<store>`(`_Map_`(`_|->_`(F,#rs(PS)),DotVar4)),_2,_3,_4,_5)),DotVar1)``),_6,_7,_8) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#TransferV(#loc(F),#loc(L))~>DotVar3),_1,`<store>`(_9),_2,_3,_4,_5),`Map:lookup`(_10,_0))),#match(DotVar4,`_[_<-undef]`(_9,F))),#match(#rs(PS),`Map:lookup`(_9,F))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(`_andBool_`(`_andBool_`(isProps(PS),isInt(F)),isInt(L)),#inProps(`copy_OSL-SYNTAX`(.KList),PS))) ensures #token("true","Bool") [UNIQUE_ID(ca9ef1992cf8a8bc5dae872816a2b37cd4afdd6c59f9065e5c73c73e42ae40f8) contentStartColumn(6) contentStartLine(135) org.kframework.attributes.Location(Location(135,6,137,33)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (var_4_1401) as e70 when guard < 48 -> (let e = ((evalMap'Coln'lookup((var_0_808),e70) config (-1))) in match e with 
| [Bottom] -> (stepElt 48)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1402),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'TransferV,(KApply1(Lbl'Hash'loc,((Int _ as var_9_1403) :: [])) :: []),(KApply1(Lbl'Hash'loc,((Int _ as var_6_1404) :: [])) :: [])) :: var_7_1405)) :: []),(var_8_1406),(KApply1(Lbl'_LT_'store'_GT_',(var_16_1407)) :: []),(var_11_1408),(var_12_1409),(var_13_1410),(var_14_1411)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_16_1407),(var_9_1403 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 48)
| ((Map (SortMap,_,_) as var_10_1412) :: []) -> (let e = ((evalMap'Coln'lookup((var_16_1407),(var_9_1403 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 48)
| (KApply1(Lbl'Hash'rs,(var_5_1413 :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e70) config (-1))) in match e with 
| [Bottom] -> (stepElt 48)
| ((Map (SortStateCellMap,_,_) as var_15_1414) :: []) when ((((((((((true) && (true))) && (true))) && (true))) && (true))) && ((((((((isTrue (evalisProps((var_5_1413 :: [])) config (-1)))) && (true))) && (true))) && ((isTrue (eval'Hash'inProps((constcopy_OSL'Hyph'SYNTAX :: []),(var_5_1413 :: [])) config (-1))))))) && (((compare var_4_1401 var_4_1402) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e70,(KApply8(Lbl'_LT_'state'_GT_',e70,(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'Transfer,(KApply1(Lbl'Hash'rs,(var_5_1413 :: [])) :: []),(KApply1(Lbl'Hash'loc,(var_6_1404 :: [])) :: [])) :: var_7_1405)) :: []),(var_8_1406),(KApply1(Lbl'_LT_'store'_GT_',((eval_Map_(((eval_'PipeHyph_GT_'_((var_9_1403 :: []),(KApply1(Lbl'Hash'rs,(var_5_1413 :: [])) :: [])) config (-1))),(var_10_1412 :: [])) config (-1)))) :: []),(var_11_1408),(var_12_1409),(var_13_1410),(var_14_1411)) :: [])) config (-1))),(var_15_1414 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 48))| _ -> (stepElt 48))| _ -> (stepElt 48))| _ -> (stepElt 48))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#read(X)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(`*__OSL-SYNTAX`(X)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),isExp(X)) ensures #token("true","Bool") [UNIQUE_ID(53db71facbe8af0a217900232136c5c6d73d93ad7ba7a15d3b003b5ba4f06e12) contentStartColumn(6) contentStartLine(166) org.kframework.attributes.Location(Location(166,6,166,23)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1415) as e71 when guard < 49 -> (let e = ((evalMap'Coln'lookup((var_0_808),e71) config (-1))) in match e with 
| [Bottom] -> (stepElt 49)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1416),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Star'__OSL'Hyph'SYNTAX,(var_5_1417 :: [])) :: var_6_1418)) :: []),(var_7_1419),(var_8_1420),(var_9_1421),(var_10_1422),(var_11_1423),(var_12_1424)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e71) config (-1))) in match e with 
| [Bottom] -> (stepElt 49)
| ((Map (SortStateCellMap,_,_) as var_13_1425) :: []) when ((((((true) && (true))) && (true))) && ((isTrue (evalisExp((var_5_1417 :: [])) config (-1))))) && (((compare var_4_1416 var_4_1415) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e71,(KApply8(Lbl'_LT_'state'_GT_',e71,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'read,(var_5_1417 :: [])) :: var_6_1418)) :: []),(var_7_1419),(var_8_1420),(var_9_1421),(var_10_1422),(var_11_1423),(var_12_1424)) :: [])) config (-1))),(var_13_1425 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 49))| _ -> (stepElt 49))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#Transfer(#rs(PS),#loc(L))~>DotVar3),_1,`<store>`(`_Map_`(`_|->_`(F,`#uninit_OSL-SYNTAX`(.KList)),DotVar4)),_2,_3,_4,_5)),DotVar1)``),_6,_7,_8) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#TransferV(#loc(F),#loc(L))~>DotVar3),_1,`<store>`(_9),_2,_3,_4,_5),`Map:lookup`(_10,_0))),#match(DotVar4,`_[_<-undef]`(_9,F))),#match(#rs(PS),`Map:lookup`(_9,F))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(`_andBool_`(`_andBool_`(isProps(PS),isInt(F)),isInt(L)),`notBool_`(#inProps(`copy_OSL-SYNTAX`(.KList),PS)))) ensures #token("true","Bool") [UNIQUE_ID(4af0fe18591122bf96de73ecbd7d1324ca73f8bf4442ff8d6032de6ab340fcad) contentStartColumn(6) contentStartLine(130) org.kframework.attributes.Location(Location(130,6,132,41)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (var_4_1426) as e72 when guard < 50 -> (let e = ((evalMap'Coln'lookup((var_0_808),e72) config (-1))) in match e with 
| [Bottom] -> (stepElt 50)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1427),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'TransferV,(KApply1(Lbl'Hash'loc,((Int _ as var_9_1428) :: [])) :: []),(KApply1(Lbl'Hash'loc,((Int _ as var_6_1429) :: [])) :: [])) :: var_7_1430)) :: []),(var_8_1431),(KApply1(Lbl'_LT_'store'_GT_',(var_16_1432)) :: []),(var_11_1433),(var_12_1434),(var_13_1435),(var_14_1436)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_16_1432),(var_9_1428 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 50)
| ((Map (SortMap,_,_) as var_10_1437) :: []) -> (let e = ((evalMap'Coln'lookup((var_16_1432),(var_9_1428 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 50)
| (KApply1(Lbl'Hash'rs,(var_5_1438 :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e72) config (-1))) in match e with 
| [Bottom] -> (stepElt 50)
| ((Map (SortStateCellMap,_,_) as var_15_1439) :: []) when ((((((((((true) && (true))) && (true))) && (true))) && (true))) && ((((((((isTrue (evalisProps((var_5_1438 :: [])) config (-1)))) && (true))) && (true))) && ((not ((isTrue (eval'Hash'inProps((constcopy_OSL'Hyph'SYNTAX :: []),(var_5_1438 :: [])) config (-1))))))))) && (((compare var_4_1427 var_4_1426) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e72,(KApply8(Lbl'_LT_'state'_GT_',e72,(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'Transfer,(KApply1(Lbl'Hash'rs,(var_5_1438 :: [])) :: []),(KApply1(Lbl'Hash'loc,(var_6_1429 :: [])) :: [])) :: var_7_1430)) :: []),(var_8_1431),(KApply1(Lbl'_LT_'store'_GT_',((eval_Map_(((eval_'PipeHyph_GT_'_((var_9_1428 :: []),(const'Hash'uninit_OSL'Hyph'SYNTAX :: [])) config (-1))),(var_10_1437 :: [])) config (-1)))) :: []),(var_11_1433),(var_12_1434),(var_13_1435),(var_14_1436)) :: [])) config (-1))),(var_15_1439 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 50))| _ -> (stepElt 50))| _ -> (stepElt 50))| _ -> (stepElt 50))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#lvDref(#lv(E))~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#lv(`*__OSL-SYNTAX`(E))~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),isExp(E)) ensures #token("true","Bool") [UNIQUE_ID(69b49fc56e16138a99dabb96df197685168dbc7df94f38a8ee31a7b14c694367) contentStartColumn(6) contentStartLine(242) org.kframework.attributes.Location(Location(242,6,242,39)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1440) as e73 when guard < 51 -> (let e = ((evalMap'Coln'lookup((var_0_808),e73) config (-1))) in match e with 
| [Bottom] -> (stepElt 51)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1441),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'lv,(KApply1(Lbl'Star'__OSL'Hyph'SYNTAX,(var_5_1442 :: [])) :: [])) :: var_6_1443)) :: []),(var_7_1444),(var_8_1445),(var_9_1446),(var_10_1447),(var_11_1448),(var_12_1449)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e73) config (-1))) in match e with 
| [Bottom] -> (stepElt 51)
| ((Map (SortStateCellMap,_,_) as var_13_1450) :: []) when ((((((true) && (true))) && (true))) && ((isTrue (evalisExp((var_5_1442 :: [])) config (-1))))) && (((compare var_4_1441 var_4_1440) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e73,(KApply8(Lbl'_LT_'state'_GT_',e73,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'lvDref,(KApply1(Lbl'Hash'lv,(var_5_1442 :: [])) :: [])) :: var_6_1443)) :: []),(var_7_1444),(var_8_1445),(var_9_1446),(var_10_1447),(var_11_1448),(var_12_1449)) :: [])) config (-1))),(var_13_1450 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 51))| _ -> (stepElt 51))
(*{| rule `<T>`(`<states>`(``_8=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#TransferV(#loc(F),#loc(L))~>DotVar3),_1,`<store>`(STORE),_2,_3,_4,`<indexes>`(#indexes(C,_45)))),DotVar1)``),_5,_6,_7) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_8),#match(`<state>`(_0,`<k>`(#Transfer(#loc(F),#loc(L))~>DotVar3),_1,`<store>`(STORE),_2,_3,_4,`<indexes>`(#indexes(C,_45))),`Map:lookup`(_8,_0))),#match(DotVar1,`_[_<-undef]`(_8,_0))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(C),isInt(F)),isMap(STORE)),isInt(L)),isInt(_45)),`_andBool_`(`notBool_`(#existRef(#immRef(F),#list2Set(values(STORE)),C)),`notBool_`(#existRef(#mutRef(F),#list2Set(values(STORE)),C))))) ensures #token("true","Bool") [UNIQUE_ID(bea2b5111edbe602db9e0577ab63a7db98575b5239631462c9ba94f097c8f2ea) contentStartColumn(6) contentStartLine(110) org.kframework.attributes.Location(Location(110,6,114,67)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (var_4_1451) as e74 when guard < 52 -> (let e = ((evalMap'Coln'lookup((var_0_808),e74) config (-1))) in match e with 
| [Bottom] -> (stepElt 52)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1452),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'Transfer,(KApply1(Lbl'Hash'loc,((Int _ as var_5_1453) :: [])) :: []),(KApply1(Lbl'Hash'loc,((Int _ as var_6_1454) :: [])) :: [])) :: var_7_1455)) :: []),(var_8_1456),(KApply1(Lbl'_LT_'store'_GT_',((Map (SortMap,_,_) as var_9_1457) :: [])) :: []),(var_10_1458),(var_11_1459),(var_12_1460),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,((Int _ as var_13_1461) :: []),((Int _ as var_14_1462) :: [])) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e74) config (-1))) in match e with 
| [Bottom] -> (stepElt 52)
| ((Map (SortStateCellMap,_,_) as var_15_1463) :: []) when ((((((true) && (true))) && (true))) && (((((((((((true) && (true))) && (true))) && (true))) && (true))) && ((((not ((isTrue (eval'Hash'existRef((KApply1(Lbl'Hash'immRef,(var_5_1453 :: [])) :: []),((eval'Hash'list2Set(((evalvalues((var_9_1457 :: [])) config (-1)))) config (-1))),(var_13_1461 :: [])) config (-1)))))) && ((not ((isTrue (eval'Hash'existRef((KApply1(Lbl'Hash'mutRef,(var_5_1453 :: [])) :: []),((eval'Hash'list2Set(((evalvalues((var_9_1457 :: [])) config (-1)))) config (-1))),(var_13_1461 :: [])) config (-1))))))))))) && (((compare var_4_1452 var_4_1451) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e74,(KApply8(Lbl'_LT_'state'_GT_',e74,(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'TransferV,(KApply1(Lbl'Hash'loc,(var_5_1453 :: [])) :: []),(KApply1(Lbl'Hash'loc,(var_6_1454 :: [])) :: [])) :: var_7_1455)) :: []),(var_8_1456),(KApply1(Lbl'_LT_'store'_GT_',(var_9_1457 :: [])) :: []),(var_10_1458),(var_11_1459),(var_12_1460),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,(var_13_1461 :: []),(var_14_1462 :: [])) :: [])) :: [])) :: [])) config (-1))),(var_15_1463 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 52))| _ -> (stepElt 52))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#Read(#rs(R))~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),isProps(R)) ensures #token("true","Bool") [UNIQUE_ID(4c56fadb5a221976c8f22ef3a541c2971b9546defeb9809accd35a1733aee476) contentStartColumn(6) contentStartLine(182) org.kframework.attributes.Location(Location(182,6,182,30)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1464) as e75 when guard < 53 -> (let e = ((evalMap'Coln'lookup((var_0_808),e75) config (-1))) in match e with 
| [Bottom] -> (stepElt 53)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1465),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'Read,(KApply1(Lbl'Hash'rs,(var_13_1466 :: [])) :: [])) :: var_5_1467)) :: []),(var_6_1468),(var_7_1469),(var_8_1470),(var_9_1471),(var_10_1472),(var_11_1473)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e75) config (-1))) in match e with 
| [Bottom] -> (stepElt 53)
| ((Map (SortStateCellMap,_,_) as var_12_1474) :: []) when ((((((true) && (true))) && (true))) && ((isTrue (evalisProps((var_13_1466 :: [])) config (-1))))) && (((compare var_4_1465 var_4_1464) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e75,(KApply8(Lbl'_LT_'state'_GT_',e75,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1467)) :: []),(var_6_1468),(var_7_1469),(var_8_1470),(var_9_1471),(var_10_1472),(var_11_1473)) :: [])) config (-1))),(var_12_1474 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 53))| _ -> (stepElt 53))
(*{| rule `<T>`(`<states>`(``_8=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#TransferV(#loc(F),#loc(L))~>DotVar3),_1,`<store>`(STORE),_2,_3,_4,`<indexes>`(#indexes(C,_66)))),DotVar1)``),_5,_6,_7) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_8),#match(`<state>`(_0,`<k>`(#Transfer(#loc(F),#loc(L))~>DotVar3),_1,`<store>`(STORE),_2,_3,_4,`<indexes>`(#indexes(C,_66))),`Map:lookup`(_8,_0))),#match(DotVar1,`_[_<-undef]`(_8,_0))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(C),isInt(F)),isMap(STORE)),isInt(L)),isInt(_66)),`_andBool_`(`notBool_`(#existRef(#immRef(F),#list2Set(values(STORE)),C)),`notBool_`(#existRef(#mutRef(F),#list2Set(values(STORE)),C))))) ensures #token("true","Bool") [UNIQUE_ID(bea2b5111edbe602db9e0577ab63a7db98575b5239631462c9ba94f097c8f2ea) contentStartColumn(6) contentStartLine(117) org.kframework.attributes.Location(Location(117,6,121,67)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (var_4_1475) as e76 when guard < 54 -> (let e = ((evalMap'Coln'lookup((var_0_808),e76) config (-1))) in match e with 
| [Bottom] -> (stepElt 54)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1476),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'Transfer,(KApply1(Lbl'Hash'loc,((Int _ as var_5_1477) :: [])) :: []),(KApply1(Lbl'Hash'loc,((Int _ as var_6_1478) :: [])) :: [])) :: var_7_1479)) :: []),(var_8_1480),(KApply1(Lbl'_LT_'store'_GT_',((Map (SortMap,_,_) as var_9_1481) :: [])) :: []),(var_10_1482),(var_11_1483),(var_12_1484),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,((Int _ as var_13_1485) :: []),((Int _ as var_14_1486) :: [])) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e76) config (-1))) in match e with 
| [Bottom] -> (stepElt 54)
| ((Map (SortStateCellMap,_,_) as var_15_1487) :: []) when ((((((true) && (true))) && (true))) && (((((((((((true) && (true))) && (true))) && (true))) && (true))) && ((((not ((isTrue (eval'Hash'existRef((KApply1(Lbl'Hash'immRef,(var_5_1477 :: [])) :: []),((eval'Hash'list2Set(((evalvalues((var_9_1481 :: [])) config (-1)))) config (-1))),(var_13_1485 :: [])) config (-1)))))) && ((not ((isTrue (eval'Hash'existRef((KApply1(Lbl'Hash'mutRef,(var_5_1477 :: [])) :: []),((eval'Hash'list2Set(((evalvalues((var_9_1481 :: [])) config (-1)))) config (-1))),(var_13_1485 :: [])) config (-1))))))))))) && (((compare var_4_1476 var_4_1475) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e76,(KApply8(Lbl'_LT_'state'_GT_',e76,(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'TransferV,(KApply1(Lbl'Hash'loc,(var_5_1477 :: [])) :: []),(KApply1(Lbl'Hash'loc,(var_6_1478 :: [])) :: [])) :: var_7_1479)) :: []),(var_8_1480),(KApply1(Lbl'_LT_'store'_GT_',(var_9_1481 :: [])) :: []),(var_10_1482),(var_11_1483),(var_12_1484),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,(var_13_1485 :: []),(var_14_1486 :: [])) :: [])) :: [])) :: [])) config (-1))),(var_15_1487 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 54))| _ -> (stepElt 54))
(*{| rule `<T>`(`<states>`(``_8=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(DotVar3),`<env>`(ENV),_1,`<stack>`(`_List_`(`.List`(.KList),DotVar4)),_2,_3,_4)),DotVar1)``),_5,_6,_7) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_8),#match(`<state>`(_0,`<k>`(`#blockend_BLOCK`(.KList)~>DotVar3),`<env>`(_44),_1,`<stack>`(`_List_`(`ListItem`(ENV),DotVar4)),_2,_3,_4),`Map:lookup`(_8,_0))),#match(DotVar1,`_[_<-undef]`(_8,_0))),`_andBool_`(isMap(ENV),isMap(_44))) ensures #token("true","Bool") [UNIQUE_ID(92ee3b050c6ad4fbc3d7435b457530c7094e752b25462deb01e9f42cc9603edb) contentStartColumn(6) contentStartLine(24) org.kframework.attributes.Location(Location(24,6,26,55)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/block.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1488) as e77 when guard < 55 -> (let e = ((evalMap'Coln'lookup((var_0_808),e77) config (-1))) in match e with 
| [Bottom] -> (stepElt 55)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1489),(KApply1(Lbl'_LT_'k'_GT_',(KApply0(Lbl'Hash'blockend_BLOCK) :: var_5_1490)) :: []),(KApply1(Lbl'_LT_'env'_GT_',((Map (SortMap,_,_) as var_13_1491) :: [])) :: []),(var_7_1492),(KApply1(Lbl'_LT_'stack'_GT_',((List (SortList, Lbl_List_, ((Map (SortMap,_,_) as var_6_1493) :: []) :: var_8_1494)) :: [])) :: []),(var_9_1495),(var_10_1496),(var_11_1497)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e77) config (-1))) in match e with 
| [Bottom] -> (stepElt 55)
| ((Map (SortStateCellMap,_,_) as var_12_1498) :: []) when ((((((true) && (true))) && (true))) && (((true) && (true)))) && (((compare var_4_1489 var_4_1488) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e77,(KApply8(Lbl'_LT_'state'_GT_',e77,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1490)) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_6_1493 :: [])) :: []),(var_7_1492),(KApply1(Lbl'_LT_'stack'_GT_',((eval_List_(((Lazy.force const'Stop'List)),((List (SortList, Lbl_List_, var_8_1494)) :: [])) config (-1)))) :: []),(var_9_1495),(var_10_1496),(var_11_1497)) :: [])) config (-1))),(var_12_1498 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 55))| _ -> (stepElt 55))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#expStmt(V)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),isValue(V)) ensures #token("true","Bool") [UNIQUE_ID(7b3387907644d7b8a3b04d1a3baac0e4e52335b7edce2085fa4f2f7d8c464819) contentStartColumn(6) contentStartLine(25) org.kframework.attributes.Location(Location(25,6,25,20)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1499) as e78 when guard < 56 -> (let e = ((evalMap'Coln'lookup((var_0_808),e78) config (-1))) in match e with 
| [Bottom] -> (stepElt 56)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1500),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'expStmt,(var_13_1501 :: [])) :: var_5_1502)) :: []),(var_6_1503),(var_7_1504),(var_8_1505),(var_9_1506),(var_10_1507),(var_11_1508)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e78) config (-1))) in match e with 
| [Bottom] -> (stepElt 56)
| ((Map (SortStateCellMap,_,_) as var_12_1509) :: []) when ((((((true) && (true))) && (true))) && ((isTrue (evalisValue((var_13_1501 :: [])) config (-1))))) && (((compare var_4_1500 var_4_1499) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e78,(KApply8(Lbl'_LT_'state'_GT_',e78,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1502)) :: []),(var_6_1503),(var_7_1504),(var_8_1505),(var_9_1506),(var_10_1507),(var_11_1508)) :: [])) config (-1))),(var_12_1509 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 56))| _ -> (stepElt 56))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#secondBranch(Bs)~>B~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#branch(B,Bs)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(isBlock(B),isBlocks(Bs))) ensures #token("true","Bool") [UNIQUE_ID(487c1b298452ec40f59a0bd3b24f2952bb47f604ec5a03c55ceb202fa0679d40) contentStartColumn(6) contentStartLine(10) org.kframework.attributes.Location(Location(10,6,10,59)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1510) as e79 when guard < 57 -> (let e = ((evalMap'Coln'lookup((var_0_808),e79) config (-1))) in match e with 
| [Bottom] -> (stepElt 57)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1511),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'branch,(var_6_1512 :: []),(var_5_1513 :: [])) :: var_7_1514)) :: []),(var_8_1515),(var_9_1516),(var_10_1517),(var_11_1518),(var_12_1519),(var_13_1520)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e79) config (-1))) in match e with 
| [Bottom] -> (stepElt 57)
| ((Map (SortStateCellMap,_,_) as var_14_1521) :: []) when ((((((true) && (true))) && (true))) && ((((isTrue (evalisBlock((var_6_1512 :: [])) config (-1)))) && ((isTrue (evalisBlocks((var_5_1513 :: [])) config (-1))))))) && (((compare var_4_1511 var_4_1510) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e79,(KApply8(Lbl'_LT_'state'_GT_',e79,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'secondBranch,(var_5_1513 :: [])) :: var_6_1512 :: var_7_1514)) :: []),(var_8_1515),(var_9_1516),(var_10_1517),(var_11_1518),(var_12_1519),(var_13_1520)) :: [])) config (-1))),(var_14_1521 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 57))| _ -> (stepElt 57))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(Rest~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#decompose(#repeat(B)~>Rest)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(isBlock(B),isK(Rest))) ensures #token("true","Bool") [UNIQUE_ID(fdcfe4ae52a11bbb445b00bbb5651161c55df0a255605b1db7a40f814cf9cc81) contentStartColumn(6) contentStartLine(86) org.kframework.attributes.Location(Location(86,6,86,47)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1522) as e80 when guard < 58 -> (let e = ((evalMap'Coln'lookup((var_0_808),e80) config (-1))) in match e with 
| [Bottom] -> (stepElt 58)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1523),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'decompose,(KApply1(Lbl'Hash'repeat,(var_14_1524 :: [])) :: var_5_1525)) :: var_6_1526)) :: []),(var_7_1527),(var_8_1528),(var_9_1529),(var_10_1530),(var_11_1531),(var_12_1532)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e80) config (-1))) in match e with 
| [Bottom] -> (stepElt 58)
| ((Map (SortStateCellMap,_,_) as var_13_1533) :: []) when ((((((true) && (true))) && (true))) && ((((isTrue (evalisBlock((var_14_1524 :: [])) config (-1)))) && (true)))) && (((compare var_4_1522 var_4_1523) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e80,(KApply8(Lbl'_LT_'state'_GT_',e80,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1525 @ var_6_1526)) :: []),(var_7_1527),(var_8_1528),(var_9_1529),(var_10_1530),(var_11_1531),(var_12_1532)) :: [])) config (-1))),(var_13_1533 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 58))| _ -> (stepElt 58))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(HOLE~>`#freezer#TransferMB1_`(K1)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#TransferMB(HOLE,K1)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(`_andBool_`(isK(HOLE),isK(K1)),`_andBool_`(#token("true","Bool"),`notBool_`(isKResult(HOLE))))) ensures #token("true","Bool") [UNIQUE_ID(28256b9403a9b7b751161d2439842bc07543dc4e88502da5c040c6165a2eca5c) heat() klabel(#TransferMB) org.kframework.attributes.Location(Location(158,12,158,51)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) productionID(1449605932) strict(1)]|}*)
| (var_4_1534) as e81 when guard < 59 -> (let e = ((evalMap'Coln'lookup((var_0_808),e81) config (-1))) in match e with 
| [Bottom] -> (stepElt 59)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1535),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'TransferMB,(var_5_1536),(var_6_1537)) :: var_7_1538)) :: []),(var_8_1539),(var_9_1540),(var_10_1541),(var_11_1542),(var_12_1543),(var_13_1544)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e81) config (-1))) in match e with 
| [Bottom] -> (stepElt 59)
| ((Map (SortStateCellMap,_,_) as var_14_1545) :: []) when ((((((true) && (true))) && (true))) && (((((true) && (true))) && (((true) && ((not ((isTrue (evalisKResult((var_5_1536)) config (-1))))))))))) && (((compare var_4_1535 var_4_1534) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e81,(KApply8(Lbl'_LT_'state'_GT_',e81,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1536 @ KApply1(Lbl'Hash'freezer'Hash'TransferMB1_,(var_6_1537)) :: var_7_1538)) :: []),(var_8_1539),(var_9_1540),(var_10_1541),(var_11_1542),(var_12_1543),(var_13_1544)) :: [])) config (-1))),(var_14_1545 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 59))| _ -> (stepElt 59))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`_StateCellMap_`(`StateCellMapItem`(`<index>`(N),`<state>`(`<index>`(N),`<k>`(Pro),`<env>`(ENV1),`<store>`(STORE1),`<stack>`(STACK1),_0,_1,_2)),`StateCellMapItem`(_3,`<state>`(_3,`<k>`(#loopSep(`_+Int_`(N,#token("1","Int")))~>Rest),`<env>`(ENV),`<store>`(STORE),`<stack>`(STACK),_4,_5,_6))),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_3,_10),#match(`<state>`(_3,`<k>`(#loopSep(N)~>Rest),`<env>`(ENV),`<store>`(STORE),`<stack>`(STACK),_4,_5,_6),`Map:lookup`(_10,_3))),#match(`<state>`(`<index>`(N),`<k>`(Pro),`<env>`(ENV1),`<store>`(STORE1),`<stack>`(STACK1),_0,_1,_2),`Map:lookup`(_10,`<index>`(N)))),#match(DotVar1,`_[_<-undef]`(`_[_<-undef]`(_10,`<index>`(N)),_3))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isMap(ENV1),isMap(ENV)),isInt(N)),isK(Rest)),isMap(STORE)),isK(Pro)),isList(STACK)),isList(STACK1)),isMap(STORE1)),`_orBool__BOOL`(`_=/=K_`(Pro,#compare(Rest)),`_==Bool__BOOL`(#compareS(STORE,STORE1),#token("false","Bool"))))) ensures #token("true","Bool") [UNIQUE_ID(91e6670445b90dd28ce931f28dfec4cb08b8e32e017a077e59d7bbcdd94774f7) contentStartColumn(6) contentStartLine(114) org.kframework.attributes.Location(Location(114,6,126,88)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (var_12_1546) as e82 when guard < 60 -> (let e = ((evalMap'Coln'lookup((var_0_808),e82) config (-1))) in match e with 
| [Bottom] -> (stepElt 60)
| (KApply8(Lbl'_LT_'state'_GT_',(var_12_1547),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'loopSep,((Int _ as var_4_1548) :: [])) :: var_13_1549)) :: []),(KApply1(Lbl'_LT_'env'_GT_',((Map (SortMap,_,_) as var_14_1550) :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',((Map (SortMap,_,_) as var_15_1551) :: [])) :: []),(KApply1(Lbl'_LT_'stack'_GT_',((List (SortList,_,_) as var_16_1552) :: [])) :: []),(var_17_1553),(var_18_1554),(var_19_1555)) :: []) -> (let e = ((evalMap'Coln'lookup((var_0_808),(KApply1(Lbl'_LT_'index'_GT_',(var_4_1548 :: [])) :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 60)
| (KApply8(Lbl'_LT_'state'_GT_',(KApply1(Lbl'_LT_'index'_GT_',((Int _ as var_4_1556) :: [])) :: []),(KApply1(Lbl'_LT_'k'_GT_',(var_5_1557)) :: []),(KApply1(Lbl'_LT_'env'_GT_',((Map (SortMap,_,_) as var_6_1558) :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',((Map (SortMap,_,_) as var_7_1559) :: [])) :: []),(KApply1(Lbl'_LT_'stack'_GT_',((List (SortList,_,_) as var_8_1560) :: [])) :: []),(var_9_1561),(var_10_1562),(var_11_1563)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'(((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),(KApply1(Lbl'_LT_'index'_GT_',(var_4_1548 :: [])) :: [])) config (-1))),e82) config (-1))) in match e with 
| [Bottom] -> (stepElt 60)
| ((Map (SortStateCellMap,_,_) as var_20_1564) :: []) when ((((((((true) && (true))) && (true))) && (true))) && (((((((((((((((((((true) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && ((((isTrue (eval_'EqlsSlshEqls'K_((var_5_1557),(KApply1(Lbl'Hash'compare,(var_13_1549)) :: [])) config (-1)))) || ((isTrue (eval_'EqlsEqls'Bool__BOOL(((eval'Hash'compareS((var_15_1551 :: []),(var_7_1559 :: [])) config (-1))),((Bool false) :: [])) config (-1))))))))) && (((compare_kitem var_4_1548 var_4_1556) = 0) && ((compare var_12_1546 var_12_1547) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((eval_StateCellMap_(((evalStateCellMapItem((KApply1(Lbl'_LT_'index'_GT_',(var_4_1548 :: [])) :: []),(KApply8(Lbl'_LT_'state'_GT_',(KApply1(Lbl'_LT_'index'_GT_',(var_4_1548 :: [])) :: []),(KApply1(Lbl'_LT_'k'_GT_',(var_5_1557)) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_6_1558 :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',(var_7_1559 :: [])) :: []),(KApply1(Lbl'_LT_'stack'_GT_',(var_8_1560 :: [])) :: []),(var_9_1561),(var_10_1562),(var_11_1563)) :: [])) config (-1))),((evalStateCellMapItem(e82,(KApply8(Lbl'_LT_'state'_GT_',e82,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'loopSep,((eval_'Plus'Int_((var_4_1548 :: []),((Lazy.force int1) :: [])) config (-1)))) :: var_13_1549)) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_14_1550 :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',(var_15_1551 :: [])) :: []),(KApply1(Lbl'_LT_'stack'_GT_',(var_16_1552 :: [])) :: []),(var_17_1553),(var_18_1554),(var_19_1555)) :: [])) config (-1)))) config (-1))),(var_20_1564 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 60))| _ -> (stepElt 60))| _ -> (stepElt 60))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(HOLE~>`#freezer#expStmt0_`(.KList)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#expStmt(HOLE)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(isExp(HOLE),`_andBool_`(#token("true","Bool"),`notBool_`(isKResult(HOLE))))) ensures #token("true","Bool") [UNIQUE_ID(91717f9dd98fe2b826052b0ae5ff88485b75ba033f39efeaa44fe549e30403b2) heat() klabel(#expStmt) org.kframework.attributes.Location(Location(50,12,50,73)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/osl-syntax.k)) productionID(2108297149) strict()]|}*)
| (var_4_1565) as e83 when guard < 61 -> (let e = ((evalMap'Coln'lookup((var_0_808),e83) config (-1))) in match e with 
| [Bottom] -> (stepElt 61)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1566),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'expStmt,(var_5_1567 :: [])) :: var_6_1568)) :: []),(var_7_1569),(var_8_1570),(var_9_1571),(var_10_1572),(var_11_1573),(var_12_1574)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e83) config (-1))) in match e with 
| [Bottom] -> (stepElt 61)
| ((Map (SortStateCellMap,_,_) as var_13_1575) :: []) when ((((((true) && (true))) && (true))) && ((((isTrue (evalisExp((var_5_1567 :: [])) config (-1)))) && (((true) && ((not ((isTrue (evalisKResult((var_5_1567 :: [])) config (-1))))))))))) && (((compare var_4_1566 var_4_1565) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e83,(KApply8(Lbl'_LT_'state'_GT_',e83,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1567 :: const'Hash'freezer'Hash'expStmt0_ :: var_6_1568)) :: []),(var_7_1569),(var_8_1570),(var_9_1571),(var_10_1572),(var_11_1573),(var_12_1574)) :: [])) config (-1))),(var_13_1575 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 61))| _ -> (stepElt 61))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#Read(#borrowImmCK(L,BEG,END,L1))~>#loc(L1)~>DotVar3),_1,`<store>`(`_Map_`(`_|->_`(L,#br(BEG,END,#immRef(L1))),DotVar4)),_2,_3,_4,_5)),DotVar1)``),_6,_7,_8) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#read(#loc(L))~>DotVar3),_1,`<store>`(_9),_2,_3,_4,_5),`Map:lookup`(_10,_0))),#match(DotVar4,`_[_<-undef]`(_9,L))),#match(#br(BEG,END,#immRef(L1)),`Map:lookup`(_9,L))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(`_andBool_`(`_andBool_`(isInt(END),isInt(L)),isInt(L1)),isInt(BEG))) ensures #token("true","Bool") [UNIQUE_ID(6bff73fa6d1a0996603a6a8054fa4217d822c02b3098454fbeb34753b43baf71) contentStartColumn(6) contentStartLine(174) org.kframework.attributes.Location(Location(174,6,175,75)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1576) as e84 when guard < 62 -> (let e = ((evalMap'Coln'lookup((var_0_808),e84) config (-1))) in match e with 
| [Bottom] -> (stepElt 62)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1577),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'read,(KApply1(Lbl'Hash'loc,((Int _ as var_5_1578) :: [])) :: [])) :: var_9_1579)) :: []),(var_10_1580),(KApply1(Lbl'_LT_'store'_GT_',(var_17_1581)) :: []),(var_12_1582),(var_13_1583),(var_14_1584),(var_15_1585)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_17_1581),(var_5_1578 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 62)
| ((Map (SortMap,_,_) as var_11_1586) :: []) -> (let e = ((evalMap'Coln'lookup((var_17_1581),(var_5_1578 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 62)
| (KApply3(Lbl'Hash'br,((Int _ as var_6_1587) :: []),((Int _ as var_7_1588) :: []),(KApply1(Lbl'Hash'immRef,((Int _ as var_8_1589) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e84) config (-1))) in match e with 
| [Bottom] -> (stepElt 62)
| ((Map (SortStateCellMap,_,_) as var_16_1590) :: []) when ((((((((((true) && (true))) && (true))) && (true))) && (true))) && (((((((true) && (true))) && (true))) && (true)))) && (((compare var_4_1577 var_4_1576) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e84,(KApply8(Lbl'_LT_'state'_GT_',e84,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'Read,(KApply4(Lbl'Hash'borrowImmCK,(var_5_1578 :: []),(var_6_1587 :: []),(var_7_1588 :: []),(var_8_1589 :: [])) :: [])) :: KApply1(Lbl'Hash'loc,(var_8_1589 :: [])) :: var_9_1579)) :: []),(var_10_1580),(KApply1(Lbl'_LT_'store'_GT_',((eval_Map_(((eval_'PipeHyph_GT_'_((var_5_1578 :: []),(KApply3(Lbl'Hash'br,(var_6_1587 :: []),(var_7_1588 :: []),(KApply1(Lbl'Hash'immRef,(var_8_1589 :: [])) :: [])) :: [])) config (-1))),(var_11_1586 :: [])) config (-1)))) :: []),(var_12_1582),(var_13_1583),(var_14_1584),(var_15_1585)) :: [])) config (-1))),(var_16_1590 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 62))| _ -> (stepElt 62))| _ -> (stepElt 62))| _ -> (stepElt 62))
(*{| rule `<T>`(`<states>`(``_9=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(`#blockend_BLOCK`(.KList)~>DotVar3),`<env>`(`_Map_`(`_|->_`(X,L),DotVar4)),`<store>`(`_Map_`(`.Map`(.KList),DotVar5)),`<stack>`(`_List_`(`.List`(.KList),DotVar6)),_1,_2,_3)),DotVar1)``),_4,_5,_6) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_9),#match(`<state>`(_0,`<k>`(`#blockend_BLOCK`(.KList)~>DotVar3),`<env>`(_7),`<store>`(_8),`<stack>`(`_List_`(`ListItem`(X),DotVar6)),_1,_2,_3),`Map:lookup`(_9,_0))),#match(L,`Map:lookup`(_7,X))),#match(DotVar4,`_[_<-undef]`(_7,X))),#match(DotVar1,`_[_<-undef]`(_9,_0))),#match(DotVar5,`_[_<-undef]`(_8,L))),#match(_43,`Map:lookup`(_8,L))),`_andBool_`(`_andBool_`(isId(X),isInt(L)),isKItem(_43))) ensures #token("true","Bool") [UNIQUE_ID(c916ca0be35c2a1887a20de2601199b95e51cdcee7c90454bc061d6411f84245) contentStartColumn(6) contentStartLine(19) org.kframework.attributes.Location(Location(19,6,22,52)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/block.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1591) as e85 when guard < 63 -> (let e = ((evalMap'Coln'lookup((var_0_808),e85) config (-1))) in match e with 
| [Bottom] -> (stepElt 63)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1592),(KApply1(Lbl'_LT_'k'_GT_',(KApply0(Lbl'Hash'blockend_BLOCK) :: var_5_1593)) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_15_1594)) :: []),(KApply1(Lbl'_LT_'store'_GT_',(var_16_1595)) :: []),(KApply1(Lbl'_LT_'stack'_GT_',((List (SortList, Lbl_List_, (var_6_1596 :: []) :: var_10_1597)) :: [])) :: []),(var_11_1598),(var_12_1599),(var_13_1600)) :: []) -> (let e = ((evalMap'Coln'lookup((var_15_1594),(var_6_1596 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 63)
| ((Int _ as var_7_1601) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_15_1594),(var_6_1596 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 63)
| ((Map (SortMap,_,_) as var_8_1602) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e85) config (-1))) in match e with 
| [Bottom] -> (stepElt 63)
| ((Map (SortStateCellMap,_,_) as var_14_1603) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_16_1595),(var_7_1601 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 63)
| ((Map (SortMap,_,_) as var_9_1604) :: []) -> (let e = ((evalMap'Coln'lookup((var_16_1595),(var_7_1601 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 63)
| (var_17_1605 :: []) when ((((((((((((((true) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && ((((((isTrue (evalisId((var_6_1596 :: [])) config (-1)))) && (true))) && (true)))) && (((compare var_4_1591 var_4_1592) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e85,(KApply8(Lbl'_LT_'state'_GT_',e85,(KApply1(Lbl'_LT_'k'_GT_',(const'Hash'blockend_BLOCK :: var_5_1593)) :: []),(KApply1(Lbl'_LT_'env'_GT_',((eval_Map_(((eval_'PipeHyph_GT_'_((var_6_1596 :: []),(var_7_1601 :: [])) config (-1))),(var_8_1602 :: [])) config (-1)))) :: []),(KApply1(Lbl'_LT_'store'_GT_',((eval_Map_(((Lazy.force const'Stop'Map)),(var_9_1604 :: [])) config (-1)))) :: []),(KApply1(Lbl'_LT_'stack'_GT_',((eval_List_(((Lazy.force const'Stop'List)),((List (SortList, Lbl_List_, var_10_1597)) :: [])) config (-1)))) :: []),(var_11_1598),(var_12_1599),(var_13_1600)) :: [])) config (-1))),(var_14_1603 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 63))| _ -> (stepElt 63))| _ -> (stepElt 63))| _ -> (stepElt 63))| _ -> (stepElt 63))| _ -> (stepElt 63))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(`#blockend_BLOCK`(.KList)~>V~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(V~>`#blockend_BLOCK`(.KList)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),isValue(V)) ensures #token("true","Bool") [UNIQUE_ID(3d940d191cb6924c5734bfc64aa7aa5b6d6e9613fb5bdbac0353c9eb7b943903) contentStartColumn(6) contentStartLine(17) org.kframework.attributes.Location(Location(17,6,17,44)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/block.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1606) as e86 when guard < 64 -> (let e = ((evalMap'Coln'lookup((var_0_808),e86) config (-1))) in match e with 
| [Bottom] -> (stepElt 64)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1607),(KApply1(Lbl'_LT_'k'_GT_',(var_5_1608 :: KApply0(Lbl'Hash'blockend_BLOCK) :: var_6_1609)) :: []),(var_7_1610),(var_8_1611),(var_9_1612),(var_10_1613),(var_11_1614),(var_12_1615)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e86) config (-1))) in match e with 
| [Bottom] -> (stepElt 64)
| ((Map (SortStateCellMap,_,_) as var_13_1616) :: []) when ((((((true) && (true))) && (true))) && ((isTrue (evalisValue((var_5_1608 :: [])) config (-1))))) && (((compare var_4_1607 var_4_1606) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e86,(KApply8(Lbl'_LT_'state'_GT_',e86,(KApply1(Lbl'_LT_'k'_GT_',(const'Hash'blockend_BLOCK :: var_5_1608 :: var_6_1609)) :: []),(var_7_1610),(var_8_1611),(var_9_1612),(var_10_1613),(var_11_1614),(var_12_1615)) :: [])) config (-1))),(var_13_1616 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 64))| _ -> (stepElt 64))
(*{| rule `<T>`(`<states>`(``_6=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(DotVar3),`<env>`(ENV),`<store>`(`_[_<-_]_MAP`(ST,#unwrapInt(`Map:lookup`(ENV,X)),#br(C,C,#mutRef(#unwrapInt(`Map:lookup`(ENV,Y)))))),_1,_2,`<timer>`(`_+Int_`(TIMER,#token("1","Int"))),`<indexes>`(#indexes(`_+Int_`(C,#token("1","Int")),_50)))),DotVar1)``),_3,_4,_5) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_6),#match(`<state>`(_0,`<k>`(#mborrow(X,Y)~>DotVar3),`<env>`(ENV),`<store>`(ST),_1,_2,`<timer>`(TIMER),`<indexes>`(#indexes(C,_50))),`Map:lookup`(_6,_0))),#match(DotVar1,`_[_<-undef]`(_6,_0))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(TIMER),isId(Y)),isInt(C)),isMap(ENV)),isId(X)),isMap(ST)),isInt(_50)),#checkInit(Y,ENV,ST))) ensures #token("true","Bool") [UNIQUE_ID(fd337401940d9f255df0ad0b4f66d92e009040616cd4a9d8368af9b2bec5cd39) contentStartColumn(6) contentStartLine(413) org.kframework.attributes.Location(Location(413,6,419,35)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (var_4_1617) as e87 when guard < 65 -> (let e = ((evalMap'Coln'lookup((var_0_808),e87) config (-1))) in match e with 
| [Bottom] -> (stepElt 65)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1618),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'mborrow,(var_8_1619 :: []),(var_10_1620 :: [])) :: var_5_1621)) :: []),(KApply1(Lbl'_LT_'env'_GT_',((Map (SortMap,_,_) as var_6_1622) :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',((Map (SortMap,_,_) as var_7_1623) :: [])) :: []),(var_11_1624),(var_12_1625),(KApply1(Lbl'_LT_'timer'_GT_',((Int _ as var_13_1626) :: [])) :: []),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,((Int _ as var_9_1627) :: []),((Int _ as var_14_1628) :: [])) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e87) config (-1))) in match e with 
| [Bottom] -> (stepElt 65)
| ((Map (SortStateCellMap,_,_) as var_15_1629) :: []) when ((((((true) && (true))) && (true))) && (((((((((((((((true) && ((isTrue (evalisId((var_10_1620 :: [])) config (-1)))))) && (true))) && (true))) && ((isTrue (evalisId((var_8_1619 :: [])) config (-1)))))) && (true))) && (true))) && ((isTrue (eval'Hash'checkInit((var_10_1620 :: []),(var_6_1622 :: []),(var_7_1623 :: [])) config (-1))))))) && (((compare var_4_1618 var_4_1617) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e87,(KApply8(Lbl'_LT_'state'_GT_',e87,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1621)) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_6_1622 :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',((eval_'LSqB'_'_LT_Hyph'_'RSqB'_MAP((var_7_1623 :: []),((eval'Hash'unwrapInt(((evalMap'Coln'lookup((var_6_1622 :: []),(var_8_1619 :: [])) config (-1)))) config (-1))),(KApply3(Lbl'Hash'br,(var_9_1627 :: []),(var_9_1627 :: []),(KApply1(Lbl'Hash'mutRef,((eval'Hash'unwrapInt(((evalMap'Coln'lookup((var_6_1622 :: []),(var_10_1620 :: [])) config (-1)))) config (-1)))) :: [])) :: [])) config (-1)))) :: []),(var_11_1624),(var_12_1625),(KApply1(Lbl'_LT_'timer'_GT_',((eval_'Plus'Int_((var_13_1626 :: []),((Lazy.force int1) :: [])) config (-1)))) :: []),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,((eval_'Plus'Int_((var_9_1627 :: []),((Lazy.force int1) :: [])) config (-1))),(var_14_1628 :: [])) :: [])) :: [])) :: [])) config (-1))),(var_15_1629 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 65))| _ -> (stepElt 65))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#rs(N)~>DotVar3),_1,`<store>`(`_Map_`(`_|->_`(L,#rs(N)),DotVar4)),_2,_3,_4,_5)),DotVar1)``),_6,_7,_8) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#read(#loc(L))~>DotVar3),_1,`<store>`(_9),_2,_3,_4,_5),`Map:lookup`(_10,_0))),#match(DotVar4,`_[_<-undef]`(_9,L))),#match(#rs(N),`Map:lookup`(_9,L))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(isProps(N),isInt(L))) ensures #token("true","Bool") [UNIQUE_ID(5e21a8ea429b59135b47500758a7ac7583f06a44b797db42a1eb6c2c7be23af6) contentStartColumn(6) contentStartLine(171) org.kframework.attributes.Location(Location(171,6,172,49)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1630) as e88 when guard < 66 -> (let e = ((evalMap'Coln'lookup((var_0_808),e88) config (-1))) in match e with 
| [Bottom] -> (stepElt 66)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1631),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'read,(KApply1(Lbl'Hash'loc,((Int _ as var_8_1632) :: [])) :: [])) :: var_6_1633)) :: []),(var_7_1634),(KApply1(Lbl'_LT_'store'_GT_',(var_15_1635)) :: []),(var_10_1636),(var_11_1637),(var_12_1638),(var_13_1639)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_15_1635),(var_8_1632 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 66)
| ((Map (SortMap,_,_) as var_9_1640) :: []) -> (let e = ((evalMap'Coln'lookup((var_15_1635),(var_8_1632 :: [])) config (-1))) in match e with 
| [Bottom] -> (stepElt 66)
| (KApply1(Lbl'Hash'rs,(var_5_1641 :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e88) config (-1))) in match e with 
| [Bottom] -> (stepElt 66)
| ((Map (SortStateCellMap,_,_) as var_14_1642) :: []) when ((((((((((true) && (true))) && (true))) && (true))) && (true))) && ((((isTrue (evalisProps((var_5_1641 :: [])) config (-1)))) && (true)))) && (((compare var_4_1631 var_4_1630) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e88,(KApply8(Lbl'_LT_'state'_GT_',e88,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'rs,(var_5_1641 :: [])) :: var_6_1633)) :: []),(var_7_1634),(KApply1(Lbl'_LT_'store'_GT_',((eval_Map_(((eval_'PipeHyph_GT_'_((var_8_1632 :: []),(KApply1(Lbl'Hash'rs,(var_5_1641 :: [])) :: [])) config (-1))),(var_9_1640 :: [])) config (-1)))) :: []),(var_10_1636),(var_11_1637),(var_12_1638),(var_13_1639)) :: [])) config (-1))),(var_14_1642 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 66))| _ -> (stepElt 66))| _ -> (stepElt 66))| _ -> (stepElt 66))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#Deallocate(#lv(E))~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(#deallocate(E)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),isExp(E)) ensures #token("true","Bool") [UNIQUE_ID(32224f8bc83373e52f56131e94ba2cfd7ce7e6fce1c13aaeab45f3e4e5fec5bf) contentStartColumn(6) contentStartLine(370) org.kframework.attributes.Location(Location(370,6,370,47)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1643) as e89 when guard < 67 -> (let e = ((evalMap'Coln'lookup((var_0_808),e89) config (-1))) in match e with 
| [Bottom] -> (stepElt 67)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1644),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'deallocate,(var_5_1645 :: [])) :: var_6_1646)) :: []),(var_7_1647),(var_8_1648),(var_9_1649),(var_10_1650),(var_11_1651),(var_12_1652)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e89) config (-1))) in match e with 
| [Bottom] -> (stepElt 67)
| ((Map (SortStateCellMap,_,_) as var_13_1653) :: []) when ((((((true) && (true))) && (true))) && ((isTrue (evalisExp((var_5_1645 :: [])) config (-1))))) && (((compare var_4_1643 var_4_1644) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e89,(KApply8(Lbl'_LT_'state'_GT_',e89,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'Deallocate,(KApply1(Lbl'Hash'lv,(var_5_1645 :: [])) :: [])) :: var_6_1646)) :: []),(var_7_1647),(var_8_1648),(var_9_1649),(var_10_1650),(var_11_1651),(var_12_1652)) :: [])) config (-1))),(var_13_1653 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 67))| _ -> (stepElt 67))
(*{| rule `<T>`(`<states>`(``_6=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(DotVar3),`<env>`(ENV),`<store>`(`_[_<-_]_MAP`(ST,#unwrapInt(`Map:lookup`(ENV,X)),#br(C,C,#immRef(#unwrapInt(`Map:lookup`(ENV,Y)))))),_1,_2,`<timer>`(`_+Int_`(TIMER,#token("1","Int"))),`<indexes>`(#indexes(`_+Int_`(C,#token("1","Int")),_52)))),DotVar1)``),_3,_4,_5) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_6),#match(`<state>`(_0,`<k>`(#borrow(X,Y)~>DotVar3),`<env>`(ENV),`<store>`(ST),_1,_2,`<timer>`(TIMER),`<indexes>`(#indexes(C,_52))),`Map:lookup`(_6,_0))),#match(DotVar1,`_[_<-undef]`(_6,_0))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(_52),isInt(TIMER)),isId(Y)),isInt(C)),isMap(ENV)),isId(X)),isMap(ST)),#checkInit(Y,ENV,ST))) ensures #token("true","Bool") [UNIQUE_ID(003bac6b0bbe078acb2838abe23ed60cf8d2c47490ae38800ba07a755aba7664) contentStartColumn(6) contentStartLine(402) org.kframework.attributes.Location(Location(402,6,409,35)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (var_4_1654) as e90 when guard < 68 -> (let e = ((evalMap'Coln'lookup((var_0_808),e90) config (-1))) in match e with 
| [Bottom] -> (stepElt 68)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1655),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'borrow,(var_8_1656 :: []),(var_10_1657 :: [])) :: var_5_1658)) :: []),(KApply1(Lbl'_LT_'env'_GT_',((Map (SortMap,_,_) as var_6_1659) :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',((Map (SortMap,_,_) as var_7_1660) :: [])) :: []),(var_11_1661),(var_12_1662),(KApply1(Lbl'_LT_'timer'_GT_',((Int _ as var_13_1663) :: [])) :: []),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,((Int _ as var_9_1664) :: []),((Int _ as var_14_1665) :: [])) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e90) config (-1))) in match e with 
| [Bottom] -> (stepElt 68)
| ((Map (SortStateCellMap,_,_) as var_15_1666) :: []) when ((((((true) && (true))) && (true))) && (((((((((((((((true) && (true))) && ((isTrue (evalisId((var_10_1657 :: [])) config (-1)))))) && (true))) && (true))) && ((isTrue (evalisId((var_8_1656 :: [])) config (-1)))))) && (true))) && ((isTrue (eval'Hash'checkInit((var_10_1657 :: []),(var_6_1659 :: []),(var_7_1660 :: [])) config (-1))))))) && (((compare var_4_1654 var_4_1655) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e90,(KApply8(Lbl'_LT_'state'_GT_',e90,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1658)) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_6_1659 :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',((eval_'LSqB'_'_LT_Hyph'_'RSqB'_MAP((var_7_1660 :: []),((eval'Hash'unwrapInt(((evalMap'Coln'lookup((var_6_1659 :: []),(var_8_1656 :: [])) config (-1)))) config (-1))),(KApply3(Lbl'Hash'br,(var_9_1664 :: []),(var_9_1664 :: []),(KApply1(Lbl'Hash'immRef,((eval'Hash'unwrapInt(((evalMap'Coln'lookup((var_6_1659 :: []),(var_10_1657 :: [])) config (-1)))) config (-1)))) :: [])) :: [])) config (-1)))) :: []),(var_11_1661),(var_12_1662),(KApply1(Lbl'_LT_'timer'_GT_',((eval_'Plus'Int_((var_13_1663 :: []),((Lazy.force int1) :: [])) config (-1)))) :: []),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,((eval_'Plus'Int_((var_9_1664 :: []),((Lazy.force int1) :: [])) config (-1))),(var_14_1665 :: [])) :: [])) :: [])) :: [])) config (-1))),(var_15_1666 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 68))| _ -> (stepElt 68))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#Transfer(K0,HOLE)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(HOLE~>`#freezer#Transfer0_`(K0)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(`_andBool_`(isExp(HOLE),isK(K0)),`_andBool_`(#token("true","Bool"),isKResult(HOLE)))) ensures #token("true","Bool") [UNIQUE_ID(5087f3e877cbda5fd012dd16d9c954df171973cce06908301c120350ad87b879) cool() klabel(#Transfer) org.kframework.attributes.Location(Location(42,12,42,38)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) productionID(1329315688) strict()]|}*)
| (var_4_1667) as e91 when guard < 69 -> (let e = ((evalMap'Coln'lookup((var_0_808),e91) config (-1))) in match e with 
| [Bottom] -> (stepElt 69)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1668),(KApply1(Lbl'_LT_'k'_GT_',(var_6_1669 :: KApply1(Lbl'Hash'freezer'Hash'Transfer0_,(var_5_1670)) :: var_7_1671)) :: []),(var_8_1672),(var_9_1673),(var_10_1674),(var_11_1675),(var_12_1676),(var_13_1677)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e91) config (-1))) in match e with 
| [Bottom] -> (stepElt 69)
| ((Map (SortStateCellMap,_,_) as var_14_1678) :: []) when ((((((true) && (true))) && (true))) && ((((((isTrue (evalisExp((var_6_1669 :: [])) config (-1)))) && (true))) && (((true) && ((isTrue (evalisKResult((var_6_1669 :: [])) config (-1))))))))) && (((compare var_4_1668 var_4_1667) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e91,(KApply8(Lbl'_LT_'state'_GT_',e91,(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'Transfer,(var_5_1670),(var_6_1669 :: [])) :: var_7_1671)) :: []),(var_8_1672),(var_9_1673),(var_10_1674),(var_11_1675),(var_12_1676),(var_13_1677)) :: [])) config (-1))),(var_14_1678 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 69))| _ -> (stepElt 69))
(*{| rule `<T>`(`<states>`(``_8=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(DotVar3),_1,`<store>`(`_[_<-_]_MAP`(Rho,L,#br(C,C,#mutRef(F)))),_2,_3,_4,`<indexes>`(#indexes(C,_83)))),DotVar1)``),_5,_6,_7) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_8),#match(`<state>`(_0,`<k>`(#TransferMB(#loc(F),#loc(L))~>DotVar3),_1,`<store>`(Rho),_2,_3,_4,`<indexes>`(#indexes(C,_83))),`Map:lookup`(_8,_0))),#match(DotVar1,`_[_<-undef]`(_8,_0))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isMap(Rho),isInt(C)),isInt(_83)),isInt(F)),isInt(L))) ensures #token("true","Bool") [UNIQUE_ID(8b2879958e627c0caf2de54d9f6c1f2b92d56140edfd7bc532b473ea975606c4) contentStartColumn(6) contentStartLine(157) org.kframework.attributes.Location(Location(157,6,159,49)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1679) as e92 when guard < 70 -> (let e = ((evalMap'Coln'lookup((var_0_808),e92) config (-1))) in match e with 
| [Bottom] -> (stepElt 70)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1680),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'TransferMB,(KApply1(Lbl'Hash'loc,((Int _ as var_10_1681) :: [])) :: []),(KApply1(Lbl'Hash'loc,((Int _ as var_8_1682) :: [])) :: [])) :: var_5_1683)) :: []),(var_6_1684),(KApply1(Lbl'_LT_'store'_GT_',((Map (SortMap,_,_) as var_7_1685) :: [])) :: []),(var_11_1686),(var_12_1687),(var_13_1688),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,((Int _ as var_9_1689) :: []),((Int _ as var_14_1690) :: [])) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e92) config (-1))) in match e with 
| [Bottom] -> (stepElt 70)
| ((Map (SortStateCellMap,_,_) as var_15_1691) :: []) when ((((((true) && (true))) && (true))) && (((((((((true) && (true))) && (true))) && (true))) && (true)))) && (((compare var_4_1679 var_4_1680) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e92,(KApply8(Lbl'_LT_'state'_GT_',e92,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1683)) :: []),(var_6_1684),(KApply1(Lbl'_LT_'store'_GT_',((eval_'LSqB'_'_LT_Hyph'_'RSqB'_MAP((var_7_1685 :: []),(var_8_1682 :: []),(KApply3(Lbl'Hash'br,(var_9_1689 :: []),(var_9_1689 :: []),(KApply1(Lbl'Hash'mutRef,(var_10_1681 :: [])) :: [])) :: [])) config (-1)))) :: []),(var_11_1686),(var_12_1687),(var_13_1688),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,(var_9_1689 :: []),(var_14_1690 :: [])) :: [])) :: [])) :: [])) config (-1))),(var_15_1691 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 70))| _ -> (stepElt 70))
(*{| rule `<T>`(`<states>`(``_6=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#loc(L1)~>DotVar3),_1,`<store>`(`_[_<-_]_MAP`(Rho,L,#br(BEG,TIMER,#mutRef(L1)))),_2,`<write>`(WRITE),`<timer>`(TIMER),`<indexes>`(#indexes(C,_73)))),DotVar1)``),_3,_4,_5) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_6),#match(`<state>`(_0,`<k>`(#borrowMutCK(L,BEG,END,L1)~>DotVar3),_1,`<store>`(Rho),_2,`<write>`(WRITE),`<timer>`(TIMER),`<indexes>`(#indexes(C,_73))),`Map:lookup`(_6,_0))),#match(DotVar1,`_[_<-undef]`(_6,_0))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(TIMER),isInt(END)),isMap(Rho)),isInt(C)),isInt(_73)),isSet(WRITE)),isInt(L)),isInt(L1)),isInt(BEG)),`_andBool_`(`_==Bool__BOOL`(#borrowmutck(L,Rho,BEG,TIMER,L1),#token("false","Bool")),#writeCK(L1,BEG,TIMER,WRITE)))) ensures #token("true","Bool") [UNIQUE_ID(dedd2c83e769be94bb1d7d46ad7e068d9a3f6739f22327ea7a2ab408cb991455) contentStartColumn(6) contentStartLine(212) org.kframework.attributes.Location(Location(212,6,218,45)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (var_4_1692) as e93 when guard < 71 -> (let e = ((evalMap'Coln'lookup((var_0_808),e93) config (-1))) in match e with 
| [Bottom] -> (stepElt 71)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1693),(KApply1(Lbl'_LT_'k'_GT_',(KApply4(Lbl'Hash'borrowMutCK,((Int _ as var_9_1694) :: []),((Int _ as var_10_1695) :: []),((Int _ as var_17_1696) :: []),((Int _ as var_5_1697) :: [])) :: var_6_1698)) :: []),(var_7_1699),(KApply1(Lbl'_LT_'store'_GT_',((Map (SortMap,_,_) as var_8_1700) :: [])) :: []),(var_12_1701),(KApply1(Lbl'_LT_'write'_GT_',((Set (SortSet,_,_) as var_13_1702) :: [])) :: []),(KApply1(Lbl'_LT_'timer'_GT_',((Int _ as var_11_1703) :: [])) :: []),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,((Int _ as var_14_1704) :: []),((Int _ as var_15_1705) :: [])) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e93) config (-1))) in match e with 
| [Bottom] -> (stepElt 71)
| ((Map (SortStateCellMap,_,_) as var_16_1706) :: []) when ((((((true) && (true))) && (true))) && (((((((((((((((((((true) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && ((((isTrue (eval_'EqlsEqls'Bool__BOOL(((eval'Hash'borrowmutck((var_9_1694 :: []),(var_8_1700 :: []),(var_10_1695 :: []),(var_11_1703 :: []),(var_5_1697 :: [])) config (-1))),((Bool false) :: [])) config (-1)))) && ((isTrue (eval'Hash'writeCK((var_5_1697 :: []),(var_10_1695 :: []),(var_11_1703 :: []),(var_13_1702 :: [])) config (-1))))))))) && (((compare var_4_1693 var_4_1692) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e93,(KApply8(Lbl'_LT_'state'_GT_',e93,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'loc,(var_5_1697 :: [])) :: var_6_1698)) :: []),(var_7_1699),(KApply1(Lbl'_LT_'store'_GT_',((eval_'LSqB'_'_LT_Hyph'_'RSqB'_MAP((var_8_1700 :: []),(var_9_1694 :: []),(KApply3(Lbl'Hash'br,(var_10_1695 :: []),(var_11_1703 :: []),(KApply1(Lbl'Hash'mutRef,(var_5_1697 :: [])) :: [])) :: [])) config (-1)))) :: []),(var_12_1701),(KApply1(Lbl'_LT_'write'_GT_',(var_13_1702 :: [])) :: []),(KApply1(Lbl'_LT_'timer'_GT_',(var_11_1703 :: [])) :: []),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,(var_14_1704 :: []),(var_15_1705 :: [])) :: [])) :: [])) :: [])) config (-1))),(var_16_1706 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 71))| _ -> (stepElt 71))
(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(S~>Ss~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(`___OSL-SYNTAX`(S,Ss)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),`_andBool_`(isStmts(Ss),isStmt(S))) ensures #token("true","Bool") [UNIQUE_ID(feb3d964f0a1134778ff7c506bf467abb6f39f207719f250723e72e5f978d637) contentStartColumn(6) contentStartLine(19) org.kframework.attributes.Location(Location(19,6,19,32)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1707) as e94 when guard < 72 -> (let e = ((evalMap'Coln'lookup((var_0_808),e94) config (-1))) in match e with 
| [Bottom] -> (stepElt 72)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1708),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl___OSL'Hyph'SYNTAX,(var_5_1709 :: []),(var_6_1710 :: [])) :: var_7_1711)) :: []),(var_8_1712),(var_9_1713),(var_10_1714),(var_11_1715),(var_12_1716),(var_13_1717)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e94) config (-1))) in match e with 
| [Bottom] -> (stepElt 72)
| ((Map (SortStateCellMap,_,_) as var_14_1718) :: []) when ((((((true) && (true))) && (true))) && ((((isTrue (evalisStmts((var_6_1710 :: [])) config (-1)))) && ((isTrue (evalisStmt((var_5_1709 :: [])) config (-1))))))) && (((compare var_4_1708 var_4_1707) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e94,(KApply8(Lbl'_LT_'state'_GT_',e94,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1709 :: var_6_1710 :: var_7_1711)) :: []),(var_8_1712),(var_9_1713),(var_10_1714),(var_11_1715),(var_12_1716),(var_13_1717)) :: [])) config (-1))),(var_14_1718 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 72))| _ -> (stepElt 72))
(*{| rule `<T>`(`<states>`(``_8=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#Transfer(#lv(EF),#lv(TX))~>`#increaseIndex_OSL`(.KList)~>`#increaseTimer_OSL`(.KList)~>DotVar3),`<env>`(ENV),_1,_2,`<write>`(`_Set_`(`SetItem`(#writev(#wv(TX,ENV),TR)),DotVar4)),`<timer>`(TR),_3)),DotVar1)``),_4,_5,_6) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_8),#match(`<state>`(_0,`<k>`(#transfer(EF,TX)~>DotVar3),`<env>`(ENV),_1,_2,`<write>`(_7),`<timer>`(TR),_3),`Map:lookup`(_8,_0))),#match(DotVar1,`_[_<-undef]`(_8,_0))),#match(DotVar4,_7)),`_andBool_`(`_andBool_`(`_andBool_`(isMap(ENV),isExp(EF)),isExp(TX)),isInt(TR))) ensures #token("true","Bool") [UNIQUE_ID(5cb419709f4baf0ffd8e167b9c996701fcb35dac201e21ee29cbc2705792b2fa) contentStartColumn(6) contentStartLine(45) org.kframework.attributes.Location(Location(45,6,49,68)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_4_1719) as e95 when guard < 73 -> (let e = ((evalMap'Coln'lookup((var_0_808),e95) config (-1))) in match e with 
| [Bottom] -> (stepElt 73)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1720),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'transfer,(var_5_1721 :: []),(var_6_1722 :: [])) :: var_7_1723)) :: []),(KApply1(Lbl'_LT_'env'_GT_',((Map (SortMap,_,_) as var_8_1724) :: [])) :: []),(var_9_1725),(var_10_1726),(KApply1(Lbl'_LT_'write'_GT_',(var_15_1727)) :: []),(KApply1(Lbl'_LT_'timer'_GT_',((Int _ as var_11_1728) :: [])) :: []),(var_13_1729)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_808),e95) config (-1))) in match e with 
| [Bottom] -> (stepElt 73)
| ((Map (SortStateCellMap,_,_) as var_14_1730) :: []) -> (let e = (var_15_1727) in match e with 
| [Bottom] -> (stepElt 73)
| ((Set (SortSet,_,_) as var_12_1731) :: []) when ((((((((true) && (true))) && (true))) && (true))) && (((((((true) && ((isTrue (evalisExp((var_5_1721 :: [])) config (-1)))))) && ((isTrue (evalisExp((var_6_1722 :: [])) config (-1)))))) && (true)))) && (((compare var_4_1719 var_4_1720) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e95,(KApply8(Lbl'_LT_'state'_GT_',e95,(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'Transfer,(KApply1(Lbl'Hash'lv,(var_5_1721 :: [])) :: []),(KApply1(Lbl'Hash'lv,(var_6_1722 :: [])) :: [])) :: const'Hash'increaseIndex_OSL :: const'Hash'increaseTimer_OSL :: var_7_1723)) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_8_1724 :: [])) :: []),(var_9_1725),(var_10_1726),(KApply1(Lbl'_LT_'write'_GT_',((eval_Set_(((evalSetItem((KApply2(Lbl'Hash'writev,((eval'Hash'wv((var_6_1722 :: []),(var_8_1724 :: [])) config (-1))),(var_11_1728 :: [])) :: [])) config (-1))),(var_12_1731 :: [])) config (-1)))) :: []),(KApply1(Lbl'_LT_'timer'_GT_',(var_11_1728 :: [])) :: []),(var_13_1729)) :: [])) config (-1))),(var_14_1730 :: [])) config (-1)))) :: []),(var_1_809),(var_2_810),(var_3_811)) :: [])), (StepFunc step))| _ -> (stepElt 73))| _ -> (stepElt 73))| _ -> (stepElt 73))
| _ -> (interned_bottom, (StepFunc step))) else (result, f) in stepElt guard) collection (interned_bottom, (StepFunc step))) in if choice == interned_bottom then (lookups_step c config 74) else (choice, f)| _ -> (lookups_step c config 74))
| (KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',(var_0_1732)) :: []),(KApply1(Lbl'_LT_'nstate'_GT_',((Int _ as var_1_1733) :: [])) :: []),(var_2_1734),(var_3_1735)) :: []) when guard < 77 -> (match (var_0_1732) with 
| [Map (_,_,collection)] -> let (choice, f) = (KMap.fold (fun e v (result, f) -> let rec stepElt = fun guard -> if result == interned_bottom then (match e with (*{| rule `<T>`(`<states>`(``_9=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(Rest),_1,_2,_3,_4,_5,_6)),DotVar1)``),`<nstate>`(NS),_7,_8) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_9),#match(`<state>`(_0,`<k>`(#loopSep(N)~>Rest),_1,_2,_3,_4,_5,_6),`Map:lookup`(_9,_0))),#match(DotVar1,`_[_<-undef]`(_9,_0))),`_andBool_`(`_andBool_`(`_andBool_`(isInt(NS),isInt(N)),isK(Rest)),`_>=Int__INT`(N,NS))) ensures #token("true","Bool") [UNIQUE_ID(012343b8845f6ae0f68af64e686020cf23e7c6d962c28d3501670117ad4320ea) contentStartColumn(6) contentStartLine(76) org.kframework.attributes.Location(Location(76,6,78,25)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K "requires" K)]|}*)
| (var_4_1736) as e97 when guard < 75 -> (let e = ((evalMap'Coln'lookup((var_0_1732),e97) config (-1))) in match e with 
| [Bottom] -> (stepElt 75)
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1737),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'loopSep,((Int _ as var_13_1738) :: [])) :: var_5_1739)) :: []),(var_6_1740),(var_7_1741),(var_8_1742),(var_9_1743),(var_10_1744),(var_11_1745)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_1732),e97) config (-1))) in match e with 
| [Bottom] -> (stepElt 75)
| ((Map (SortStateCellMap,_,_) as var_12_1746) :: []) when ((((((true) && (true))) && (true))) && (((((((true) && (true))) && (true))) && ((isTrue (eval_'_GT_Eqls'Int__INT((var_13_1738 :: []),(var_1_1733 :: [])) config (-1))))))) && (((compare var_4_1736 var_4_1737) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e97,(KApply8(Lbl'_LT_'state'_GT_',e97,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1739)) :: []),(var_6_1740),(var_7_1741),(var_8_1742),(var_9_1743),(var_10_1744),(var_11_1745)) :: [])) config (-1))),(var_12_1746 :: [])) config (-1)))) :: []),(KApply1(Lbl'_LT_'nstate'_GT_',(var_1_1733 :: [])) :: []),(var_2_1734),(var_3_1735)) :: [])), (StepFunc step))| _ -> (stepElt 75))| _ -> (stepElt 75))
(*{| rule `<T>`(`<states>`(``_2=>`_StateCellMap_`(`_StateCellMap_`(`_StateCellMap_`(`StateCellMapItem`(`<index>`(NS),`<state>`(`<index>`(NS),`<k>`(#compare(#repeat(B)~>Rest)),`<env>`(ENV),`<store>`(STORE),`<stack>`(STACK),`<write>`(WRITE),`<timer>`(TIMER),`<indexes>`(#indexes(A,C)))),`StateCellMapItem`(`<index>`(`_+Int_`(NS,#token("1","Int"))),`<state>`(`<index>`(`_+Int_`(NS,#token("1","Int"))),`<k>`(Rest),`<env>`(ENV),`<store>`(STORE),`<stack>`(STACK),`<write>`(WRITE),`<timer>`(TIMER),`<indexes>`(#indexes(A,C))))),`StateCellMapItem`(DotVar2,`<state>`(DotVar2,`<k>`(B~>#loopSep(#token("0","Int"))~>#repeat(B)~>Rest),`<env>`(ENV),`<store>`(STORE),`<stack>`(STACK),`<write>`(WRITE),`<timer>`(TIMER),`<indexes>`(#indexes(A,C))))),DotVar1)``),`<nstate>`(``NS=>`_+Int_`(NS,#token("2","Int"))``),_0,_1) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(DotVar2,_2),#match(`<state>`(DotVar2,`<k>`(#repeat(B)~>Rest),`<env>`(ENV),`<store>`(STORE),`<stack>`(STACK),`<write>`(WRITE),`<timer>`(TIMER),`<indexes>`(#indexes(A,C))),`Map:lookup`(_2,DotVar2))),#match(DotVar1,`_[_<-undef]`(_2,DotVar2))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(TIMER),isInt(A)),isBlock(B)),isInt(NS)),isInt(C)),isMap(ENV)),isK(Rest)),isMap(STORE)),isSet(WRITE)),isList(STACK))) ensures #token("true","Bool") [UNIQUE_ID(aaa3ae54fa6646a92b8281a5db54ec9dca33db71581b8af302c00d5bed9edfde) contentStartColumn(6) contentStartLine(43) org.kframework.attributes.Location(Location(43,6,72,13)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_13_1747) as e98 when guard < 76 -> (let e = ((evalMap'Coln'lookup((var_0_1732),e98) config (-1))) in match e with 
| [Bottom] -> (stepElt 76)
| (KApply8(Lbl'_LT_'state'_GT_',(var_13_1748),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'repeat,(var_4_1749 :: [])) :: var_5_1750)) :: []),(KApply1(Lbl'_LT_'env'_GT_',((Map (SortMap,_,_) as var_6_1751) :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',((Map (SortMap,_,_) as var_7_1752) :: [])) :: []),(KApply1(Lbl'_LT_'stack'_GT_',((List (SortList,_,_) as var_8_1753) :: [])) :: []),(KApply1(Lbl'_LT_'write'_GT_',((Set (SortSet,_,_) as var_9_1754) :: [])) :: []),(KApply1(Lbl'_LT_'timer'_GT_',((Int _ as var_10_1755) :: [])) :: []),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,((Int _ as var_11_1756) :: []),((Int _ as var_12_1757) :: [])) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_1732),e98) config (-1))) in match e with 
| [Bottom] -> (stepElt 76)
| ((Map (SortStateCellMap,_,_) as var_14_1758) :: []) when ((((((true) && (true))) && (true))) && (((((((((((((((((((true) && (true))) && ((isTrue (evalisBlock((var_4_1749 :: [])) config (-1)))))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true)))) && (((compare var_13_1748 var_13_1747) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((eval_StateCellMap_(((eval_StateCellMap_(((evalStateCellMapItem((KApply1(Lbl'_LT_'index'_GT_',(var_1_1733 :: [])) :: []),(KApply8(Lbl'_LT_'state'_GT_',(KApply1(Lbl'_LT_'index'_GT_',(var_1_1733 :: [])) :: []),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'compare,(KApply1(Lbl'Hash'repeat,(var_4_1749 :: [])) :: var_5_1750)) :: [])) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_6_1751 :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',(var_7_1752 :: [])) :: []),(KApply1(Lbl'_LT_'stack'_GT_',(var_8_1753 :: [])) :: []),(KApply1(Lbl'_LT_'write'_GT_',(var_9_1754 :: [])) :: []),(KApply1(Lbl'_LT_'timer'_GT_',(var_10_1755 :: [])) :: []),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,(var_11_1756 :: []),(var_12_1757 :: [])) :: [])) :: [])) :: [])) config (-1))),((evalStateCellMapItem((KApply1(Lbl'_LT_'index'_GT_',((eval_'Plus'Int_((var_1_1733 :: []),((Lazy.force int1) :: [])) config (-1)))) :: []),(KApply8(Lbl'_LT_'state'_GT_',(KApply1(Lbl'_LT_'index'_GT_',((eval_'Plus'Int_((var_1_1733 :: []),((Lazy.force int1) :: [])) config (-1)))) :: []),(KApply1(Lbl'_LT_'k'_GT_',(var_5_1750)) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_6_1751 :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',(var_7_1752 :: [])) :: []),(KApply1(Lbl'_LT_'stack'_GT_',(var_8_1753 :: [])) :: []),(KApply1(Lbl'_LT_'write'_GT_',(var_9_1754 :: [])) :: []),(KApply1(Lbl'_LT_'timer'_GT_',(var_10_1755 :: [])) :: []),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,(var_11_1756 :: []),(var_12_1757 :: [])) :: [])) :: [])) :: [])) config (-1)))) config (-1))),((evalStateCellMapItem(e98,(KApply8(Lbl'_LT_'state'_GT_',e98,(KApply1(Lbl'_LT_'k'_GT_',(var_4_1749 :: KApply1(Lbl'Hash'loopSep,((Lazy.force int0) :: [])) :: KApply1(Lbl'Hash'repeat,(var_4_1749 :: [])) :: var_5_1750)) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_6_1751 :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',(var_7_1752 :: [])) :: []),(KApply1(Lbl'_LT_'stack'_GT_',(var_8_1753 :: [])) :: []),(KApply1(Lbl'_LT_'write'_GT_',(var_9_1754 :: [])) :: []),(KApply1(Lbl'_LT_'timer'_GT_',(var_10_1755 :: [])) :: []),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,(var_11_1756 :: []),(var_12_1757 :: [])) :: [])) :: [])) :: [])) config (-1)))) config (-1))),(var_14_1758 :: [])) config (-1)))) :: []),(KApply1(Lbl'_LT_'nstate'_GT_',((eval_'Plus'Int_((var_1_1733 :: []),((Lazy.force int2) :: [])) config (-1)))) :: []),(var_2_1734),(var_3_1735)) :: [])), (StepFunc step))| _ -> (stepElt 76))| _ -> (stepElt 76))
(*{| rule `<T>`(`<states>`(``_2=>`_StateCellMap_`(`_StateCellMap_`(`StateCellMapItem`(`<index>`(NS),`<state>`(`<index>`(NS),`<k>`(B~>Rest),`<env>`(ENV),`<store>`(STORE),`<stack>`(STACK),`<write>`(WRITE),`<timer>`(TIMER),`<indexes>`(#indexes(A,C)))),`StateCellMapItem`(DotVar2,`<state>`(DotVar2,`<k>`(#secondBranch(Bs)~>Rest),`<env>`(ENV),`<store>`(STORE),`<stack>`(STACK),`<write>`(WRITE),`<timer>`(TIMER),`<indexes>`(#indexes(A,C))))),DotVar1)``),`<nstate>`(``NS=>`_+Int_`(NS,#token("1","Int"))``),_0,_1) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(DotVar2,_2),#match(`<state>`(DotVar2,`<k>`(#secondBranch(`_,__OSL-SYNTAX`(B,Bs))~>Rest),`<env>`(ENV),`<store>`(STORE),`<stack>`(STACK),`<write>`(WRITE),`<timer>`(TIMER),`<indexes>`(#indexes(A,C))),`Map:lookup`(_2,DotVar2))),#match(DotVar1,`_[_<-undef]`(_2,DotVar2))),`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(isInt(A),isInt(TIMER)),isBlock(B)),isInt(NS)),isInt(C)),isMap(ENV)),isK(Rest)),isMap(STORE)),isSet(WRITE)),isList(STACK)),isBlocks(Bs))) ensures #token("true","Bool") [UNIQUE_ID(e95ab020aa5cec3108d66467300b5ec04bc245ef9b3afe25ff6891290a6889e1) contentStartColumn(6) contentStartLine(20) org.kframework.attributes.Location(Location(20,6,39,12)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
| (var_13_1759) as e99 when guard < 77 -> (let e = ((evalMap'Coln'lookup((var_0_1732),e99) config (-1))) in match e with 
| [Bottom] -> (stepElt 77)
| (KApply8(Lbl'_LT_'state'_GT_',(var_13_1760),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'secondBranch,(KApply2(Lbl_'Comm'__OSL'Hyph'SYNTAX,(var_4_1761 :: []),(var_14_1762 :: [])) :: [])) :: var_5_1763)) :: []),(KApply1(Lbl'_LT_'env'_GT_',((Map (SortMap,_,_) as var_6_1764) :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',((Map (SortMap,_,_) as var_7_1765) :: [])) :: []),(KApply1(Lbl'_LT_'stack'_GT_',((List (SortList,_,_) as var_8_1766) :: [])) :: []),(KApply1(Lbl'_LT_'write'_GT_',((Set (SortSet,_,_) as var_9_1767) :: [])) :: []),(KApply1(Lbl'_LT_'timer'_GT_',((Int _ as var_10_1768) :: [])) :: []),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,((Int _ as var_11_1769) :: []),((Int _ as var_12_1770) :: [])) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_1732),e99) config (-1))) in match e with 
| [Bottom] -> (stepElt 77)
| ((Map (SortStateCellMap,_,_) as var_15_1771) :: []) when ((((((true) && (true))) && (true))) && (((((((((((((((((((((true) && (true))) && ((isTrue (evalisBlock((var_4_1761 :: [])) config (-1)))))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && (true))) && ((isTrue (evalisBlocks((var_14_1762 :: [])) config (-1))))))) && (((compare var_13_1760 var_13_1759) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((eval_StateCellMap_(((evalStateCellMapItem((KApply1(Lbl'_LT_'index'_GT_',(var_1_1733 :: [])) :: []),(KApply8(Lbl'_LT_'state'_GT_',(KApply1(Lbl'_LT_'index'_GT_',(var_1_1733 :: [])) :: []),(KApply1(Lbl'_LT_'k'_GT_',(var_4_1761 :: var_5_1763)) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_6_1764 :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',(var_7_1765 :: [])) :: []),(KApply1(Lbl'_LT_'stack'_GT_',(var_8_1766 :: [])) :: []),(KApply1(Lbl'_LT_'write'_GT_',(var_9_1767 :: [])) :: []),(KApply1(Lbl'_LT_'timer'_GT_',(var_10_1768 :: [])) :: []),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,(var_11_1769 :: []),(var_12_1770 :: [])) :: [])) :: [])) :: [])) config (-1))),((evalStateCellMapItem(e99,(KApply8(Lbl'_LT_'state'_GT_',e99,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'secondBranch,(var_14_1762 :: [])) :: var_5_1763)) :: []),(KApply1(Lbl'_LT_'env'_GT_',(var_6_1764 :: [])) :: []),(KApply1(Lbl'_LT_'store'_GT_',(var_7_1765 :: [])) :: []),(KApply1(Lbl'_LT_'stack'_GT_',(var_8_1766 :: [])) :: []),(KApply1(Lbl'_LT_'write'_GT_',(var_9_1767 :: [])) :: []),(KApply1(Lbl'_LT_'timer'_GT_',(var_10_1768 :: [])) :: []),(KApply1(Lbl'_LT_'indexes'_GT_',(KApply2(Lbl'Hash'indexes,(var_11_1769 :: []),(var_12_1770 :: [])) :: [])) :: [])) :: [])) config (-1)))) config (-1))),(var_15_1771 :: [])) config (-1)))) :: []),(KApply1(Lbl'_LT_'nstate'_GT_',((eval_'Plus'Int_((var_1_1733 :: []),((Lazy.force int1) :: [])) config (-1)))) :: []),(var_2_1734),(var_3_1735)) :: [])), (StepFunc step))| _ -> (stepElt 77))| _ -> (stepElt 77))
| _ -> (interned_bottom, (StepFunc step))) else (result, f) in stepElt guard) collection (interned_bottom, (StepFunc step))) in if choice == interned_bottom then (lookups_step c config 77) else (choice, f)| _ -> (lookups_step c config 77))
| (KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',(var_0_1772)) :: []),(var_1_1773),(KApply1(Lbl'_LT_'tmp'_GT_',((List (SortList, Lbl_List_, (var_2_1774 :: []) :: var_3_1775)) :: [])) :: []),(var_4_1776)) :: []) when guard < 78(*{| rule `<T>`(`<states>`(``_9=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(B~>DotVar4),_1,_2,_3,_4,_5,_6)),DotVar2)``),_7,`<tmp>`(`` `_List_`(`ListItem`(B),DotVar1)=>`_List_`(`.List`(.KList),DotVar1)``),_8) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_9),#match(`<state>`(_0,`<k>`(#secondBranch(`.List{"_,__OSL-SYNTAX"}`(.KList))~>DotVar4),_1,_2,_3,_4,_5,_6),`Map:lookup`(_9,_0))),#match(DotVar2,`_[_<-undef]`(_9,_0))),isKItem(B)) ensures #token("true","Bool") [UNIQUE_ID(559e061ba495af3ae2f7053457741e8bb1a7a2fbc86b4abb8c07c7a8c0fee299) contentStartColumn(6) contentStartLine(16) org.kframework.attributes.Location(Location(16,6,17,43)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
 -> (match (var_0_1772) with 
| [Map (_,_,collection)] -> let (choice, f) = (KMap.fold (fun e v (result, f) -> if result == interned_bottom then (match e with | (var_5_1777) as e100 -> (let e = ((evalMap'Coln'lookup((var_0_1772),e100) config (-1))) in match e with 
| [Bottom] -> (interned_bottom, (StepFunc step))
| (KApply8(Lbl'_LT_'state'_GT_',(var_5_1778),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'secondBranch,(KApply0(Lbl'Stop'List'LBraQuot'_'Comm'__OSL'Hyph'SYNTAX'QuotRBra') :: [])) :: var_6_1779)) :: []),(var_7_1780),(var_8_1781),(var_9_1782),(var_10_1783),(var_11_1784),(var_12_1785)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_1772),e100) config (-1))) in match e with 
| [Bottom] -> (interned_bottom, (StepFunc step))
| ((Map (SortStateCellMap,_,_) as var_13_1786) :: []) when ((((((true) && (true))) && (true))) && (true)) && (((compare var_5_1777 var_5_1778) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e100,(KApply8(Lbl'_LT_'state'_GT_',e100,(KApply1(Lbl'_LT_'k'_GT_',(var_2_1774 :: var_6_1779)) :: []),(var_7_1780),(var_8_1781),(var_9_1782),(var_10_1783),(var_11_1784),(var_12_1785)) :: [])) config (-1))),(var_13_1786 :: [])) config (-1)))) :: []),(var_1_1773),(KApply1(Lbl'_LT_'tmp'_GT_',((eval_List_(((Lazy.force const'Stop'List)),((List (SortList, Lbl_List_, var_3_1775)) :: [])) config (-1)))) :: []),(var_4_1776)) :: [])), (StepFunc step))| _ -> (interned_bottom, (StepFunc step)))| _ -> (interned_bottom, (StepFunc step)))| _ -> (interned_bottom, (StepFunc step))) else (result, f)) collection (interned_bottom, (StepFunc step))) in if choice == interned_bottom then (lookups_step c config 78) else (choice, f)| _ -> (lookups_step c config 78))
| (KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',(var_0_1787)) :: []),(var_1_1788),(KApply1(Lbl'_LT_'tmp'_GT_',((List (SortList,_,_) as var_2_1789) :: [])) :: []),(var_3_1790)) :: []) when guard < 79(*{| rule `<T>`(`<states>`(``_9=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#secondBranch(Bs)~>DotVar4),_1,_2,_3,_4,_5,_6)),DotVar2)``),_7,`<tmp>`(``DotVar1=>`_List_`(`ListItem`(B),DotVar1)``),_8) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_9),#match(`<state>`(_0,`<k>`(#branch(`_,__OSL-SYNTAX`(B,Bs))~>DotVar4),_1,_2,_3,_4,_5,_6),`Map:lookup`(_9,_0))),#match(DotVar2,`_[_<-undef]`(_9,_0))),`_andBool_`(isBlock(B),isBlocks(Bs))) ensures #token("true","Bool") [UNIQUE_ID(2035f34c6e27b4f72cafe442a232e9951cb299a35b1b66ab5a328ffc1a79a29d) contentStartColumn(6) contentStartLine(12) org.kframework.attributes.Location(Location(12,6,13,43)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/control.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
 -> (match (var_0_1787) with 
| [Map (_,_,collection)] -> let (choice, f) = (KMap.fold (fun e v (result, f) -> if result == interned_bottom then (match e with | (var_4_1791) as e101 -> (let e = ((evalMap'Coln'lookup((var_0_1787),e101) config (-1))) in match e with 
| [Bottom] -> (interned_bottom, (StepFunc step))
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1792),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'branch,(KApply2(Lbl_'Comm'__OSL'Hyph'SYNTAX,(var_14_1793 :: []),(var_5_1794 :: [])) :: [])) :: var_6_1795)) :: []),(var_7_1796),(var_8_1797),(var_9_1798),(var_10_1799),(var_11_1800),(var_12_1801)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_1787),e101) config (-1))) in match e with 
| [Bottom] -> (interned_bottom, (StepFunc step))
| ((Map (SortStateCellMap,_,_) as var_13_1802) :: []) when ((((((true) && (true))) && (true))) && ((((isTrue (evalisBlock((var_14_1793 :: [])) config (-1)))) && ((isTrue (evalisBlocks((var_5_1794 :: [])) config (-1))))))) && (((compare var_4_1791 var_4_1792) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e101,(KApply8(Lbl'_LT_'state'_GT_',e101,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'secondBranch,(var_5_1794 :: [])) :: var_6_1795)) :: []),(var_7_1796),(var_8_1797),(var_9_1798),(var_10_1799),(var_11_1800),(var_12_1801)) :: [])) config (-1))),(var_13_1802 :: [])) config (-1)))) :: []),(var_1_1788),(KApply1(Lbl'_LT_'tmp'_GT_',((eval_List_(((evalListItem((var_14_1793 :: [])) config (-1))),(var_2_1789 :: [])) config (-1)))) :: []),(var_3_1790)) :: [])), (StepFunc step))| _ -> (interned_bottom, (StepFunc step)))| _ -> (interned_bottom, (StepFunc step)))| _ -> (interned_bottom, (StepFunc step))) else (result, f)) collection (interned_bottom, (StepFunc step))) in if choice == interned_bottom then (lookups_step c config 79) else (choice, f)| _ -> (lookups_step c config 79))
| (KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',(var_0_1803)) :: []),(var_1_1804),(var_2_1805),(KApply1(Lbl'_LT_'funDefs'_GT_',(var_3_1806)) :: [])) :: []) when guard < 80(*{| rule `<T>`(`<states>`(``_9=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#block(#bindParams(Ps,Es,SS))~>`#void_OSL-SYNTAX`(.KList)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,`<funDefs>`(_10)) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_9),#match(`<state>`(_0,`<k>`(#FnCall(F,Es)~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_9,_0))),#match(`<funDef>`(`<fname>`(F),`<fparams>`(Ps),DotVar5,`<fbody>`(#block(SS))),`Map:lookup`(_10,`<fname>`(F)))),#match(DotVar1,`_[_<-undef]`(_9,_0))),#match(DotVar4,`_[_<-undef]`(_10,`<fname>`(F)))),`_andBool_`(`_andBool_`(`_andBool_`(isExps(Es),isId(F)),isStmts(SS)),isParameters(Ps))) ensures #token("true","Bool") [UNIQUE_ID(0d4082e8ca976614d2aff35b40688c56c02f43f5ce14377a32a8d8605a40937d) contentStartColumn(6) contentStartLine(25) org.kframework.attributes.Location(Location(25,6,28,35)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/call.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
 -> (match (var_0_1803) with 
| [Map (_,_,collection)] -> let (choice, f) = (KMap.fold (fun e v (result, f) -> if result == interned_bottom then (match e with | (var_4_1807) as e102 -> (let e = ((evalMap'Coln'lookup((var_0_1803),e102) config (-1))) in match e with 
| [Bottom] -> (interned_bottom, (StepFunc step))
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1808),(KApply1(Lbl'_LT_'k'_GT_',(KApply2(Lbl'Hash'FnCall,(var_16_1809 :: []),(var_6_1810 :: [])) :: var_8_1811)) :: []),(var_9_1812),(var_10_1813),(var_11_1814),(var_12_1815),(var_13_1816),(var_14_1817)) :: []) -> (let e = ((evalMap'Coln'lookup((var_3_1806),(KApply1(Lbl'_LT_'fname'_GT_',(var_16_1809 :: [])) :: [])) config (-1))) in match e with 
| [Bottom] -> (interned_bottom, (StepFunc step))
| (KApply4(Lbl'_LT_'funDef'_GT_',(KApply1(Lbl'_LT_'fname'_GT_',(var_16_1818 :: [])) :: []),(KApply1(Lbl'_LT_'fparams'_GT_',(var_5_1819 :: [])) :: []),(var_17_1820),(KApply1(Lbl'_LT_'fbody'_GT_',(KApply1(Lbl'Hash'block,(var_7_1821 :: [])) :: [])) :: [])) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_1803),e102) config (-1))) in match e with 
| [Bottom] -> (interned_bottom, (StepFunc step))
| ((Map (SortStateCellMap,_,_) as var_15_1822) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_3_1806),(KApply1(Lbl'_LT_'fname'_GT_',(var_16_1818 :: [])) :: [])) config (-1))) in match e with 
| [Bottom] -> (interned_bottom, (StepFunc step))
| ((Map (SortFunDefCellMap,_,_) as var_18_1823) :: []) when ((((((((((true) && (true))) && (true))) && (true))) && (true))) && ((((((((isTrue (evalisExps((var_6_1810 :: [])) config (-1)))) && ((isTrue (evalisId((var_16_1818 :: [])) config (-1)))))) && ((isTrue (evalisStmts((var_7_1821 :: [])) config (-1)))))) && ((isTrue (evalisParameters((var_5_1819 :: [])) config (-1))))))) && (((compare_kitem var_16_1818 var_16_1809) = 0) && ((compare var_4_1807 var_4_1808) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e102,(KApply8(Lbl'_LT_'state'_GT_',e102,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'block,((eval'Hash'bindParams((var_5_1819 :: []),(var_6_1810 :: []),(var_7_1821 :: [])) config (-1)))) :: const'Hash'void_OSL'Hyph'SYNTAX :: var_8_1811)) :: []),(var_9_1812),(var_10_1813),(var_11_1814),(var_12_1815),(var_13_1816),(var_14_1817)) :: [])) config (-1))),(var_15_1822 :: [])) config (-1)))) :: []),(var_1_1804),(var_2_1805),(KApply1(Lbl'_LT_'funDefs'_GT_',(var_3_1806)) :: [])) :: [])), (StepFunc step))| _ -> (interned_bottom, (StepFunc step)))| _ -> (interned_bottom, (StepFunc step)))| _ -> (interned_bottom, (StepFunc step)))| _ -> (interned_bottom, (StepFunc step)))| _ -> (interned_bottom, (StepFunc step))) else (result, f)) collection (interned_bottom, (StepFunc step))) in if choice == interned_bottom then (lookups_step c config 80) else (choice, f)| _ -> (lookups_step c config 80))
| (KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',(var_0_1824)) :: []),(var_1_1825),(var_2_1826),(KApply1(Lbl'_LT_'funDefs'_GT_',(var_3_1827)) :: [])) :: []) when guard < 81(*{| rule `<T>`(`<states>`(``_9=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,`<funDefs>`(``_10=>`_FunDefCellMap_`(`FunDefCellMapItem`(`<fname>`(F),`<funDef>`(`<fname>`(F),`<fparams>`(Ps),`<fret>`(T),`<fbody>`(B))),DotVar4)``)) requires `_andBool_`(`_andBool_`(`_andBool_`(`_andBool_`(#match(DotVar4,_10),#mapChoice(_0,_9)),#match(`<state>`(_0,`<k>`(`_;_OSL-SYNTAX`(#function(F,Ps,T,B))~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_9,_0))),#match(DotVar1,`_[_<-undef]`(_9,_0))),`_andBool_`(`_andBool_`(`_andBool_`(isBlock(B),isId(F)),isType(T)),isParameters(Ps))) ensures #token("true","Bool") [UNIQUE_ID(b66173926aa9bf5458fca11319b6799edb468829f9689a339c4a0a265c80d93b) contentStartColumn(6) contentStartLine(11) org.kframework.attributes.Location(Location(11,6,18,17)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/call.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
 -> (let e = (var_3_1827) in match e with 
| [Bottom] -> (lookups_step c config 81)
| ((Map (SortFunDefCellMap,_,_) as var_17_1828) :: []) -> (match (var_0_1824) with 
| [Map (_,_,collection)] -> let (choice, f) = (KMap.fold (fun e v (result, f) -> if result == interned_bottom then (match e with | (var_4_1829) as e103 -> (let e = ((evalMap'Coln'lookup((var_0_1824),e103) config (-1))) in match e with 
| [Bottom] -> (interned_bottom, (StepFunc step))
| (KApply8(Lbl'_LT_'state'_GT_',(var_4_1830),(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl_'SCln'_OSL'Hyph'SYNTAX,(KApply4(Lbl'Hash'function,(var_13_1831 :: []),(var_14_1832 :: []),(var_15_1833 :: []),(var_16_1834 :: [])) :: [])) :: var_5_1835)) :: []),(var_6_1836),(var_7_1837),(var_8_1838),(var_9_1839),(var_10_1840),(var_11_1841)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_0_1824),e103) config (-1))) in match e with 
| [Bottom] -> (interned_bottom, (StepFunc step))
| ((Map (SortStateCellMap,_,_) as var_12_1842) :: []) when ((((((((true) && (true))) && (true))) && (true))) && ((((((((isTrue (evalisBlock((var_16_1834 :: [])) config (-1)))) && ((isTrue (evalisId((var_13_1831 :: [])) config (-1)))))) && ((isTrue (evalisType((var_15_1833 :: [])) config (-1)))))) && ((isTrue (evalisParameters((var_14_1832 :: [])) config (-1))))))) && (((compare var_4_1829 var_4_1830) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e103,(KApply8(Lbl'_LT_'state'_GT_',e103,(KApply1(Lbl'_LT_'k'_GT_',(var_5_1835)) :: []),(var_6_1836),(var_7_1837),(var_8_1838),(var_9_1839),(var_10_1840),(var_11_1841)) :: [])) config (-1))),(var_12_1842 :: [])) config (-1)))) :: []),(var_1_1825),(var_2_1826),(KApply1(Lbl'_LT_'funDefs'_GT_',((eval_FunDefCellMap_(((evalFunDefCellMapItem((KApply1(Lbl'_LT_'fname'_GT_',(var_13_1831 :: [])) :: []),(KApply4(Lbl'_LT_'funDef'_GT_',(KApply1(Lbl'_LT_'fname'_GT_',(var_13_1831 :: [])) :: []),(KApply1(Lbl'_LT_'fparams'_GT_',(var_14_1832 :: [])) :: []),(KApply1(Lbl'_LT_'fret'_GT_',(var_15_1833 :: [])) :: []),(KApply1(Lbl'_LT_'fbody'_GT_',(var_16_1834 :: [])) :: [])) :: [])) config (-1))),(var_17_1828 :: [])) config (-1)))) :: [])) :: [])), (StepFunc step))| _ -> (interned_bottom, (StepFunc step)))| _ -> (interned_bottom, (StepFunc step)))| _ -> (interned_bottom, (StepFunc step))) else (result, f)) collection (interned_bottom, (StepFunc step))) in if choice == interned_bottom then (lookups_step c config 81) else (choice, f)| _ -> (lookups_step c config 81))| _ -> (lookups_step c config 81))
| (KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',(var_10_1843)) :: []),(var_7_1844),(var_8_1845),(var_9_1846)) :: []) when guard < 82(*{| rule `<T>`(`<states>`(``_10=>`_StateCellMap_`(`StateCellMapItem`(_0,`<state>`(_0,`<k>`(#read(X)~>DotVar3),_1,_2,_3,_4,_5,_6)),DotVar1)``),_7,_8,_9) requires `_andBool_`(`_andBool_`(`_andBool_`(#mapChoice(_0,_10),#match(`<state>`(_0,`<k>`(X~>DotVar3),_1,_2,_3,_4,_5,_6),`Map:lookup`(_10,_0))),#match(DotVar1,`_[_<-undef]`(_10,_0))),isId(X)) ensures #token("true","Bool") [UNIQUE_ID(eb0440173ab96786ccc8e1d34b35497cdf7aaf288b45371e829649f8905e656a) contentStartColumn(6) contentStartLine(164) org.kframework.attributes.Location(Location(164,6,164,21)) org.kframework.attributes.Source(Source(/home/user/workspace/ownership-language-osl/model/./osl.k)) org.kframework.definition.Production(syntax RuleContent ::= K)]|}*)
 -> (match (var_10_1843) with 
| [Map (_,_,collection)] -> let (choice, f) = (KMap.fold (fun e v (result, f) -> if result == interned_bottom then (match e with | (var_0_1847) as e104 -> (let e = ((evalMap'Coln'lookup((var_10_1843),e104) config (-1))) in match e with 
| [Bottom] -> (interned_bottom, (StepFunc step))
| (KApply8(Lbl'_LT_'state'_GT_',(var_0_1848),(KApply1(Lbl'_LT_'k'_GT_',(varX_1849 :: varDotVar3_1850)) :: []),(var_1_1851),(var_2_1852),(var_3_1853),(var_4_1854),(var_5_1855),(var_6_1856)) :: []) -> (let e = ((eval_'LSqB'_'_LT_Hyph'undef'RSqB'((var_10_1843),e104) config (-1))) in match e with 
| [Bottom] -> (interned_bottom, (StepFunc step))
| ((Map (SortStateCellMap,_,_) as varDotVar1_1857) :: []) when ((((((true) && (true))) && (true))) && ((isTrue (evalisId((varX_1849 :: [])) config (-1))))) && (((compare var_0_1847 var_0_1848) = 0) && true) -> (((KApply4(Lbl'_LT_'T'_GT_',(KApply1(Lbl'_LT_'states'_GT_',((eval_StateCellMap_(((evalStateCellMapItem(e104,(KApply8(Lbl'_LT_'state'_GT_',e104,(KApply1(Lbl'_LT_'k'_GT_',(KApply1(Lbl'Hash'read,(varX_1849 :: [])) :: varDotVar3_1850)) :: []),(var_1_1851),(var_2_1852),(var_3_1853),(var_4_1854),(var_5_1855),(var_6_1856)) :: [])) config (-1))),(varDotVar1_1857 :: [])) config (-1)))) :: []),(var_7_1844),(var_8_1845),(var_9_1846)) :: [])), (StepFunc step))| _ -> (interned_bottom, (StepFunc step)))| _ -> (interned_bottom, (StepFunc step)))| _ -> (interned_bottom, (StepFunc step))) else (result, f)) collection (interned_bottom, (StepFunc step))) in if choice == interned_bottom then (lookups_step c config 82) else (choice, f)| _ -> (lookups_step c config 82))
| _ -> raise (Stuck c)
let make_stuck (config: k) : k = config
let make_unstuck (config: k) : k = config
let get_thread_set (config: k) : k = [Map(SortMap,Lbl_Map_,KMap.empty)]
let set_thread_set (config: k) (set: k) : k = config
end
let () = Plugin.the_definition := Some (module Def)
