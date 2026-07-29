import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure FeedbackChannelPackage where
  channel : Type u
  feedbackAvailable : Bool
  noiselessFeedback : Bool
  capacityWithFeedback : ℝ
  capacityWithoutFeedback : ℝ
  feedbackCapacityGreater : capacityWithFeedback ≥ capacityWithoutFeedback

theorem feedback_capacity_greater_eq (F : FeedbackChannelPackage) : F.capacityWithFeedback ≥ F.capacityWithoutFeedback :=
  F.feedbackCapacityGreater

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse