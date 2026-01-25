class Plutus < Formula
  desc "Monzo OFX exporter"
  homepage "https://github.com/dhpiggott/plutus"
  url "https://github.com/dhpiggott/plutus/archive/refs/tags/v5.tar.gz"
  sha256 "7bf968bdb7334c2484121695703f1b830e42ea4f6852aed7c486d99403828535"
  license ""

  bottle do
    root_url "https://github.com/dhpiggott/homebrew-tap/releases/download/plutus-4"
    sha256 cellar: :any, arm64_sequoia: "50cd790e0e9e2adc192e16a4a2e46890415e605620ff2b1194d5c2a7e1e6bc66"
    sha256 cellar: :any, ventura:       "f08c28a84e8fdb548d63b208528e6aa598ab6d4c7cfbe99c073cd305990c59d4"
  end

  depends_on "llvm@17" => :build
  depends_on "sbt" => :build
  depends_on :macos
  depends_on "s2n"

  def install
    ENV["SN_RELEASE"] = "size"
    system "sbt", "set ThisBuild/version := \"#{version}\"", "mainNative3/nativeLink"
    bin.install "main/target/native-3/main-out" => "plutus"
  end
end
