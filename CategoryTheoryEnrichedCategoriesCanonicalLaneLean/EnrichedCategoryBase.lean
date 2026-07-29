import canonicalLaneMathlib.AdmissibleClass
import Mathlib.CategoryTheory.MonoidalCategory

/-!
# Enriched Category Base Objects
This module defines the fundamental structures for enriched categories over a monoidal category.
-/

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

open CategoryTheory

structure EnrichedCategoryObject where
  baseMonoidal : MonoidalCategory
  enrichedCategory : Type u
  homObject : enrichedCategory → enrichedCategory → baseMonoidal.Obj
  identity : ∀ (X : enrichedCategory), baseMonoidal.Hom (baseMonoidal.unit) (homObject X X)
  composition : ∀ (X Y Z : enrichedCategory), baseMonoidal.Hom (baseMonoidal.tensor (homObject Y Z) (homObject X Y)) (homObject X Z)
  associativity_condition : Prop
  unit_conditions : Prop
  conclusion : associativity_condition ∧ unit_conditions

def EnrichedCategoryWitnessClosed (O : EnrichedCategoryObject) : Prop :=
  O.associativity_condition ∧ O.unit_conditions

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse