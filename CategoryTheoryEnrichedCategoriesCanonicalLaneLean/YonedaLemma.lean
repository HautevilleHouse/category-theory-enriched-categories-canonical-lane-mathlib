import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure EnrichedYonedaLemma (V : Type u) [MonoidalCategory V] (C : EnrichedCategory V) where
  presheafCategory : EnrichedCategory V
  yonedaEmbedding : C.Obj → presheafCategory.Obj
  yonedaLemma : ∀ (X : C.Obj) (F : presheafCategory.Obj), presheafCategory.hom (yonedaEmbedding X) F ≅ F.hom X
  naturality : Prop

def EnrichedYonedaClosed (V : Type u) [MonoidalCategory V] (C : EnrichedCategory V) (Y : EnrichedYonedaLemma V C) : Prop :=
  ∀ (X : C.Obj) (F : Y.presheafCategory.Obj), Nonempty (Y.presheafCategory.hom (Y.yonedaEmbedding X) F ≅ F.hom X) ∧ Y.naturality

structure EnrichedYonedaEvidence (V : Type u) [MonoidalCategory V] (C : EnrichedCategory V) (Y : EnrichedYonedaLemma V C) where
  yonedaClosed : EnrichedYonedaClosed V C Y

theorem yoneda_closed_from_evidence (V : Type u) [MonoidalCategory V] (C : EnrichedCategory V) (Y : EnrichedYonedaLemma V C) (E : EnrichedYonedaEvidence V C Y) :
    EnrichedYonedaClosed V C Y := E.yonedaClosed

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse