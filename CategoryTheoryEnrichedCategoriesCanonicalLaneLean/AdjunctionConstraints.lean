import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryEnrichedCategoriesCanonicalLaneLean.EnrichedCategoryDefinitions

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure AdjunctionPackage (V : MonoidalCategory) (C D : EnrichedCategory V) where
  leftAdjoint : C.obj → D.obj
  rightAdjoint : D.obj → C.obj
  unit : (X : C.obj) → V.hom V.unit (D.hom (leftAdjoint X) (rightAdjoint X))
  counit : (Y : D.obj) → V.hom V.unit (C.hom (rightAdjoint Y) (leftAdjoint Y))
  triangleIdentities : Prop

structure AdjunctionEvidence (V : MonoidalCategory) (C D : EnrichedCategory V) (A : AdjunctionPackage V C D) where
  triangleIdentitiesClosed : A.triangleIdentities

def AdjunctionClosed (V : MonoidalCategory) (C D : EnrichedCategory V) (A : AdjunctionPackage V C D) : Prop :=
  A.triangleIdentities

theorem adjunction_closed_from_evidence (V : MonoidalCategory) (C D : EnrichedCategory V) (A : AdjunctionPackage V C D) (E : AdjunctionEvidence V C D A) : AdjunctionClosed V C D A := by
  exact E.triangleIdentitiesClosed

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse