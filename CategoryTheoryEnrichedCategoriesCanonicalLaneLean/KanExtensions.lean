import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryEnrichedCategoriesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure KanExtensionPackage (A : AdmissibleClass) where
  leftKanExists : Prop
  rightKanExists : Prop
  pointwiseFormula : Prop
  kanExtensionClosed : Prop

def KanExtensionEvidence (K : KanExtensionPackage) : Prop :=
  K.leftKanExists ∧ K.rightKanExists ∧ K.pointwiseFormula ∧ K.kanExtensionClosed

theorem kan_extension_closed_from_evidence (K : KanExtensionPackage) (h : KanExtensionEvidence K) : K.kanExtensionClosed := by
  exact h.3

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse
