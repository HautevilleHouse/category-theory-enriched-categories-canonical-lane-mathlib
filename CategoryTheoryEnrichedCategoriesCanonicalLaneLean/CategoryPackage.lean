import CategoryTheoryEnrichedCategoriesCanonicalLaneLean.AdmissibleClass
import Mathlib.CategoryTheory.Basic

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure CategoryPackage where
  carrier : Type u
  morphism : carrier → carrier → Type v
  identity : ∀ X : carrier, morphism X X
  composition : ∀ {X Y Z : carrier}, morphism X Y → morphism Y Z → morphism X Z
  identity_left : ∀ {X Y : carrier} (f : morphism X Y), composition (identity X) f = f
  identity_right : ∀ {X Y : carrier} (f : morphism X Y), composition f (identity Y) = f
  associativity : ∀ {W X Y Z : carrier} (f : morphism W X) (g : morphism X Y) (h : morphism Y Z),
    composition (composition f g) h = composition f (composition g h)

structure CategoryEvidence (C : CategoryPackage) where
  identity_left_holds : C.identity_left
  identity_right_holds : C.identity_right
  associativity_holds : C.associativity

def CategoryClosed (C : CategoryPackage) : Prop :=
  (∀ {X Y} (f : C.morphism X Y), C.composition (C.identity X) f = f) ∧
  (∀ {X Y} (f : C.morphism X Y), C.composition f (C.identity Y) = f) ∧
  (∀ {W X Y Z} (f : C.morphism W X) (g : C.morphism X Y) (h : C.morphism Y Z),
    C.composition (C.composition f g) h = C.composition f (C.composition g h))

theorem category_closed_from_evidence (C : CategoryPackage) (E : CategoryEvidence C) :
    CategoryClosed C := by
  exact And.intro E.identity_left_holds (And.intro E.identity_right_holds E.associativity_holds)

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse