class Plutus < Formula
  desc "Copy Monzo transactions to GnuCash or OFX and archive GnuCash accounts"
  homepage "https://github.com/dhpiggott/plutus"
  url "https://github.com/dhpiggott/plutus/archive/refs/tags/v10.tar.gz"
  sha256 "5b255fdb91c54773322030be9bdfd66d81e80b9b1ed202a43895869a38cc5e74"
  license ""

  bottle do
    root_url "https://github.com/dhpiggott/homebrew-tap/releases/download/plutus-9"
    sha256 cellar: :any, arm64_tahoe: "65bda47edc4bda5f16bd550ec9ad9d0b8939e16892f085e641bf9752ebbed084"
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
