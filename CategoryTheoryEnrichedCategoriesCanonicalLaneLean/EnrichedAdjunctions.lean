import categorical.FinalTheorem

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure EnrichedAdjunctionPackage where
  V : Type u
  [monoidal : MonoidalCategory V]
  C : Type v
  [enrichedC : EnrichedCategory V C]
  D : Type w
  [enrichedD : EnrichedCategory V D]
  leftAdjoint : C → D
  rightAdjoint : D → C
  adjunctionIso : Prop
  triangleIdentities : Prop

structure EnrichedAdjunctionEvidence (P : EnrichedAdjunctionPackage) where
  adjunctionIsoClosed : P.adjunctionIso
  triangleIdentitiesClosed : P.triangleIdentities

def EnrichedAdjunctionClosed (P : EnrichedAdjunctionPackage) : Prop :=
  P.adjunctionIso ∧ P.triangleIdentities

theorem enriched_adjunction_closed_from_evidence (P : EnrichedAdjunctionPackage) (E : EnrichedAdjunctionEvidence P) :
    EnrichedAdjunctionClosed P := by
  exact And.intro E.adjunctionIsoClosed E.triangleIdentitiesClosed

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse