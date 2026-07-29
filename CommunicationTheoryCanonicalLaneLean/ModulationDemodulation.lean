import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure ModulationScheme where
  symbolSet : Type u
  signalSet : Type v
  modulationMap : symbolSet → signalSet
  demodulationMap : signalSet → symbolSet
  bandwidth : ℝ
  symbolRate : ℝ
  errorProbability : ℝ

structure ModulationDemodulationEvidence (M : ModulationScheme) where
  modulationInjective : Function.Injective M.modulationMap
  demodulationInverse : ∀ s : M.symbolSet, M.demodulationMap (M.modulationMap s) = s
  bandwidthSufficient : M.bandwidth ≥ 2 * M.symbolRate
  errorRateBelowThreshold : M.errorProbability < 1e-3

def ModulationDemodulationClosed (M : ModulationScheme) : Prop :=
  Function.Injective M.modulationMap ∧ (∀ s : M.symbolSet, M.demodulationMap (M.modulationMap s) = s) ∧ M.bandwidth ≥ 2 * M.symbolRate ∧ M.errorProbability < 1e-3

theorem modulation_demodulation_closed_from_evidence (M : ModulationScheme) (E : ModulationDemodulationEvidence M) : ModulationDemodulationClosed M := by
  exact And.intro E.modulationInjective (And.intro E.demodulationInverse (And.intro E.bandwidthSufficient E.errorRateBelowThreshold))

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse