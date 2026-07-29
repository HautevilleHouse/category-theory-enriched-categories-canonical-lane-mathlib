import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure EnrichedAdmittedObject where
  carrier : Type u
  enrichedStructure : Type v
  homObjects : Type w
  composition : Prop
  identities : Prop
  associativity : Prop
  unitLaws : Prop
  conclusion : Prop

structure EnrichedTheoremState where
  object : EnrichedAdmittedObject

def EnrichedWitnessClosed (O : EnrichedAdmittedObject) : Prop :=
  O.conclusion

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse
