require "osl-syntax.k"
require "configuration.k"
require "control.k"
require "block.k"
require "call.k"


module OSL

import OSL-SYNTAX
import CONFIGURATION
import CONTROL
import BLOCK
import CALL


/************************* sequential 语句序列 *******************************/

rule S:Stmt Ss:Stmts => S ~> Ss
rule .Stmts => .


rule V:Value ~> .Stmts => V

rule V:Value ; => .

/************************* declaration and  allocation 所有权转移语义*******************************/
rule <k> decl X:Id ; => . ... </k>
     <env> Rho:Map => Rho[X <- N] </env>
     //<env> .Map => X |-> N ... </env>
     <store> .Map => N |-> #uninit ... </store>
     <stack> .List => ListItem( X ) ... </stack>
     <timer> TI:Int => TI +Int 1 </timer>
     <indexes> #indexes((N:Int => N +Int 1),_)  </indexes>

rule <k> newResource(Ps:Props) => #rs(Ps) ... </k>


/************************* transferring 所有权转移语义*******************************/

syntax Exp
       ::= #Transfer(K, Exp)  [strict]
	 | #TransferV(K,Exp)
	 | #Transferuninit(K, Exp) [strict(2)]


rule <k> transfer EF:Exp TX:Exp ; => #Transfer(#lv(EF),#lv(TX))
     	 	  	 	~> #increaseIndex ~> #increaseTimer ... </k>
     <timer> TR:Int  </timer>
     <env> ENV:Map </env>
     <write> .Set => SetItem(#writev(#wv(TX,ENV), TR)) ... </write>

rule <k> transfer #uninit TX:Exp ; => #Transferuninit(#uninit,#lv(TX))
                    ~> #increaseIndex ~> #increaseTimer ... </k>
     <timer> TR:Int  </timer>
     <env> ENV:Map </env>
     <write> .Set => SetItem(#writev(#wv(TX,ENV), TR)) ... </write>

//写操作集合W中的元素#write(l，t)，l由#wv(Exp,Map)计算得出
syntax WItem
       ::= #writev(Int,Int)

syntax Int
       ::= #wv(Exp,Map)		[function]

syntax Int
       ::= #unwrapVal(K)	[function]

rule #unwrapVal(V:Int) => V

rule #wv(X:Id, ENV:Map) => #unwrapVal(ENV[X])   //wv(x,E) = E(x), E为获取x的位置l
rule #wv(* E:Exp, ENV:Map) => #wv(E,ENV)   // wv(*x,E) = E(x), E为获取x的位置l

//rule #wv(E:Exp . I:Int, ENV:Map) => #wv(E, ENV) . I    //wv(x.i,E) = E(x).i, 获取结构体成员或数组索引的位置l


//<indexes>和<timer>增加
syntax IndexItem
       ::= "#increaseIndex"
         | "#increaseTimer"

rule <k> #increaseIndex => . ... </k>
     <indexes> #indexes((C:Int => C +Int 1), _:Int) </indexes>

rule <k> #increaseTimer => . ... </k>
     <timer> TIMER:Int => TIMER +Int 1 </timer>


//判断Prop是否属于Props集合
syntax Bool
       ::= #inProps(Prop, Props)			[function]

//P属于Ps
rule #inProps(P, #props(P, Ps)) => true
//当查找的元素P1不等于当前集合元素P，跳过
rule #inProps(P1, #props(P, Ps)) => #inProps(P1, Ps)
     requires P1 =/=K P
//若没有找到，则返回false
rule #inProps(P, .Props) => false


//将一个List转化为Set
syntax Set
       ::= #list2Set(List)              [function]
rule #list2Set(.List) => .Set
rule #list2Set(ListItem(E) L:List) => SetItem(E) #list2Set(L)

//查找Set是否存在一个引用
syntax Bool
       ::= #existRef(K,Set,Int)		[function]

//若当前S中元素为#rs(_)或者#uninit，跳过当前元素且继续查找下一个元素
rule #existRef(R:K, SetItem(#rs(_)) S:Set, C:Int) => #existRef(R, S, C)
rule #existRef(R:K, SetItem(#uninit) S:Set, C:Int) => #existRef(R, S, C)

//对同一资源位置存在另一个引用，且该引用的END时间C1>= C
rule #existRef(R:K, SetItem(#br(_,C1:Int,R)) S:Set, C:Int) => (C1 >=Int C) andBool true
//对非当前位置资源的引用，跳过当前元素且继续查找下一个元素
rule #existRef(R:K, SetItem(#br(_,C1:Int,R1)) S:Set, C:Int) => #existRef(R,S,C)
     requires R =/=K R1
//没有找到任何引用，返回false   
rule #existRef(_, .Set, _) => false


rule <k> #Transfer(#loc(F:Int), #loc(L:Int)) => #TransferV(#loc(F), #loc(L)) ... </k>
     <store> STORE:Map </store>
     <indexes> #indexes(C:Int, _:Int) </indexes>
     requires (notBool #existRef(#immRef(F), #list2Set(values(STORE)),C)) andBool
	      (notBool #existRef(#mutRef(F), #list2Set(values(STORE)),C))
	      
//
rule <k> #Transfer(#loc(F:Int), #loc(L:Int)) => #TransferV(#loc(F), #loc(L)) ... </k>
     <store> STORE:Map   </store>
     <indexes> #indexes(C:Int, _:Int) </indexes>
     requires (notBool #existRef(#immRef(F), #list2Set(values(STORE)),C)) andBool
	      (notBool #existRef(#mutRef(F), #list2Set(values(STORE)),C))

// 1. 规则transfer-resource
rule <k> #Transfer(#rs(R:Props), #loc(L)) => . ... </k>
     <store> ... L |-> (_ => #rs(R)) ... </store>

// transfer #uninit x;
rule <k> #Transferuninit(#uninit, #loc(L)) => . ... </k>
     <store> ... L |-> (_ => #uninit) ... </store>

// 2. 规则transfer-move，当copy不属于ps(即notBool #inProps(copy, PS))
rule <k> #TransferV(#loc(F), #loc(L)) => #Transfer(#rs(PS), #loc(L)) ... </k>
     <store> ... (F |-> #rs(PS)) => (F |-> #uninit)  ... </store>
     requires notBool #inProps(copy, PS)

// 3. 规则transfer-copy，当copy属于ps(即#inProps(copy, PS))
rule <k> #TransferV(#loc(F), #loc(L)) => #Transfer(#rs(PS), #loc(L)) ... </k>
     <store> ... F |-> #rs(PS:Props) ... </store>
     requires #inProps(copy, PS)

syntax Exp
       ::= #TransferIB(K,K)		[strict(1)]
         | #TransferMB(K,K)		[strict(1)]
	 | #uninitialize(Exp)

// 4. 规则transfer-shrref
rule <k> #TransferV(#loc(F), #loc(L)) => #TransferIB(read(#loc(F)), #loc(L)) ... </k>
     <store> ... F |-> #br(BEG,END,#immRef(L1)) ... </store>

rule <k> #TransferIB(#loc(F), #loc(L)) => . ... </k>
     <store> ... L |-> (_ => #br(C,C,#immRef(F))) ... </store>
     <indexes> #indexes(C:Int, _:Int) </indexes>

// 5. 规则transfer-mutref
rule <k> #TransferV(#loc(F), #loc(L)) =>
     	 		     	#TransferMB(read(#loc(F)), #loc(L)) ~>
				#uninitialize(#loc(F)) ... </k>
     <store> ... F |-> #br(BEG,END,#mutRef(L1)) ... </store>


rule <k> #TransferMB(#loc(F), #loc(L)) => . ... </k>
     <store> Rho:Map => Rho[L <- #br(C,C,#mutRef(F))] </store>
     <indexes> #indexes(C:Int, _:Int) </indexes>

rule <k> #uninitialize(#loc(F:Int)) => . ... </k>
     <store> ... F |-> (_ => #uninit) ... </store>

/************************* read读语义*******************************/


rule X:Id => read(X)

rule *X:Exp => read(X)

//读一个值为#rs(N:Props)的变量，返回#rs(N)
rule <k> read(X:Id) => read(#loc(L)) ... </k>
     <env> ... X |-> L:Int ...  </env>

rule <k> read(#loc(L:Int)) => #rs(N) ...  </k>
     <store> ... L |-> #rs(N:Props) ... </store>

//读取一个不可变引用的变量
rule <k> read(#loc(L:Int)) => #Read(#borrowImmCK(L,BEG,END,L1)) ~> #loc(L1) ...  </k>
     <store> ... L |-> #br(BEG:Int, END:Int, #immRef(L1:Int)) ... </store>

//读取一个可变引用的变量
rule <k> read(#loc(L:Int)) => #Read(#borrowMutCK(L,BEG,END,L1)) ~> #loc(L1) ...  </k>
     <store> ... L |-> #br(BEG:Int, END:Int, #mutRef(L1:Int)) ... </store>

//重复读取直至读到资源本身
syntax OItem
       ::= #Read(K)		[strict]

rule #Read(#loc(L:Int)) => #Read(read(#loc(L)))

rule #Read(#rs(R:Props)) => .



/************************* wl谓词语义*******************************/

//wl谓词，#writeCK(Int1, Int2, Int3, Set)，在Set中查找是否存在某个元素
//SetItem(#writev(L, T:Int))使的T>=Int2&&T<=Int3

syntax Bool
       ::= #writeCK(Int, Int, Int, Set)		[function]

//找到一个在时间段[B,E]内对L处存在的写操作
rule #writeCK(L:Int, B:Int, E:Int, SetItem(#writev(L, T:Int)) RestS:Set) => false
     requires (B <=Int T) andBool ( T <=Int E)

//若当前的元素中写操作地址L1 ！= L，跳过该元素对剩余的元素进行检查
rule #writeCK(L:Int, B:Int, E:Int, SetItem(#writev(L1, T:Int)) RestS:Set) => #writeCK(L,B,E, RestS)
     requires L =/=Int L1

//若当前的元素中T不在时间段[B,E]内，跳过该元素对剩余的元素进行检查
rule #writeCK(L:Int, B:Int, E:Int, SetItem(#writev(L, T:Int)) RestS:Set) => #writeCK(L,B,E, RestS)
     requires notBool((B <=Int T) andBool ( T <=Int E))

//查找完整个元素，若无发现，返回真
rule #writeCK(_,_,_,.Set) => true


/*****************************************************************/

rule <k> #borrowImmCK(L:Int, BEG:Int, END:Int, L1:Int) => #loc(L1) ... </k>
     <store> Rho:Map => Rho[L <- #br(BEG, TIMER, #immRef(L1))] </store>
     <indexes> #indexes(C:Int,_) </indexes>
     <timer> TIMER:Int </timer>
     <write> WRITE:Set </write>
     requires (#borrowimmck(L, Rho, BEG, TIMER , L1) ==Bool false) andBool
     	      (#writeCK(L1, BEG, TIMER,WRITE))

rule <k> #borrowMutCK(L:Int,BEG:Int, END:Int,L1:Int) => #loc(L1) ... </k>
     <store> Rho:Map => Rho[L <- #br(BEG, TIMER, #mutRef(L1))] </store>
     <indexes> #indexes(C:Int, _) </indexes>
     <timer> TIMER:Int </timer>
     <write> WRITE:Set </write>
     requires (#borrowmutck(L, Rho, BEG, TIMER , L1) ==Bool false) andBool
     	      (#writeCK(L1, BEG, TIMER,WRITE))
     	           

syntax Bool
       ::= #lc(Int,Int,Int,Int)				[function]
         | #borrowimmck(Int, Map, Int, Int, Int)	[function]
         | #borrowmutck(Int, Map, Int, Int, Int)	[function]

syntax OItem
       ::= #borrowImmCK(Int,Int,Int,Int)
         | #borrowMutCK(Int,Int,Int,Int)


// 谓词lc：#lc(L1,L2,L3,L4) = ( L1 < L3 <= L2) or (L1 < L4 <= L2),
// 引用r1的声明周期为[L1,L2]，引用r1的声明周期为[L3, L4], #lc表明r1和r2的生命周期有交集

rule #lc(L1:Int,L2:Int,L3:Int,L4:Int) => ((L1 <Int L3) andBool (L3 <=Int L2)) orBool
                             ((L1 <Int L4) andBool (L4 <=Int L2))

//若当前元素不为一个可变引用，均跳过该元素对剩余的元素进行检查
rule #borrowimmck(L4:Int, L |-> #rs(_) M:Map, L1:Int, L2:Int, L3:Int) => #borrowimmck(L4, M, L1, L2, L3)
rule #borrowimmck(L4:Int, L |-> #br(_,_,#immRef(_)) M:Map, L1:Int, L2:Int, L3:Int) => #borrowimmck(L4, M, L1, L2, L3)
rule #borrowimmck(L4:Int, L |-> #uninit M:Map, L1:Int, L2:Int, L3:Int) => #borrowimmck(L4, M, L1, L2, L3)

//存在一个不可变引用，但指向的资源不同(即L3 =/=Int L4)，跳过该元素对剩余的元素进行检查
rule #borrowimmck(L5:Int, L:Int |-> #br(_,_, #mutRef(L3:Int))  M:Map, L1:Int, L2:Int, L4:Int)
                 => #borrowimmck(L5, M, L1, L2, L4)
     requires L3 =/=Int L4

//存在一个不可变引用(即L5 =/=Int L)，但与当前引用不存在交集(即(#lc(L1, L2 , BEG , END) == false)，跳过该元素对剩余的元素进行检查
rule #borrowimmck(L5:Int, L:Int |-> #br(BEG:Int, END:Int, #mutRef(L3:Int))  M:Map, L1:Int, L2:Int, L3:Int)
                 =>  #borrowimmck(L5, M, L1, L2, L3)
     requires (L5 =/=Int L) andBool (#lc(L1, L2 , BEG , END) ==Bool false)

//存在一个不可变引用(即L5 =/=Int L)且与当前引用存有交集(即(#lc(L1, L2 , BEG , END))，返回真
rule #borrowimmck(L5:Int, L:Int |-> #br(BEG:Int, END:Int, #mutRef(L3:Int))  M:Map, L1:Int, L2:Int, L3:Int)
                 =>  true
     requires (L5 =/=Int L) andBool (#lc(L1, L2 , BEG , END) ==Bool true)

//若元素为当前引用相应的pair(即 L |-> #br)，跳过该元素对剩余的元素进行检查
rule #borrowimmck(L:Int, L |-> #br(BEG:Int, END:Int, #mutRef(L3:Int))  M:Map, L1:Int, L2:Int, L3:Int)
                 =>  #borrowimmck(L, M, L1, L2, L3)


//没有找到与当前引用有交集的一个可变引用
rule #borrowimmck(_,.Map, _,_,_) => false


//若当前元素不为一个引用，均跳过该元素对剩余的元素进行检查
rule #borrowmutck(L4:Int, L |-> #rs(_) M:Map, L1:Int, L2:Int, L3:Int)
                  => #borrowmutck(L4, M, L1, L2, L3)

rule #borrowmutck(L4:Int, (L:Int |-> #uninit) M:Map, L1:Int, L2:Int, L3:Int)
                  => #borrowmutck(L4, M, L1, L2, L3)

//若当前元素为一个不可变引用

// 1. 但指向的资源不同(即L5 =/=Int L3)，跳过该元素对剩余的元素进行检查
rule #borrowmutck(L4:Int, L |-> #br(_,_,#immRef(L5:Int)) M:Map, L1:Int, L2:Int, L3:Int)
                  => #borrowmutck(L4, M, L1, L2, L3)
     requires L5 =/=Int L3

// 2. 与当前引用不存在交集(即(#lc(L1, L2 , BEG , END) == false)，跳过该元素对剩余的元素进行检查
rule #borrowmutck(L5:Int, L |-> #br(BEG,END,#immRef(L3:Int)) M:Map, L1:Int, L2:Int, L3)
                  => #borrowmutck(L5, M, L1, L2, L3)
     requires (L5 =/=Int L) andBool (#lc(L1,L2,BEG,END) ==Bool false)

// 3. 且与当前引用存有交集(即(#lc(L1, L2 , BEG , END))，返回真
rule #borrowmutck(L5:Int, L |-> #br(BEG,END,#immRef(L3:Int)) M:Map, L1:Int, L2:Int, L3)
                  => true
     requires (L5 =/=Int L) andBool (#lc(L1,L2,BEG,END) ==Bool true)


//若当前元素为一个可变引用

// 1. 但指向的资源不同(即L3 =/=Int L4)，跳过该元素对剩余的元素进行检查
rule #borrowmutck(L5:Int, L:Int |-> #br(_,_, #mutRef(L3:Int))  M:Map, L1:Int, L2:Int, L4:Int)
                 => #borrowmutck(L5, M, L1, L2, L4)
     requires L3 =/=Int L4

// 2. 与当前引用不存在交集(即(#lc(L1, L2 , BEG , END) == false)，跳过该元素对剩余的元素进行检查
rule #borrowmutck(L5:Int, L:Int |-> #br(BEG:Int, END:Int, #mutRef(L3:Int))
                                 M:Map, L1:Int, L2:Int, L3:Int)
                  =>  #borrowmutck(L5, M, L1, L2, L3)
     requires (L5 =/=Int L) andBool (#lc(L1, L2 , BEG , END) ==Bool false)

// 3. 且与当前引用存有交集(即(#lc(L1, L2 , BEG , END))，返回真
rule #borrowmutck(L5:Int, L:Int |-> #br(BEG:Int, END:Int, #mutRef(L3:Int))
                                 M:Map, L1:Int, L2:Int, L3:Int)
                 =>  true
     requires (L5 =/=Int L) andBool (#lc(L1, L2 , BEG , END) ==Bool true)

//4. 若元素为当前引用相应的pair(即 L |-> #br)，跳过该元素对剩余的元素进行检查
rule #borrowmutck(L:Int, (L |-> #br(_,_,_)) M:Map, L1:Int, L2:Int, L3:Int)
                 =>  #borrowmutck(L, M, L1, L2, L3)

//没有找到与当前引用有交集的一个可变引用或可变引用
rule #borrowmutck(_,.Map, _,_,_) => false



/************************* lvalue 获取exp的内存地址值*******************************/

//当exp为资源时
rule #lv(newResource(Ps:Props)) => newResource(Ps)   

//当exp为变量时
rule <k> #lv(X:Id) => #loc(I) ...  </k>   
     <env> ... X |-> I:Int ...  </env>

//当exp为变量时
rule <k> #lv(X) => #loc(L)  ... </k>   
     <env> ... X |-> L:Int ... </env>

//当exp为地址时
rule #lv(#loc(L:Int)) => #loc(L)    

syntax Exp
       ::= #lvDref( Exp )	[strict]

rule #lv( * E:Exp ) => #lvDref(#lv(E))  

//当exp为不可变引用的解引用时
rule <k> #lvDref(#loc(L:Int)) => #borrowImmCK(L, BEG, END, L1) ... </k> 
       
 <store> ... L |-> #br(BEG:Int, END:Int, #immRef(L1:Int)) ... </store>   //首先确定解引用的位置L存储的是一个不可变指针，否则不正确 

//当exp为可变引用的解引用时
rule <k> #lvDref(#loc(L:Int)) => #borrowMutCK(L, BEG, END, L1) ... </k>  
     
 <store> ... L |-> #br(BEG:Int, END:Int, #mutRef(L1:Int)) ... </store>   //首先确定解引用的位置L存储的是一个可变指针，否则不正确 




/*************************borrow语义*********************************/

syntax Bool
       ::= #checkInit(Id, Map, Map)	[function]

//要求X的value在E和S下不为#uninit
rule #checkInit(X,E:Map, S:Map) => S[E[X]] =/=K #uninit


//不可变借用
rule <k> X:Id borrow Y:Id ; => . ... </k>
     <env>  ENV:Map  </env>
     <indexes> #indexes((C:Int => C +Int 1),_) </indexes>
     <store> ST:Map =>
     	     ST[#unwrapInt(ENV[X]) <-
	       #br(C,C, #immRef(#unwrapInt(ENV[Y])))] </store>
     <timer> TIMER:Int => TIMER +Int 1 </timer>
     requires #checkInit(Y,ENV,ST)   

     
//可变借用
rule <k> X:Id mborrow Y:Id ; => . ... </k>
     <env>  ENV:Map  </env>
     <store> ST:Map => ST[#unwrapInt(ENV[X]) <- 
            #br(C, C, #mutRef(#unwrapInt(ENV[Y])))] </store>
     <indexes> #indexes((C:Int => C +Int 1),_) </indexes>
     <timer> TIMER:Int => TIMER +Int 1 </timer>
     requires #checkInit(Y,ENV,ST)


syntax Int
       ::= #unwrapInt(K)	[function]

rule #unwrapInt(I:Int) => I


/*************************计算表达式exp的值 val(exp)*********************************/

rule val(V:Value) => V

/*************************deallocate语义*********************************/

syntax DItem
       ::= #Deallocate(Exp)		[strict]

     
rule deallocate E:Exp ; => #Deallocate(#lv(E))

rule <k> #Deallocate(#loc(L)) => . ...</k>
     <store> ... (L |-> V:Value) => (L |-> #uninit) ... </store>
     <timer> TR:Int  </timer>
     <env> ENV:Map </env>
     <write> .Set => SetItem(#writev(L, TR)) ... </write>

rule #Deallocate(#rs(Ps:Props)) => .
//rule #Deallocate(#uninit) => .

endmodule
