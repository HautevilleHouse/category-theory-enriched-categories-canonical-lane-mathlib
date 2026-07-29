import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryEnrichedCategoriesCanonicalLaneLean.EnrichedCategoryDefinitions

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure LimitPackage (V : MonoidalCategory) (C : EnrichedCategory V) where
  diagram : Type u
  limitObject : C.obj
  coneProjections : (d : diagram) → V.hom V.unit (C.hom limitObject (C.obj d))
  universalProperty : Prop

structure ColimitPackage (V : MonoidalCategory) (C : EnrichedCategory V) where
  diagram : Type u
  colimitObject : C.obj
  coconeInjections : (d : diagram) → V.hom V.unit (C.hom (C.obj d) colimitObject)
  universalProperty : Prop

structure LimitEvidence (V : MonoidalCategory) (C : EnrichedCategory V) (L : LimitPackage V C) where
  universalPropertyClosed : L.universalProperty

structure ColimitEvidence (V : MonoidalCategory) (C : EnrichedCategory V) (L : ColimitPackage V C) where
  universalPropertyClosed : L.universalProperty

def LimitClosed (V : MonoidalCategory) (C : EnrichedCategory V) (L : LimitPackage V C) : Prop :=
  L.universalProperty

def ColimitClosed (V : MonoidalCategory) (C : EnrichedCategory V) (L : ColimitPackage V C) : Prop :=
  L.universalProperty

theorem limit_closed_from_evidence (V : MonoidalCategory) (C : EnrichedCategory V) (L : LimitPackage V C) (E : LimitEvidence V C L) : LimitClosed V C L := by
  exact E.universalPropertyClosed

theorem colimit_closed_from_evidence (V : MonoidalCategory) (C : EnrichedCategory V) (L : ColimitPackage V C) (E : ColimitEvidence V C L) : ColimitClosed V C L := by
  exact E.universalPropertyClosed

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse