import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CommunicationTheoryCanonicalLaneLean.ChannelModel
import HautevilleHouse.CommunicationTheoryCanonicalLaneLean.ChannelCapacity

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure ErrorCorrectionPackage {C : ChannelModel} (P : ChannelCapacityPackage C) where
  codeFamily : Type u
  decodingAlgorithm : Type v
  errorProbability : Prop
  shannonLimitAchievable : Prop
  codeFamilyDefined : codeFamily
  decodingAlgorithmDefined : decodingAlgorithm
  errorProbabilityClosed : errorProbability
  shannonLimitAchievableClosed : shannonLimitAchievable

structure ErrorCorrectionEvidence {C : ChannelModel} {P : ChannelCapacityPackage C} (E : ErrorCorrectionPackage P) where
  codeFamilyDefinedClosed : E.codeFamilyDefined
  decodingAlgorithmDefinedClosed : E.decodingAlgorithmDefined
  errorProbabilityClosedClosed : E.errorProbabilityClosed
  shannonLimitAchievableClosedClosed : E.shannonLimitAchievableClosed

def ErrorCorrectionClosed {C : ChannelModel} {P : ChannelCapacityPackage C} (E : ErrorCorrectionPackage P) : Prop :=
  E.codeFamilyDefined ∧ E.decodingAlgorithmDefined ∧ E.errorProbability ∧ E.shannonLimitAchievable

theorem error_correction_closed_from_evidence {C : ChannelModel} {P : ChannelCapacityPackage C} (E : ErrorCorrectionPackage P) (Ev : ErrorCorrectionEvidence E) :
    ErrorCorrectionClosed E := by
  exact And.intro Ev.codeFamilyDefinedClosed (And.intro Ev.decodingAlgorithmDefinedClosed (And.intro Ev.errorProbabilityClosedClosed Ev.shannonLimitAchievableClosedClosed))

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse