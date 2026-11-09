class GitCredit < Formula
  desc "Fair git authorship stats"
  homepage "https://github.com/avhn/git-credit"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/avhn/git-credit/releases/download/v0.1.1/git-credit-aarch64-apple-darwin.tar.gz"
      sha256 "627d7278b5c1a826fbdf9d0d7906c0ea1d1c3311228d1b495ecb52e240d502ef"
    end
    on_intel do
      url "https://github.com/avhn/git-credit/releases/download/v0.1.1/git-credit-x86_64-apple-darwin.tar.gz"
      sha256 "68dbe4450ec380f6900d5e1d7de4a106828fecf859161d4a9983c6703f2d2380"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avhn/git-credit/releases/download/v0.1.1/git-credit-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8df36336501a22de5c7928b82a2248de2a47f06bd05758a247e544ace9ff42ba"
    end
    on_intel do
      url "https://github.com/avhn/git-credit/releases/download/v0.1.1/git-credit-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8f744e733b8fc38da10e066ef01e712c3206639cf358fe67a1ca4eef4be066e2"
    end
  end

  def install
    bin.install "git-credit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-credit --version")
  end
end
