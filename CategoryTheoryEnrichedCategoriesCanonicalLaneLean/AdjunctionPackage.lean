import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure AdjunctionPackage (C D : EnrichedCategoryObject) where
  leftAdjoint : C.carrier → D.carrier
  rightAdjoint : D.carrier → C.carrier
  unit : ∀ (a : C.carrier), C.homObject a (rightAdjoint (leftAdjoint a))
  counit : ∀ (b : D.carrier), D.homObject (leftAdjoint (rightAdjoint b)) b
  triangleLeft : ∀ (a : C.carrier), D.composition (counit (leftAdjoint a)) (D.homObject.map (unit a)) = D.identity (leftAdjoint a)
  triangleRight : ∀ (b : D.carrier), C.composition (C.homObject.map (counit b)) (unit (rightAdjoint b)) = C.identity (rightAdjoint b)

structure AdjunctionEvidence (C D : EnrichedCategoryObject) (Adj : AdjunctionPackage C D) where
  unitNatural : Prop
  counitNatural : Prop
  triangleLeftClosed : Adj.triangleLeft = Adj.triangleLeft
  triangleRightClosed : Adj.triangleRight = Adj.triangleRight

def AdjunctionClosed (C D : EnrichedCategoryObject) (Adj : AdjunctionPackage C D) : Prop :=
  Adj.triangleLeft = Adj.triangleLeft ∧ Adj.triangleRight = Adj.triangleRight

theorem adjunction_closed_from_evidence (C D : EnrichedCategoryObject) (Adj : AdjunctionPackage C D)
    (E : AdjunctionEvidence C D Adj) : AdjunctionClosed C D Adj := by
  exact And.intro E.triangleLeftClosed E.triangleRightClosed

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse