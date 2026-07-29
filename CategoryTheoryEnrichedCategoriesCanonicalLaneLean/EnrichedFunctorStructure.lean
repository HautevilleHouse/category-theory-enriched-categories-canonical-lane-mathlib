import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryEnrichedCategoriesCanonicalLaneLean

structure EnrichedFunctorPackage {C D : EnrichedCategoryPackage} where
  objMap : C.baseCategory → D.baseCategory
  homMap : ∀ {X Y : C.baseCategory}, C.homObject X Y → D.homObject (objMap X) (objMap Y)
  preservesComposition : Prop
  preservesIdentity : Prop

structure EnrichedFunctorEvidence {C D : EnrichedCategoryPackage} (F : EnrichedFunctorPackage C D) where
  preservesCompositionClosed : F.preservesComposition
  preservesIdentityClosed : F.preservesIdentity

def EnrichedFunctorClosed {C D : EnrichedCategoryPackage} (F : EnrichedFunctorPackage C D) : Prop :=
  F.preservesComposition ∧ F.preservesIdentity

theorem enriched_functor_closed_from_evidence {C D : EnrichedCategoryPackage} (F : EnrichedFunctorPackage C D) (ev : EnrichedFunctorEvidence F) :
    EnrichedFunctorClosed F := by
  exact And.intro ev.preservesCompositionClosed ev.preservesIdentityClosed

end CategoryTheoryEnrichedCategoriesCanonicalLaneLean
end HautevilleHouse