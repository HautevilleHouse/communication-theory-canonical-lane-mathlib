import canonicalLaneMathlib.AdmissibleClass
import CommunicationTheoryCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

def ConstrainedCommunicationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_communication_endgame (A : AdmissibleClass) :
    ConstrainedCommunicationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end communicationTheoryCanonicalLaneLean
end HautevilleHouse