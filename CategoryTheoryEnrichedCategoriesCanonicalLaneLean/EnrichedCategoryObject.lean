import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure EnrichedCategoryObject where
  carrier : Type u
  homObject : carrier → carrier → Type v
  composition : ∀ {a b c : carrier}, homObject b c → homObject a b → homObject a c
  identity : ∀ (a : carrier), homObject a a
  associativity : ∀ {a b c d : carrier} (f : homObject c d) (g : homObject b c) (h : homObject a b),
    composition (composition f g) h = composition f (composition g h)
  leftIdentity : ∀ {a b : carrier} (f : homObject a b), composition (identity b) f = f
  rightIdentity : ∀ {a b : carrier} (f : homObject a b), composition f (identity a) = f

structure EnrichedAdmittedObject where
  enrichedCategory : EnrichedCategoryObject
  baseCategory : Type u
  enrichmentClosed : Prop
  conclusion : enrichmentClosed

def EnrichedWitnessClosed (O : EnrichedAdmittedObject) : Prop :=
  O.enrichmentClosed

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse