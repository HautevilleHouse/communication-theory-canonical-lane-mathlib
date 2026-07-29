import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure ChannelCodingTheoremPackage where
  channelCapacity : ℝ
  achievableRate : ℝ
  errorProbability : ℝ → ℝ
  rateAchievable : achievableRate ≤ channelCapacity
  errorDecays : ∀ R < channelCapacity, errorProbability R → 0

structure ChannelCodingTheoremEvidence (C : ChannelCodingTheoremPackage) where
  rateAchievableClosed : C.rateAchievable
  errorDecaysClosed : C.errorDecays

def ChannelCodingTheoremClosed (C : ChannelCodingTheoremPackage) : Prop :=
  C.rateAchievable ∧ C.errorDecays

theorem channel_coding_theorem_closed_from_evidence
  (C : ChannelCodingTheoremPackage) (E : ChannelCodingTheoremEvidence C) :
  ChannelCodingTheoremClosed C := by
  exact And.intro E.rateAchievableClosed E.errorDecaysClosed

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse