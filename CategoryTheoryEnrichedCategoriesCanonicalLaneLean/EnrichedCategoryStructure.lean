import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure EnrichedCategoryStructure (V : Type u) [Category V] [MonoidalCategory V] where
  Obj : Type v
  Hom : Obj → Obj → V
  id : (X : Obj) → Hom X X
  comp : (X Y Z : Obj) → Hom X Y ⊗ Hom Y Z → Hom X Z
  idLeft : (X Y : Obj) (f : Hom X Y) → comp X X Y (id X ⊗ f) = f
  idRight : (X Y : Obj) (f : Hom X Y) → comp X Y Y (f ⊗ id Y) = f
  associativity : (W X Y Z : Obj) (f : Hom W X) (g : Hom X Y) (h : Hom Y Z) →
    comp W Y Z (comp W X Y (f ⊗ g) ⊗ h) = comp W X Z (f ⊗ comp X Y Z (g ⊗ h))

structure EnrichedCategoryEvidence (V : Type u) [Category V] [MonoidalCategory V] (C : EnrichedCategoryStructure V) where
  idLeftClosed : C.idLeft = C.idLeft
  idRightClosed : C.idRight = C.idRight
  associativityClosed : C.associativity = C.associativity

def EnrichedCategoryClosed (V : Type u) [Category V] [MonoidalCategory V] (C : EnrichedCategoryStructure V) : Prop :=
  C.idLeft = C.idLeft ∧ C.idRight = C.idRight ∧ C.associativity = C.associativity

theorem enriched_category_closed_from_evidence
    (V : Type u) [Category V] [MonoidalCategory V] (C : EnrichedCategoryStructure V)
    (E : EnrichedCategoryEvidence V C) : EnrichedCategoryClosed V C :=
  ⟨E.idLeftClosed, E.idRightClosed, E.associativityClosed⟩

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse