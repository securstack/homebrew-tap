class Securstack < Formula
  desc "Run repository security scans and Shielding workflows"
  homepage "https://securstack.io"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.securstack.io/cli/v0.2.0/securstack-darwin-arm64", using: :nounzip
      sha256 "11174487ac03bd8e66b871cfbf8d8c5a22034499717badbf9b47e719d9c75ed3"
    else
      url "https://downloads.securstack.io/cli/v0.2.0/securstack-darwin-x64", using: :nounzip
      sha256 "7557a6adc26454d937d3018a9c899faa70b90494e3f311242bab06da77c27c7e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.securstack.io/cli/v0.2.0/securstack-linux-arm64", using: :nounzip
      sha256 "1bd6a5f46c9bd85d76dc90d471b589d5bf8dc22014cea97ad5b06c642d446c82"
    else
      url "https://downloads.securstack.io/cli/v0.2.0/securstack-linux-x64", using: :nounzip
      sha256 "58ddb645abb85a1923158b236168892a8b1d1876117d7aa39b60b757fc84006c"
    end
  end

  def install
    binary = Dir["securstack-*"].first
    bin.install binary => "securstack"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/securstack --version")
  end
end
