import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryEnrichedCategoriesCanonicalLaneLean.EnrichedCategoryDefinitions

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure YonedaLemmaPackage (V : MonoidalCategory) (C : EnrichedCategory V) where
  enrichedYonedaEmbedding : (X : C.obj) → EnrichedCategory V
  yonedaLemma : (X : C.obj) (F : EnrichedCategory V) → V.hom (C.hom X X) (F.obj) ≅ V.hom (C.hom X X) (F.obj)
  fullFaithfulness : Prop

structure YonedaEvidence (V : MonoidalCategory) (C : EnrichedCategory V) (Y : YonedaLemmaPackage V C) where
  yonedaLemmaClosed : Y.yonedaLemma
  fullFaithfulnessClosed : Y.fullFaithfulness

def YonedaClosed (V : MonoidalCategory) (C : EnrichedCategory V) (Y : YonedaLemmaPackage V C) : Prop :=
  Y.yonedaLemma ∧ Y.fullFaithfulness

theorem yoneda_closed_from_evidence (V : MonoidalCategory) (C : EnrichedCategory V) (Y : YonedaLemmaPackage V C) (E : YonedaEvidence V C Y) : YonedaClosed V C Y := by
  exact And.intro E.yonedaLemmaClosed E.fullFaithfulnessClosed

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse