import HautevilleHouse.CommunicationTheoryCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure AdmissibleClass where
  object : CommunicationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CommunicationWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse
