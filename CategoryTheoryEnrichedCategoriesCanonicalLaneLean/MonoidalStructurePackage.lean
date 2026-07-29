import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure MonoidalStructurePackage (C : EnrichedCategoryObject) where
  tensorProduct : C.carrier → C.carrier → C.carrier
  unitObject : C.carrier
  associator : ∀ (a b c : C.carrier), C.homObject (tensorProduct (tensorProduct a b) c) (tensorProduct a (tensorProduct b c))
  leftUnitor : ∀ (a : C.carrier), C.homObject (tensorProduct unitObject a) a
  rightUnitor : ∀ (a : C.carrier), C.homObject (tensorProduct a unitObject) a
  pentagonIdentity : Prop
  triangleIdentity : Prop

structure MonoidalStructureEvidence (C : EnrichedCategoryObject) (M : MonoidalStructurePackage C) where
  pentagonIdentityClosed : M.pentagonIdentity
  triangleIdentityClosed : M.triangleIdentity

def MonoidalStructureClosed (C : EnrichedCategoryObject) (M : MonoidalStructurePackage C) : Prop :=
  M.pentagonIdentity ∧ M.triangleIdentity

theorem monoidal_structure_closed_from_evidence (C : EnrichedCategoryObject) (M : MonoidalStructurePackage C)
    (E : MonoidalStructureEvidence C M) : MonoidalStructureClosed C M := by
  exact And.intro E.pentagonIdentityClosed E.triangleIdentityClosed

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse