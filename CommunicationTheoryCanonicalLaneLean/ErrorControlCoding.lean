import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure LinearCodePackage where
  field : Type u
  dimension : ℕ
  length : ℕ
  generatorMatrix : Matrix (Fin dimension) (Fin length) field
  parityCheckMatrix : Matrix (Fin (length - dimension)) (Fin length) field
  minimumDistance : ℕ

structure ErrorControlCodingEvidence (C : LinearCodePackage) where
  codeCapacityComputed : C.minimumDistance ≥ 2 * t + 1 for some t : ℕ
  parityCheckCorrect : ∀ v : Fin C.length → C.field, (C.parityCheckMatrix).mulVec v = 0 ↔ ∃ u : Fin C.dimension → C.field, v = (C.generatorMatrix).mulVec u
  syndromeDecodingPossible : ∃ decoder : (Fin C.length → C.field) → (Fin C.dimension → C.field), ∀ c : Fin C.length → C.field, (∃ u, c = (C.generatorMatrix).mulVec u) → decoder c = c

def ErrorControlCodingClosed (C : LinearCodePackage) : Prop :=
  (∃ t : ℕ, C.minimumDistance ≥ 2 * t + 1) ∧ (∀ v : Fin C.length → C.field, (C.parityCheckMatrix).mulVec v = 0 ↔ ∃ u : Fin C.dimension → C.field, v = (C.generatorMatrix).mulVec u) ∧ ∃ decoder : (Fin C.length → C.field) → (Fin C.dimension → C.field), ∀ c : Fin C.length → C.field, (∃ u, c = (C.generatorMatrix).mulVec u) → decoder c = c

theorem error_control_coding_closed_from_evidence (C : LinearCodePackage) (E : ErrorControlCodingEvidence C) : ErrorControlCodingClosed C := by
  exact And.intro E.codeCapacityComputed (And.intro E.parityCheckCorrect E.syndromeDecodingPossible)

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse