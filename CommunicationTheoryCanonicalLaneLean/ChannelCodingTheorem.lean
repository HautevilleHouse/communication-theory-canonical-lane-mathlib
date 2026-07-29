import communicationTheoryCanonicalLaneLean.CommunicationTheoryAdmissibleClass

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure ChannelCodingPackage (A : AdmissibleClass) where
  sourceAlphabet : Type u
  channelModel : Type v
  codebook : Type w
  encoding : sourceAlphabet → channelModel
  decoding : channelModel → sourceAlphabet
  errorProbability : ℝ
  capacityAchieving : Prop
  randomCodingScheme : Prop
  typicalSetDecoding : Prop
  jointTypicality : Prop

def ChannelCodingClosed {A : AdmissibleClass} (C : ChannelCodingPackage A) : Prop :=
  C.capacityAchieving ∧ C.randomCodingScheme ∧ C.typicalSetDecoding ∧ C.jointTypicality

structure ChannelCodingEvidence {A : AdmissibleClass} (C : ChannelCodingPackage A) where
  capacityAchievingClosed : C.capacityAchieving
  randomCodingSchemeClosed : C.randomCodingScheme
  typicalSetDecodingClosed : C.typicalSetDecoding
  jointTypicalityClosed : C.jointTypicality

theorem channel_coding_closed_from_evidence
    {A : AdmissibleClass} (C : ChannelCodingPackage A) (E : ChannelCodingEvidence C) :
    ChannelCodingClosed C := by
  exact And.intro E.capacityAchievingClosed
    (And.intro E.randomCodingSchemeClosed
      (And.intro E.typicalSetDecodingClosed E.jointTypicalityClosed))

end communicationTheoryCanonicalLaneLean
end HautevilleHouse