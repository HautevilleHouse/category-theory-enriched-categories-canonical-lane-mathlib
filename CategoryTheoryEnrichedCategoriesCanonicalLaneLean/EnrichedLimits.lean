import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryEnrichedCategoriesCanonicalLaneLean.EnrichedCategory

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure EnrichedLimitPackage {M : Type u} [MonoidalCategory M] (C : EnrichedCategoryPackage M) where
  diagram : Type w -> (C.object -> M) -> Prop
  limitObject : C.object
  universalProperty : ∀ (W : C.object), C.hom W limitObject ≅ (coneEnd W)
  coneEnd : (C.object -> M) -> M
  universalPropertyProof : Prop

structure EnrichedLimitEvidence {M : Type u} [MonoidalCategory M] {C : EnrichedCategoryPackage M} (L : EnrichedLimitPackage C) where
  universalPropertyProofClosed : L.universalPropertyProof

def EnrichedLimitClosed {M : Type u} [MonoidalCategory M] {C : EnrichedCategoryPackage M} (L : EnrichedLimitPackage C) : Prop :=
  L.universalPropertyProof

theorem enriched_limit_closed_from_evidence {M : Type u} [MonoidalCategory M] {C : EnrichedCategoryPackage M} (L : EnrichedLimitPackage C) (E : EnrichedLimitEvidence L) : EnrichedLimitClosed L := by
  exact E.universalPropertyProofClosed

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse
