import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure MultiUserChannel where
  transmitters : ℕ
  receivers : ℕ
  channelMatrix : Matrix (Fin transmitters) (Fin receivers) ℝ
  powerConstraints : (Fin transmitters) → ℝ
  rateRegion : Set (Vector ℝ (Fin transmitters))
  sumRate : ℝ

structure NetworkInformationTheoryEvidence (N : MultiUserChannel) where
  rateRegionConvex : Convex ℝ N.rateRegion
  capacityRegionCharacterized : ∀ r : Vector ℝ (Fin N.transmitters), r ∈ N.rateRegion ↔ ∃ P : (Fin N.transmitters) → ℝ, (∀ i, P i ≤ N.powerConstraints i) ∧ (∀ j, ∑ i, P i * N.channelMatrix i j ≥ (2^r i - 1) / (∑ k, P k * N.channelMatrix k j) ) -- simplified
  sumRateAchievable : N.sumRate = max r ∈ N.rateRegion, ∑ i, r i

def NetworkInformationTheoryClosed (N : MultiUserChannel) : Prop :=
  Convex ℝ N.rateRegion ∧ (∀ r : Vector ℝ (Fin N.transmitters), r ∈ N.rateRegion ↔ ∃ P : (Fin N.transmitters) → ℝ, (∀ i, P i ≤ N.powerConstraints i) ∧ (∀ j, ∑ i, P i * N.channelMatrix i j ≥ (2^r i - 1) / (∑ k, P k * N.channelMatrix k j))) ∧ N.sumRate = max r ∈ N.rateRegion, ∑ i, r i

theorem network_information_theory_closed_from_evidence (N : MultiUserChannel) (E : NetworkInformationTheoryEvidence N) : NetworkInformationTheoryClosed N := by
  exact And.intro E.rateRegionConvex (And.intro E.capacityRegionCharacterized E.sumRateAchievable)

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse