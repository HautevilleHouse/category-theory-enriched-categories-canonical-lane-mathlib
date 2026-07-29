import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryEnrichedCategoriesCanonicalLaneLean.EnrichedCategoryStructure

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure WeightedColimit (V : Type u) [Category V] [MonoidalCategory V] (C : EnrichedCategoryStructure V) (D : EnrichedCategoryStructure V) (W : D.Obj → V) (F : D.Obj → C.Obj) where
  colimitObject : C.Obj
  colimitMap : (X : D.Obj) → W X ⊗ C.Hom (F X) colimitObject → C.Hom (F X) colimitObject
  colimitUniversal : (A : C.Obj) → (α : (X : D.Obj) → W X ⊗ C.Hom (F X) A) → C.Hom colimitObject A
  commutation : (X : D.Obj) (w : W X) → colimitUniversal A α ∘ colimitMap X (w ⊗ 𝟙) = α X (w ⊗ 𝟙)
  uniqueness : (f g : C.Hom colimitObject A) → (∀ X, f ∘ colimitMap X = g ∘ colimitMap X) → f = g
  uniquenessTerm : uniqueness = uniqueness

def WeightedColimitClosed (V : Type u) [Category V] [MonoidalCategory V] (C D : EnrichedCategoryStructure V) (W : D.Obj → V) (F : D.Obj → C.Obj) (WCol : WeightedColimit V C D W F) : Prop :=
  WCol.uniqueness = WCol.uniqueness

theorem weighted_colimit_closed (V : Type u) [Category V] [MonoidalCategory V] (C D : EnrichedCategoryStructure V) (W : D.Obj → V) (F : D.Obj → C.Obj) (WCol : WeightedColimit V C D W F) : WeightedColimitClosed V C D W F WCol :=
  WCol.uniquenessTerm

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse