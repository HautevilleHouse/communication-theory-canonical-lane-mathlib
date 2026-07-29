import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure ChannelPackage where
  channel : Type u
  inputAlphabet : Type v
  outputAlphabet : Type w
  transitionMatrix : inputAlphabet → outputAlphabet → ℝ
  capacity : ℝ

structure ChannelEvidence (C : ChannelPackage) where
  capacityComputed : C.capacity = 0.5
  transitionValid : ∀ x, ∀ y, C.transitionMatrix x y ≥ 0

structure ChannelCapacityPackage where
  channel : ChannelPackage
  evidence : ChannelEvidence channel

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse