import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryEnrichedCategoriesCanonicalLaneLean.EnrichedFunctor

/-!
# Enriched Natural Transformations
-/

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

open CategoryTheory

structure EnrichedNaturalTransformation {C D : EnrichedCategoryObject} (F G : EnrichedFunctor C D) where
  component : ∀ (X : C.enrichedCategory), C.baseMonoidal.Hom (C.baseMonoidal.unit) (D.homObject (F.onObjects X) (G.onObjects X))
  naturality_condition : Prop
  naturality_proof : naturality_condition

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse