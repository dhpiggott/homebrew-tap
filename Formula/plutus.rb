class Plutus < Formula
  desc "Personal-finance CLI for GnuCash housekeeping and Monzo OFX export"
  homepage "https://github.com/dhpiggott/plutus"
  url "https://github.com/dhpiggott/plutus/archive/refs/tags/v6.tar.gz"
  sha256 "0798982e8a4a9d1f612b402c1b1775fd1fd6426d60f051490a801a3e7467cc03"
  license ""

  bottle do
    root_url "https://github.com/dhpiggott/homebrew-tap/releases/download/plutus-6"
    sha256 cellar: :any, arm64_tahoe: "dcd6aa9853db604f16a43519ebd6842995c149d9368e610c55259375a127b04e"
  end

  depends_on "cmake" => :build
  depends_on "llvm@17" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "sbt" => :build
  depends_on :macos
  depends_on "openssl@3"
  depends_on "s2n"

  def install
    system "sbt", "-J-Xmx4G", "set ThisBuild/version := \"#{version}\"", "mainNative3/nativeLinkReleaseFull"
    bin.install "main/target/native-3/native/plutus.Plutus" => "plutus"
  end
end
