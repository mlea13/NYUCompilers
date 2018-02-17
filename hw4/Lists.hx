module hw4.Lists {

// @@ Syntax @@
token INT | [0-9]+;

sort List
    | ⟦ ⟨INT⟩ ⟨List⟩ ⟧
    | ⟦ { ⟨List⟩ }  ⟨List⟩ ⟧
    | ⟦ ⟧;

// @@ Semantic operations @@

sort Computed | scheme Mul(Computed, Computed);
Mul(#1, #2) → ⟦ $#1 * $#2 ⟧;

// 1.1 - Product
sort Computed | scheme Product(List) | scheme Product2(List, Computed);
Product(#) → Product2(#, ⟦ 1 ⟧);
Product2(⟦ ⟨INT#1⟩ ⟨List#2⟩ ⟧, #n) → Product2(#2, Mul(#1, #n));
Product2(⟦ { ⟨List#1⟩ } ⟨List#2⟩ ⟧, #n) → Mul(Product2(#1, ⟦ 1 ⟧), Product2(#2, #n));
Product2(⟦ ⟧, #n) → #n;
}
