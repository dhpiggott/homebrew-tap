class Plutus < Formula
  desc "Monzo OFX exporter"
  homepage "https://github.com/dhpiggott/plutus"
  url "https://github.com/dhpiggott/plutus/archive/refs/tags/v6.tar.gz"
  sha256 "0798982e8a4a9d1f612b402c1b1775fd1fd6426d60f051490a801a3e7467cc03"
  license ""

  bottle do
    root_url "https://github.com/dhpiggott/homebrew-tap/releases/download/plutus-5"
    sha256 cellar: :any, arm64_tahoe: "76b75bf5726191b1c6f2a395d95bdfeb2fd952e960abaddf954187bb9810ded8"
  end

  depends_on "cmake" => :build
  depends_on "llvm@17" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "sbt" => :build
  depends_on :macos
  depends_on "openssl@3"

  def install
    ENV["SN_RELEASE"] = "size"
    system "sbt", "set ThisBuild/version := \"#{version}\"", "mainNative3/nativeLink"
    bin.install "main/target/native-3/main" => "plutus"
  end
end
