import canonicalLaneMathlib.AdmissibleClass
import CommunicationTheoryCanonicalLaneLean.CommunicationTheoryAdmissibleClass

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure SourceCodingPackage (A : AdmissibleClass) where
  sourceDistribution : ℝ
  entropy : ℝ
  compressionRatio : ℝ
  distortion : ℝ
  rateDistortionFunction : ℝ
  losslessCodingBound : Prop
  lossyCodingBound : Prop
  achievability : Prop
  converse : Prop

def SourceCodingClosed {A : AdmissibleClass} (C : SourceCodingPackage A) : Prop :=
  C.losslessCodingBound ∧ C.lossyCodingBound ∧ C.achievability ∧ C.converse

structure SourceCodingEvidence {A : AdmissibleClass} (C : SourceCodingPackage A) where
  losslessCodingBoundClosed : C.losslessCodingBound
  lossyCodingBoundClosed : C.lossyCodingBound
  achievabilityClosed : C.achievability
  converseClosed : C.converse

theorem source_coding_closed_from_evidence
    {A : AdmissibleClass} (C : SourceCodingPackage A) (E : SourceCodingEvidence C) :
    SourceCodingClosed C := by
  exact And.intro E.losslessCodingBoundClosed
    (And.intro E.lossyCodingBoundClosed
      (And.intro E.achievabilityClosed E.converseClosed))

end communicationTheoryCanonicalLaneLean
end HautevilleHouse