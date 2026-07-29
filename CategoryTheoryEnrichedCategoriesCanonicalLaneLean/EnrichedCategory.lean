import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure EnrichedCategory (V : Type u) [MonoidalCategory V] where
  Obj : Type v
  hom : Obj → Obj → V
  id : ∀ (X : Obj), hom X X ⟶ monoidalUnit V
  comp : ∀ (X Y Z : Obj), hom Y Z ⊗ hom X Y ⟶ hom X Z
  idLeft : ∀ (X Y : Obj) (f : hom X Y), comp X X Y (id X ⊗ f) = (λ_ (hom X Y)).hom ∘ f
  idRight : ∀ (X Y : Obj) (f : hom X Y), comp X Y Y (f ⊗ id Y) = (ρ_ (hom X Y)).hom ∘ f
  assoc : ∀ (W X Y Z : Obj) (f : hom W X) (g : hom X Y) (h : hom Y Z),
    comp W X Z (comp X Y Z (g ⊗ f) ⊗ h) = comp W Y Z (h ⊗ comp W X Y (g ⊗ f)) ∘ α_ (hom Y Z) (hom X Y) (hom W X).hom

structure EnrichedCategoryEvidence (V : Type u) [MonoidalCategory V] (C : EnrichedCategory V) where
  objNonempty : Nonempty C.Obj
  homStructureClosed : Prop
  idClosed : ∀ (X : C.Obj), C.id X ≠ ⊥
  compClosed : ∀ (X Y Z : C.Obj) (f : C.hom X Y) (g : C.hom Y Z), C.comp X Y Z (g ⊗ f) ≠ ⊥

def EnrichedCategoryClosed (V : Type u) [MonoidalCategory V] (C : EnrichedCategory V) : Prop :=
  Nonempty C.Obj ∧ ∀ (X : C.Obj), C.id X ≠ ⊥ ∧ ∀ (X Y Z : C.Obj) (f : C.hom X Y) (g : C.hom Y Z), C.comp X Y Z (g ⊗ f) ≠ ⊥

theorem enriched_category_closed_from_evidence (V : Type u) [MonoidalCategory V] (C : EnrichedCategory V) (E : EnrichedCategoryEvidence V C) :
    EnrichedCategoryClosed V C := by
  refine And.intro E.objNonempty ?_
  intro X
  refine And.intro (E.idClosed X) ?_
  intro Y Z f g
  exact E.compClosed X Y Z f g

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse