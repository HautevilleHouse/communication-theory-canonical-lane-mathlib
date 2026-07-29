import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CommunicationTheoryCanonicalLaneLean.SourceCodingTheorem
import HautevilleHouse.CommunicationTheoryCanonicalLaneLean.ChannelCapacity

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure RateDistortionPackage {C : ChannelModel} (S : SourceCodingTheoremPackage C) (P : ChannelCapacityPackage C) where
  distortionMeasure : Type u
  rateDistortionFunction : Type v
  operationalEquivalence : Prop
  distortionMeasureClosed : distortionMeasure
  rateDistortionFunctionDefined : rateDistortionFunction
  operationalEquivalenceClosed : operationalEquivalence

structure RateDistortionEvidence {C : ChannelModel} {S : SourceCodingTheoremPackage C} {P : ChannelCapacityPackage C} (R : RateDistortionPackage S P) where
  distortionMeasureClosedClosed : R.distortionMeasureClosed
  rateDistortionFunctionDefinedClosed : R.rateDistortionFunctionDefined
  operationalEquivalenceClosedClosed : R.operationalEquivalenceClosed

def RateDistortionClosed {C : ChannelModel} {S : SourceCodingTheoremPackage C} {P : ChannelCapacityPackage C} (R : RateDistortionPackage S P) : Prop :=
  R.distortionMeasureClosed ∧ R.rateDistortionFunctionDefined ∧ R.operationalEquivalenceClosed

theorem rate_distortion_closed_from_evidence {C : ChannelModel} {S : SourceCodingTheoremPackage C} {P : ChannelCapacityPackage C} (R : RateDistortionPackage S P) (E : RateDistortionEvidence R) :
    RateDistortionClosed R := by
  exact And.intro E.distortionMeasureClosedClosed (And.intro E.rateDistortionFunctionDefinedClosed E.operationalEquivalenceClosedClosed)

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse