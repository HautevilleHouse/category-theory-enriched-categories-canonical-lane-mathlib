import canonicalLaneMathlib.EnrichedCategoryPackage

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure EnrichedCategoryPackage where
  monoidalCategory : Type u
  enrichedCategory : Type v
  homObjects : enrichedCategory → enrichedCategory → monoidalCategory
  composition : ∀ {a b c : enrichedCategory}, homObjects a b ⊗ homObjects b c → homObjects a c
  identities : ∀ {a : enrichedCategory}, homObjects a a
  associativity : ∀ {a b c d : enrichedCategory}, ...
  identityLaws : ∀ {a b : enrichedCategory}, ...
  
  -- placeholder for the actual laws
  enrichedCategoryAxioms : Prop

def EnrichedCategoryWitnessClosed (O : EnrichedCategoryAdmittedObject) : Prop :=
  O.enrichedCategoryAxioms

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse