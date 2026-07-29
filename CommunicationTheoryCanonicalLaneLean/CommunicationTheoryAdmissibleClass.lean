import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure CommunicationAdmittedObject where
  source : Type u
  channel : Type v
  code : Type w
  encodingFunction : source → channel
  decodingFunction : channel → source
  errorProbability : ℝ
  capacity : ℝ
  reliableCommunication : Prop
  conclusion : reliableCommunication

structure AdmissibleClass where
  object : CommunicationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CommunicationWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse