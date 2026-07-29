import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure EnrichedCategory (V : Type u) [MonoidalCategory V] where
  Obj : Type v
  Hom : Obj → Obj → V
  id : ∀ X : Obj, Hom X X
  comp : ∀ X Y Z : Obj, Hom X Y ⊗ Hom Y Z → Hom X Z
  id_left : Prop
  id_right : Prop
  associativity : Prop

structure EnrichedCategoryAdmittedObject where
  base : MonoidalCategoryType
  enriched : EnrichedCategory base.V
  enrichedConclusion : Prop

structure AdmissibleClass where
  object : EnrichedCategoryAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.enrichedConclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse
