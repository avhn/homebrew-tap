# Install the CLI and helper from the matching platform's verified release archive.
class Fortix < Formula
  desc "FortiGate SSL VPN profile manager with a CLI and desktop tray"
  homepage "https://github.com/avhn/fortix"
  version "1.0.1"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v1.0.1/fortix_1.0.1_darwin_arm64.tar.gz"
      sha256 "76cb612bdef2106fee920af0bd6ac9898205fde2f95585c2a9816cc51a8c6cfa"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v1.0.1/fortix_1.0.1_darwin_amd64.tar.gz"
      sha256 "1e1fa9b6866f30b85f314fabe038e65ac26f8ebad9ff41b0ec869f3b6f64d703"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v1.0.1/fortix_1.0.1_linux_arm64.tar.gz"
      sha256 "46f0b68a8943e51ff3616efcab10bc4139e263750f9a18fac1d1b2889c284008"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v1.0.1/fortix_1.0.1_linux_amd64.tar.gz"
      sha256 "b4430bdd1bc494aede7595917b6542c63423171e505b0a2d680dd13f66629aca"
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
