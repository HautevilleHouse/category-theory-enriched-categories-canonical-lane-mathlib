import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure YonedaLemmaPackage {C : EnrichedCategoryPackage} where
  representation : Type u
  naturalIsomorphism : Prop
  yonedaEmbeddingFullyFaithful : Prop

structure YonedaLemmaEvidence {C : EnrichedCategoryPackage} (Y : YonedaLemmaPackage C) where
  naturalIsomorphismClosed : Y.naturalIsomorphism
  yonedaEmbeddingFullyFaithfulClosed : Y.yonedaEmbeddingFullyFaithful

def YonedaLemmaClosed {C : EnrichedCategoryPackage} (Y : YonedaLemmaPackage C) : Prop :=
  Y.naturalIsomorphism ∧ Y.yonedaEmbeddingFullyFaithful

theorem yoneda_lemma_closed_from_evidence {C : EnrichedCategoryPackage} (Y : YonedaLemmaPackage C) (ev : YonedaLemmaEvidence Y) :
    YonedaLemmaClosed Y := by
  exact And.intro ev.naturalIsomorphismClosed ev.yonedaEmbeddingFullyFaithfulClosed

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse