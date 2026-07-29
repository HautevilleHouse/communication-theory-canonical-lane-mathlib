import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure ModulationPackage where
  constellation : Type u
  symbolEnergy : Prop
  bandwidthEfficiency : Prop

def ModulationClosed (M : ModulationPackage) : Prop :=
  M.symbolEnergy

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse