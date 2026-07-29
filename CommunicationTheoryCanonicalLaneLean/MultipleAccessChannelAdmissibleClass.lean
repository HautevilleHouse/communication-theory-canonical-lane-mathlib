import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure MultipleAccessChannelPackage where
  channel : Type u
  inputAlphabets : List Type
  outputAlphabet : Type v
  transitionMatrix : (List Type) → outputAlphabet → ℝ
  capacityRegion : Set (ℝ × ℝ)
  sumRateCapacity : ℝ
  symmetricCapacity : ℝ
  cornerPoints : List (ℝ × ℝ)
  capacityRegionConvex : Convex ℝ capacityRegion

theorem capacity_region_convex (C : MultipleAccessChannelPackage) : Convex ℝ C.capacityRegion :=
  C.capacityRegionConvex

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse