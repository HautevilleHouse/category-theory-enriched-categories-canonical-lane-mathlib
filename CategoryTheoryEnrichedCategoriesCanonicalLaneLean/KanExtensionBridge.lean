import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryEnrichedCategoriesCanonicalLaneLean.EnrichedCategoryDefinitions

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure KanExtensionPackage (V : MonoidalCategory) (C D : EnrichedCategory V) (F : C.obj → D.obj) where
  leftKanExt : (X : C.obj) → D.obj
  rightKanExt : (X : C.obj) → D.obj
  leftKanUniversal : Prop
  rightKanUniversal : Prop

structure KanExtensionEvidence (V : MonoidalCategory) (C D : EnrichedCategory V) (F : C.obj → D.obj) (K : KanExtensionPackage V C D F) where
  leftKanUniversalClosed : K.leftKanUniversal
  rightKanUniversalClosed : K.rightKanUniversal

def KanExtensionClosed (V : MonoidalCategory) (C D : EnrichedCategory V) (F : C.obj → D.obj) (K : KanExtensionPackage V C D F) : Prop :=
  K.leftKanUniversal ∧ K.rightKanUniversal

theorem kan_extension_closed_from_evidence (V : MonoidalCategory) (C D : EnrichedCategory V) (F : C.obj → D.obj) (K : KanExtensionPackage V C D F) (E : KanExtensionEvidence V C D F K) : KanExtensionClosed V C D F K := by
  exact And.intro E.leftKanUniversalClosed E.rightKanUniversalClosed

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse