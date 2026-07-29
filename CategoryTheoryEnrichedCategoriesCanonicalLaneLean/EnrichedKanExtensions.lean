import categorical.FinalTheorem

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure EnrichedKanExtensionPackage where
  V : Type u
  [monoidal : MonoidalCategory V]
  C : Type v
  [enrichedC : EnrichedCategory V C]
  D : Type w
  [enrichedD : EnrichedCategory V D]
  leftKan : (C → D) → D
  rightKan : (C → D) → D
  pointwiseFormula : Prop
  existence : Prop

structure EnrichedKanExtensionEvidence (P : EnrichedKanExtensionPackage) where
  pointwiseFormulaClosed : P.pointwiseFormula
  existenceClosed : P.existence

def EnrichedKanExtensionClosed (P : EnrichedKanExtensionPackage) : Prop :=
  P.pointwiseFormula ∧ P.existence

theorem enriched_kan_extension_closed_from_evidence (P : EnrichedKanExtensionPackage) (E : EnrichedKanExtensionEvidence P) :
    EnrichedKanExtensionClosed P := by
  exact And.intro E.pointwiseFormulaClosed E.existenceClosed

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse