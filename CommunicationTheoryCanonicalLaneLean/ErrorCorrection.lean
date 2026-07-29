import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure ErrorCorrectionPackage where
  code : Type u
  minimumDistance : Prop
  errorCorrectionCapability : Prop
  weightDistribution : Prop
  decodingAlgorithm : Prop

structure ErrorCorrectionEvidence (E : ErrorCorrectionPackage) where
  minimumDistanceClosed : E.minimumDistance
  errorCorrectionCapabilityClosed : E.errorCorrectionCapability
  weightDistributionClosed : E.weightDistribution
  decodingAlgorithmClosed : E.decodingAlgorithm

def ErrorCorrectionClosed (E : ErrorCorrectionPackage) : Prop :=
  E.minimumDistance ∧ E.errorCorrectionCapability ∧ E.weightDistribution ∧ E.decodingAlgorithm

theorem error_correction_closed_from_evidence (E : ErrorCorrectionPackage) (Ev : ErrorCorrectionEvidence E) : ErrorCorrectionClosed E := by
  exact And.intro Ev.minimumDistanceClosed (And.intro Ev.errorCorrectionCapabilityClosed (And.intro Ev.weightDistributionClosed Ev.decodingAlgorithmClosed))

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse