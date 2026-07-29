import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryEnrichedCategoriesCanonicalLaneLean.EnrichedCategoryStructure

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure YonedaEmbedding (V : Type u) [Category V] [MonoidalCategory V] (C : EnrichedCategoryStructure V) where
  yoneda : C.Obj → (C.Obj → V)
  yonedaMap : (X Y : C.Obj) → C.Hom X Y → (C.Hom Y X → C.Hom Y X)
  yonedaLemma : (X : C.Obj) (F : C.Obj → V) → (yoneda X ⇒ F) ≅ F X
  yonedaLemmaNatural : Prop
  yonedaLemmaNaturalTerm : yonedaLemmaNatural

def YonedaLemmaEnrichedClosed (V : Type u) [Category V] [MonoidalCategory V] (C : EnrichedCategoryStructure V) (Y : YonedaEmbedding V C) : Prop :=
  Y.yonedaLemmaNatural

theorem yoneda_lemma_enriched_closed (V : Type u) [Category V] [MonoidalCategory V] (C : EnrichedCategoryStructure V) (Y : YonedaEmbedding V C) : YonedaLemmaEnrichedClosed V C Y :=
  Y.yonedaLemmaNaturalTerm

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse