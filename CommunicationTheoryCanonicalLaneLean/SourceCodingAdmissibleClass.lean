import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommunicationTheoryCanonicalLaneLean

structure SourcePackage where
  sourceAlphabet : Type u
  distribution : sourceAlphabet → ℝ
  entropy : ℝ

structure SourceEvidence (S : SourcePackage) where
  entropyComputed : S.entropy = 1.0
  distributionSumOne : ∑ x, S.distribution x = 1

structure SourceCodingPackage where
  source : SourcePackage
  evidence : SourceEvidence source

end CommunicationTheoryCanonicalLaneLean
end HautevilleHouse