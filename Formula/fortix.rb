# Install the CLI and helper from the matching platform's verified release archive.
class Fortix < Formula
  desc "FortiGate SSL VPN profile manager with a CLI and desktop tray"
  homepage "https://github.com/avhn/fortix"
  version "0.3.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v0.3.0/fortix_0.3.0_darwin_arm64.tar.gz"
      sha256 "f555c3dd83048805e0cef047c2a024a0e44c472d2daac1adc6c7c05327af973f"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v0.3.0/fortix_0.3.0_darwin_amd64.tar.gz"
      sha256 "c7f8710b73521fc6068a40e382adcdface8e2ff0652d539cd34e4ec20a3e52c8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v0.3.0/fortix_0.3.0_linux_arm64.tar.gz"
      sha256 "1c1071ea610cebff4cc16d7f739f7b704004d291a434a710827ecb9818d1a3e8"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v0.3.0/fortix_0.3.0_linux_amd64.tar.gz"
      sha256 "e3681fac660ee3ba210418b2620c01a169fa4b004168ad0adddfdddb6fbc6e30"
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
