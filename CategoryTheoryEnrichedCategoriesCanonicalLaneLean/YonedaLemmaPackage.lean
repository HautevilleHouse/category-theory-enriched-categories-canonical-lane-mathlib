import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure YonedaLemmaPackage (C : EnrichedCategoryObject) where
  presheafCategory : Type u
  yonedaEmbedding : C.carrier → presheafCategory
  fullyFaithful : Prop
  isomorphismsRepresented : Prop

structure YonedaLemmaEvidence (C : EnrichedCategoryObject) (Y : YonedaLemmaPackage C) where
  fullyFaithfulClosed : Y.fullyFaithful
  isomorphismsRepresentedClosed : Y.isomorphismsRepresented

def YonedaLemmaClosed (C : EnrichedCategoryObject) (Y : YonedaLemmaPackage C) : Prop :=
  Y.fullyFaithful ∧ Y.isomorphismsRepresented

theorem yoneda_lemma_closed_from_evidence (C : EnrichedCategoryObject) (Y : YonedaLemmaPackage C)
    (E : YonedaLemmaEvidence C Y) : YonedaLemmaClosed C Y := by
  exact And.intro E.fullyFaithfulClosed E.isomorphismsRepresentedClosed

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse