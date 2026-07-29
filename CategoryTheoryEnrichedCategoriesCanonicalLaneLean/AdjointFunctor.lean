import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure AdjointFunctorPackage where
  leftAdjoint : Type
  rightAdjoint : Type
  unitCounit : Prop
  bijectionHom : Prop

structure AdjointFunctorEvidence (P : AdjointFunctorPackage) where
  unitCounitClosed : P.unitCounit
  bijectionHomClosed : P.bijectionHom

def AdjointFunctorClosed (P : AdjointFunctorPackage) : Prop :=
  P.unitCounit ∧ P.bijectionHom

theorem adjoint_functor_closed_from_evidence (P : AdjointFunctorPackage) (E : AdjointFunctorEvidence P) :
    AdjointFunctorClosed P := by
  exact And.intro E.unitCounitClosed E.bijectionHomClosed

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse
