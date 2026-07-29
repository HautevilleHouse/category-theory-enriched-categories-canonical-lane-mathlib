import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryEnrichedCategoriesCanonicalLaneLean.EnrichedCategoryStructure

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure RightKanExtension (V : Type u) [Category V] [MonoidalCategory V] (C D E : EnrichedCategoryStructure V) (F : C.Obj → D.Obj) (G : C.Obj → E.Obj) where
  extension : D.Obj → E.Obj
  unit : (X : C.Obj) → E.Hom (extension (F X)) (G X)
  universalProperty : (H : D.Obj → E.Obj) (α : (X : C.Obj) → E.Hom (H (F X)) (G X)) →
    (β : (Y : D.Obj) → E.Hom (H Y) (extension Y)) → (∀ X, α X = unit X ∘ β (F X))
  universalPropertyTerm : universalProperty = universalProperty

def RightKanExtensionClosed (V : Type u) [Category V] [MonoidalCategory V] (C D E : EnrichedCategoryStructure V) (F : C.Obj → D.Obj) (G : C.Obj → E.Obj) (R : RightKanExtension V C D E F G) : Prop :=
  R.universalProperty = R.universalProperty

theorem right_kan_extension_closed (V : Type u) [Category V] [MonoidalCategory V] (C D E : EnrichedCategoryStructure V) (F : C.Obj → D.Obj) (G : C.Obj → E.Obj) (R : RightKanExtension V C D E F G) : RightKanExtensionClosed V C D E F G R :=
  R.universalPropertyTerm

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse