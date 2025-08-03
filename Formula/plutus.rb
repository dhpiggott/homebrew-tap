class Plutus < Formula
  desc "Monzo OFX exporter"
  homepage "https://github.com/dhpiggott/plutus"
  url "https://github.com/dhpiggott/plutus/archive/refs/tags/v3.tar.gz"
  sha256 "5fbfc27722ac7e4335700374b19457a86ae34ec9ae676ddad7d21b14692ec691"
  license ""

  bottle do
    root_url "https://github.com/dhpiggott/homebrew-tap/releases/download/plutus-3"
    sha256 cellar: :any, arm64_sequoia: "2a6165b3e1b161c7d8b59447ad3abd6f75a3d2983a214b92953fa1edb26e134c"
    sha256 cellar: :any, ventura:       "5342c05071d6d9232a0910208b68aeb67090a9cf44e78147a7e0da47fe559271"
  end

  depends_on "llvm@17" => :build
  depends_on "sbt" => :build
  depends_on :macos
  depends_on "s2n"

  def install
    ENV["SN_RELEASE"] = "size"
    system "sbt", "set ThisBuild/version := \"#{version}\"", "plutus/nativeLink"
    bin.install "plutus/target/plutus-out" => "plutus"
  end
end
