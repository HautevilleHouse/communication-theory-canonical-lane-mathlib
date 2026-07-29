import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure SourceCodingPackage where
  sourceAlphabet : Type u
  sourceDistribution : sourceAlphabet → ℝ
  entropyRate : ℝ
  encoder : (sourceAlphabet → List Bool) → Prop
  decoder : (List Bool → sourceAlphabet) → Prop
  errorProbability : ℝ

structure SourceCodingEvidence (S : SourceCodingPackage) where
  entropyRatePositive : S.entropyRate > 0
  encoderExists : ∃ enc : S.sourceAlphabet → List Bool, S.encoder enc
  decoderExists : ∃ dec : List Bool → S.sourceAlphabet, S.decoder dec
  errorGoesToZero : S.errorProbability → 0

def SourceCodingClosed (S : SourceCodingPackage) : Prop :=
  S.entropyRate > 0 ∧ (∃ enc : S.sourceAlphabet → List Bool, S.encoder enc) ∧ (∃ dec : List Bool → S.sourceAlphabet, S.decoder dec) ∧ (S.errorProbability → 0)

theorem source_coding_closed_from_evidence (S : SourceCodingPackage) (E : SourceCodingEvidence S) : SourceCodingClosed S := by
  exact And.intro E.entropyRatePositive (And.intro E.encoderExists (And.intro E.decoderExists E.errorGoesToZero))

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse