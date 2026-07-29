import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure MonoidalCategory where
  obj : Type u
  hom : obj → obj → Type v
  tensor : obj → obj → obj
  unit : obj
  associator : (a b c : obj) → hom (tensor (tensor a b) c) (tensor a (tensor b c))
  leftUnitor : (a : obj) → hom (tensor unit a) a
  rightUnitor : (a : obj) → hom (tensor a unit) a
  pentagonCondition : Prop
  triangleCondition : Prop

structure EnrichedCategory (V : MonoidalCategory) where
  obj : Type u
  hom : obj → obj → V.obj
  composition : (a b c : obj) → V.hom (V.tensor (hom a b) (hom b c)) (hom a c)
  identity : (a : obj) → V.hom V.unit (hom a a)
  associativityCondition : Prop
  leftUnitCondition : Prop
  rightUnitCondition : Prop

structure AdmissibleClass where
  object : EnrichedCategory
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse