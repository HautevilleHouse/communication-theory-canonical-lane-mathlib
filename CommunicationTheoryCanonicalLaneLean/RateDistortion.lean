import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure RateDistortionPackage where
  sourceAlphabet : Type u
  reconstructionAlphabet : Type v
  distortionMeasure : sourceAlphabet → reconstructionAlphabet → ℝ
  rateDistortionFunction : ℝ → ℝ
  distortionLevel : ℝ
  rate : ℝ

structure RateDistortionEvidence (R : RateDistortionPackage) where
  rateAtDistortion : R.rate = R.rateDistortionFunction R.distortionLevel
  achievable : ∃ cond : sourceAlphabet → reconstructionAlphabet → ℝ, (∀ x, ∑ y, cond x y = 1) ∧ (∀ x y, cond x y ≥ 0) ∧ (∑ x y, (sourceDistribution x) * cond x y * distortionMeasure x y) ≤ R.distortionLevel ∧ (mutualInformation (sourceDistribution) (cond)) ≤ R.rate

def RateDistortionClosed (R : RateDistortionPackage) : Prop :=
  R.rate = R.rateDistortionFunction R.distortionLevel ∧ ∃ cond : R.sourceAlphabet → R.reconstructionAlphabet → ℝ, (∀ x, ∑ y, cond x y = 1) ∧ (∀ x y, cond x y ≥ 0) ∧ (∑ x y, (sourceDistribution x) * cond x y * distortionMeasure x y) ≤ R.distortionLevel ∧ (mutualInformation (sourceDistribution) (cond)) ≤ R.rate

theorem rate_distortion_closed_from_evidence (R : RateDistortionPackage) (E : RateDistortionEvidence R) : RateDistortionClosed R := by
  exact And.intro E.rateAtDistortion E.achievable

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse