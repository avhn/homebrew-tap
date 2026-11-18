# Install the CLI and helper from the matching platform's verified release archive.
class Fortix < Formula
  desc "FortiGate SSL VPN profile manager with a CLI and desktop tray"
  homepage "https://github.com/avhn/fortix"
  version "1.0.6"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v1.0.6/fortix_1.0.6_darwin_arm64.tar.gz"
      sha256 "2825384b8758b8acfc8beec6c75f30f0862692bd02e96379744711298e8b0d6c"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v1.0.6/fortix_1.0.6_darwin_amd64.tar.gz"
      sha256 "5d130fa9bdfeca44fdf7de1f39be611cfe33029620a739643a69c128e69a9645"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v1.0.6/fortix_1.0.6_linux_arm64.tar.gz"
      sha256 "4646ca590061e1dd141652faa48fc564b2f41f94bd9a5536990db204fc357378"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v1.0.6/fortix_1.0.6_linux_amd64.tar.gz"
      sha256 "5ff8a65a832fc5506d820f8b1aecda7c92a724b7efe901593017e647978e7035"
    end
  end

  # Archives have no separate pinentry binary; helper installation creates its link.
  def install
    bin.install "fortix", "fortix-helper"
  end

  # Privileged installation is explicit; native gateways need no optional backend.
  def caveats
    <<~EOS
      Run sudo "#{opt_bin}/fortix-helper" install once to install the privileged helper.
      openfortivpn is optional, only for second-factor gateways:
        brew install openfortivpn
    EOS
  end

  # Version reporting exercises the CLI without installing or contacting the helper.
  test do
    system "#{bin}/fortix", "version"
  end
end
