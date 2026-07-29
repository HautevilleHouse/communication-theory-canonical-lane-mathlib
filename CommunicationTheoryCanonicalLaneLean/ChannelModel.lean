import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure ChannelModel where
  inputAlphabet : Type u
  outputAlphabet : Type v
  transitionMatrix : inputAlphabet -> outputAlphabet -> Prop
  memoryless : Prop
  stationary : Prop

structure ChannelEvidence (C : ChannelModel) where
  memorylessClosed : C.memoryless
  stationaryClosed : C.stationary

def ChannelClosed (C : ChannelModel) : Prop :=
  C.memoryless ∧ C.stationary

theorem channel_closed_from_evidence (C : ChannelModel) (E : ChannelEvidence C) :
    ChannelClosed C := by
  exact And.intro E.memorylessClosed E.stationaryClosed

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse