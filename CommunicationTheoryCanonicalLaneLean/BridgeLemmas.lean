import canonicalLaneMathlib.AdmissibleClass
import CommunicationTheoryCanonicalLaneLean.CommunicationTheoryAdmissibleClass

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CommunicationWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse