class Plutus < Formula
  desc "Monzo OFX exporter"
  homepage "https://github.com/dhpiggott/plutus"
  url "https://github.com/dhpiggott/plutus/archive/refs/tags/v1.tar.gz"
  sha256 "737c573867b78ab3307e16ce45e1a2569e475452ffad7cd2d189c5b917fdfd63"
  license ""

  bottle do
    root_url "https://github.com/dhpiggott/homebrew-tap/releases/download/plutus-1"
    sha256 cellar: :any, arm64_sequoia: "3b6f4aed1d5cb48624e7a3b333012ba9bb0d46bf201b9e3f8894f7b5896ddaba"
    sha256 cellar: :any, ventura:       "d0e18daa9c96b70c82e1b8964a69389582630e147fdb84fa316e31eb2adba48f"
  end

  depends_on "llvm" => :build
  depends_on "sbt" => :build
  depends_on :macos
  depends_on "s2n"

  def install
    system "sbt", "nativeLink"
    bin.install "target/plutus-out" => "plutus"
  end
end
