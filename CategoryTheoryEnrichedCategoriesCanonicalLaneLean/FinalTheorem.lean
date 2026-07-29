import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryEnrichedCategoriesCanonicalLaneLean.BridgeLemmas
import CategoryTheoryEnrichedCategoriesCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

def ConstrainedEnrichedClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_enriched_endgame (A : AdmissibleClass) :
    ConstrainedEnrichedClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse
