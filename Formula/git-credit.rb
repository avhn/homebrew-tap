class GitCredit < Formula
  desc "Fair git authorship stats"
  homepage "https://github.com/avhn/git-credit"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/avhn/git-credit/releases/download/v0.2.0/git-credit-aarch64-apple-darwin.tar.gz"
      sha256 "2f927356034e093e364fbb092b313b627df8a5a00207157573ed53ebc8ac0dd6"
    end
    on_intel do
      url "https://github.com/avhn/git-credit/releases/download/v0.2.0/git-credit-x86_64-apple-darwin.tar.gz"
      sha256 "cc188ecb485e0599201a3e329f43ebb3a6a802ea1a28def7030b7c539b9b8daf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avhn/git-credit/releases/download/v0.2.0/git-credit-aarch64-unknown-linux-musl.tar.gz"
      sha256 "92eba50aab10de9e0a3df45e2d6176d1856c4050ed7be7ef17dae3ddaafb0453"
    end
    on_intel do
      url "https://github.com/avhn/git-credit/releases/download/v0.2.0/git-credit-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e7a63064ce69c113c380be0a0fe7d5fab26ed56937e21f78174a1088ffb49d9f"
    end
  end

  def install
    bin.install "git-credit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-credit --version")
  end
end
