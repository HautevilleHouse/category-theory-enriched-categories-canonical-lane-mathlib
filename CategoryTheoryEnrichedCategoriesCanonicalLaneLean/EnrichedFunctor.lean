import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryEnrichedCategoriesCanonicalLaneLean.EnrichedCategoryBase

/-!
# Enriched Functors
-/

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

open CategoryTheory

structure EnrichedFunctor (C D : EnrichedCategoryObject) where
  onObjects : C.enrichedCategory → D.enrichedCategory
  onMorphisms : ∀ (X Y : C.enrichedCategory), C.baseMonoidal.Hom (C.homObject X Y) (D.homObject (onObjects X) (onObjects Y))
  respectsIdentity : Prop
  respectsComposition : Prop
  functoriality_condition : respectsIdentity ∧ respectsComposition

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse