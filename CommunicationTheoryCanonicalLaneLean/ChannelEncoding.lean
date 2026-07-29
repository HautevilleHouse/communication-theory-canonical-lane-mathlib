import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure ChannelPackage where
  inputAlphabet : Type u
  outputAlphabet : Type v
  transitionMatrix : Type w
  memoryless : Prop
  stationary : Prop

structure ChannelEvidence (C : ChannelPackage) where
  memorylessClosed : C.memoryless
  stationaryClosed : C.stationary

def ChannelClosed (C : ChannelPackage) : Prop :=
  C.memoryless ∧ C.stationary

theorem channel_closed_from_evidence (C : ChannelPackage) (E : ChannelEvidence C) : ChannelClosed C := by
  exact And.intro E.memorylessClosed E.stationaryClosed

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse