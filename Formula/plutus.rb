class Plutus < Formula
  desc "Personal-finance CLI for GnuCash housekeeping and Monzo OFX export"
  homepage "https://github.com/dhpiggott/plutus"
  url "https://github.com/dhpiggott/plutus/archive/refs/tags/v8.tar.gz"
  sha256 "eed75d34f72d6f70d285a7e545b5bb931df74f8ce75fadb3a42a5da8f138d079"
  license ""

  bottle do
    root_url "https://github.com/dhpiggott/homebrew-tap/releases/download/plutus-7"
    sha256 cellar: :any, arm64_tahoe: "5a7e905610fab222e0fc65930c0b3c72ec5429c416c712b8e3b29ccd6abf407c"
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
