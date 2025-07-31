class Plutus < Formula
  desc "Monzo OFX exporter"
  homepage "https://github.com/dhpiggott/plutus"
  url "https://github.com/dhpiggott/plutus/archive/refs/tags/v3.tar.gz"
  sha256 "bb63f09f2c71ce492745050cefebabcbc57d7154988fe3ef28a9f5e494fc1374"
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
    ENV["SN_RELEASE"] = "size"
    system "sbt", "set ThisBuild/version := \"#{version}\"", "plutus/nativeLink"
    bin.install "plutus/target/plutus-out" => "plutus"
  end
end
