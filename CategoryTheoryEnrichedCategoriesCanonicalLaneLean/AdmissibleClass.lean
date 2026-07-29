import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure EnrichedAdmittedObject where
  V : Type u
  [𝒱 : Category V]
  [Monoidal V]
  enrichedCategory : Type v
  [ℰ : Category enrichedCategory]
  [Enriched ℰ V]
  isComplete : Prop
  isCocomplete : Prop
  conclusion : isComplete ∧ isCocomplete

structure AdmissibleClass where
  object : EnrichedAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.isComplete ∧ A.object.isCocomplete) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse
