import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CommunicationTheoryCanonicalLaneLean.ChannelModel

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure ChannelCapacityPackage (C : ChannelModel) where
  mutualInformation : Type u
  capacityValue : Prop
  capacityAchievable : Prop
  mutualInformationDefined : mutualInformation
  capacityValueClosed : capacityValue
  capacityAchievableClosed : capacityAchievable

structure ChannelCapacityEvidence {C : ChannelModel} (P : ChannelCapacityPackage C) where
  mutualInformationDefinedClosed : P.mutualInformationDefined
  capacityValueClosedClosed : P.capacityValueClosed
  capacityAchievableClosedClosed : P.capacityAchievableClosed

def ChannelCapacityClosed {C : ChannelModel} (P : ChannelCapacityPackage C) : Prop :=
  P.mutualInformationDefined ∧ P.capacityValue ∧ P.capacityAchievable

theorem channel_capacity_closed_from_evidence {C : ChannelModel} (P : ChannelCapacityPackage C) (E : ChannelCapacityEvidence P) :
    ChannelCapacityClosed P := by
  exact And.intro E.mutualInformationDefinedClosed (And.intro E.capacityValueClosedClosed E.capacityAchievableClosedClosed)

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse