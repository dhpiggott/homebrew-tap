class Plutus < Formula
  desc "Monzo OFX exporter"
  homepage "https://github.com/dhpiggott/plutus"
  url "https://github.com/dhpiggott/plutus/archive/refs/tags/v5.tar.gz"
  sha256 "7bf968bdb7334c2484121695703f1b830e42ea4f6852aed7c486d99403828535"
  license ""

  bottle do
    root_url "https://github.com/dhpiggott/homebrew-tap/releases/download/plutus-5"
    sha256 cellar: :any, arm64_tahoe: "76b75bf5726191b1c6f2a395d95bdfeb2fd952e960abaddf954187bb9810ded8"
  end

  depends_on "llvm@17" => :build
  depends_on "sbt" => :build
  depends_on :macos
  depends_on "openssl@3"
  depends_on "s2n"

  def install
    ENV["SN_RELEASE"] = "size"
    system "sbt", "set ThisBuild/version := \"#{version}\"", "mainNative3/nativeLink"
    bin.install "main/target/native-3/main-out" => "plutus"
  end
end
