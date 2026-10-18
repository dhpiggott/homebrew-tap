class Plutus < Formula
  desc "Personal-finance CLI for GnuCash housekeeping and Monzo OFX export"
  homepage "https://github.com/dhpiggott/plutus"
  url "https://github.com/dhpiggott/plutus/archive/refs/tags/v9.tar.gz"
  sha256 "a6d5be4c835a3407cd9d007ea562c217f171052d53897b16d22ad4ec237ecf9f"
  license ""

  bottle do
    root_url "https://github.com/dhpiggott/homebrew-tap/releases/download/plutus-9"
    sha256 cellar: :any, arm64_tahoe: "2cc45b5462f4f53350533d87d8e65325bf96a8f8b773146a25133b17bef50735"
  end

  depends_on "cmake" => :build
  depends_on "llvm@17" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "sbt" => :build
  depends_on :macos
  depends_on "openssl@4"
  depends_on "s2n"

  def install
    system "sbt", "-J-Xmx4G", "set ThisBuild/version := \"#{version}\"", "mainNative3/nativeLinkReleaseFull"
    bin.install "main/target/native-3/native/plutus.Plutus" => "plutus"
  end

  test do
    assert_match(/^version: #{Regexp.escape(version.to_s)}$/, shell_output("#{bin}/plutus --version"))
  end
end
