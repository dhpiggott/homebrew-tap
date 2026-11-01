class Plutus < Formula
  desc "Copy Monzo transactions to GnuCash or OFX and archive GnuCash accounts"
  homepage "https://github.com/dhpiggott/plutus"
  url "https://github.com/dhpiggott/plutus/archive/refs/tags/v11.tar.gz"
  sha256 "351570d7a0d8e6f7d130205e2795d277a5c9951f0f7f98e2b6f9dcf94d89d447"
  license ""

  bottle do
    root_url "https://github.com/dhpiggott/homebrew-tap/releases/download/plutus-10"
    sha256 cellar: :any, arm64_tahoe: "b14db4af81c11c3b1fc73e212b71d105002c36daecc3c0fba25d479766879ec6"
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
