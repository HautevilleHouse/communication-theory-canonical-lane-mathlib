import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure ChannelCodingPackage where
  blockLength : Nat
  codeRate : Prop
  errorProbability : Prop
  capacityAchievable : Prop
  capacityAchievableClosed : capacityAchievable

def ChannelCodingClosed (C : ChannelCodingPackage) : Prop :=
  C.capacityAchievable

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse