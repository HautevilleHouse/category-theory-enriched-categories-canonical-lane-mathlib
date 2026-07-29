import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryEnrichedCategoriesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure LimitsPackage (A : AdmissibleClass) where
  hasLimitsOfShape : Prop
  hasColimitsOfShape : Prop
  limitConstruction : Prop
  colimitConstruction : Prop
  limitsClosed : Prop

def LimitsEvidence (L : LimitsPackage) : Prop :=
  L.hasLimitsOfShape ∧ L.hasColimitsOfShape ∧ L.limitConstruction ∧ L.colimitConstruction ∧ L.limitsClosed

theorem limits_closed_from_evidence (L : LimitsPackage) (h : LimitsEvidence L) : L.limitsClosed := by
  exact h.4

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse
