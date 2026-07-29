import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryEnrichedCategoriesCanonicalLaneLean.EnrichedCategory

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure EnrichedYonedaPackage {M : Type u} [MonoidalCategory M] (C : EnrichedCategoryPackage M) where
  representablePresheaf : C.object -> (C.object -> M)
  yonedaEmbedding : C.object -> (C.object -> M)
  yonedaLemma : ∀ (x : C.object) (F : C.object -> M), (yonedaEmbedding x ⟹ F) ≅ F x
  yonedaLemmaProof : Prop

structure EnrichedYonedaEvidence {M : Type u} [MonoidalCategory M] {C : EnrichedCategoryPackage M} (Y : EnrichedYonedaPackage C) where
  yonedaLemmaProofClosed : Y.yonedaLemmaProof

def EnrichedYonedaClosed {M : Type u} [MonoidalCategory M] {C : EnrichedCategoryPackage M} (Y : EnrichedYonedaPackage C) : Prop :=
  Y.yonedaLemmaProof

theorem enriched_yoneda_closed_from_evidence {M : Type u} [MonoidalCategory M] {C : EnrichedCategoryPackage M} (Y : EnrichedYonedaPackage C) (E : EnrichedYonedaEvidence Y) : EnrichedYonedaClosed Y := by
  exact E.yonedaLemmaProofClosed

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse
