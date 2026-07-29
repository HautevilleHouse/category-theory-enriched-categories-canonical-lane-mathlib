import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure KanExtensionPackage where
  sourceCategory : EnrichedCategory (V : Type u)
  targetCategory : EnrichedCategory (W : Type v)
  leftKanExtension : Prop
  rightKanExtension : Prop
  universalProperty : Prop

structure KanExtensionEvidence (P : KanExtensionPackage) where
  leftKanExtensionClosed : P.leftKanExtension
  rightKanExtensionClosed : P.rightKanExtension
  universalPropertyClosed : P.universalProperty

def KanExtensionClosed (P : KanExtensionPackage) : Prop :=
  P.leftKanExtension ∧ P.rightKanExtension ∧ P.universalProperty

theorem kan_extension_closed_from_evidence (P : KanExtensionPackage) (E : KanExtensionEvidence P) :
    KanExtensionClosed P := by
  exact And.intro E.leftKanExtensionClosed (And.intro E.rightKanExtensionClosed E.universalPropertyClosed)

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse
