import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryEnrichedCategoriesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure ChangeOfBasePackage (A : AdmissibleClass) where
  baseChangeFunctor : Type u
  enrichedFunctor : Type v
  coherence : Prop
  changeOfBaseClosed : Prop

def ChangeOfBaseEvidence (C : ChangeOfBasePackage) : Prop :=
  C.coherence ∧ C.changeOfBaseClosed

theorem change_of_base_closed_from_evidence (C : ChangeOfBasePackage) (h : ChangeOfBaseEvidence C) : C.changeOfBaseClosed := by
  exact h.2

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse
