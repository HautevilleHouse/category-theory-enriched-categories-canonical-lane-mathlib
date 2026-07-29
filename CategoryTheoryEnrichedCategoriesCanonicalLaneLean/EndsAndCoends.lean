import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryEnrichedCategoriesCanonicalLaneLean.EnrichedCategoryStructure

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure Ends (V : Type u) [Category V] [MonoidalCategory V] (C : EnrichedCategoryStructure V) (F : C.Obj × C.Obj → V) where
  endObject : V
  dinatural : (X : C.Obj) → endObject → F (X, X)
  dinaturalCondition : (X Y : C.Obj) (f : C.Hom X Y) →
    F.map (f, 𝟙) ∘ dinatural X = F.map (𝟙, f) ∘ dinatural Y
  universalProperty : (W : V) (d : (X : C.Obj) → W → F (X, X)) → (dCondition : ...) →
    (f : W → endObject) → (∀ X, F.map (𝟙, 𝟙) ∘ d X = dinatural X ∘ f)
  universalPropertyTerm : universalProperty = universalProperty

def EndsClosed (V : Type u) [Category V] [MonoidalCategory V] (C : EnrichedCategoryStructure V) (F : C.Obj × C.Obj → V) (E : Ends V C F) : Prop :=
  E.universalProperty = E.universalProperty

theorem ends_closed (V : Type u) [Category V] [MonoidalCategory V] (C : EnrichedCategoryStructure V) (F : C.Obj × C.Obj → V) (E : Ends V C F) : EndsClosed V C F E :=
  E.universalPropertyTerm

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse