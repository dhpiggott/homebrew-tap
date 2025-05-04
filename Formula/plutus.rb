class Plutus < Formula
  desc "Monzo OFX exporter"
  homepage "https://github.com/dhpiggott/plutus"
  url "https://github.com/dhpiggott/plutus/archive/refs/tags/v2.tar.gz"
  sha256 "9f7c3643628b582c0590fa88d7e768f46f75c83e6800a0daad33341b901c1d90"
  license ""

  bottle do
    root_url "https://github.com/dhpiggott/homebrew-tap/releases/download/plutus-2"
    sha256 cellar: :any, arm64_sequoia: "27079236fe0f38c71991a5037589ed3f2a32c64953b2a24ea2440169df3df091"
    sha256 cellar: :any, ventura:       "bf3b2acccbf4f3fe5cd2fbd641db3cc4ba9edca3fb6d42372b9a997804cbefe9"
  end

  depends_on "llvm" => :build
  depends_on "sbt" => :build
  depends_on :macos
  depends_on "s2n"

  def install
    system "sbt", "plutus/nativeLink"
    bin.install "plutus/target/plutus-out" => "plutus"
  end
end
