class Plutus < Formula
  desc "Monzo OFX exporter"
  homepage "https://github.com/dhpiggott/plutus"
  url "https://github.com/dhpiggott/plutus/archive/refs/tags/v1.tar.gz"
  sha256 "737c573867b78ab3307e16ce45e1a2569e475452ffad7cd2d189c5b917fdfd63"
  license ""

  depends_on "llvm" => :build
  depends_on "sbt" => :build
  depends_on :macos
  depends_on "s2n"

  def install
    system "sbt", "nativeLink"
    bin.install "target/plutus-out" => "plutus"
  end
end
