import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure ErrorControlPackage where
  codeDimension : Nat
  minimumDistance : Nat
  errorCorrectionCapability : Prop
  errorCorrectionCapabilityClosed : errorCorrectionCapability

def ErrorControlClosed (E : ErrorControlPackage) : Prop :=
  E.errorCorrectionCapability

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse