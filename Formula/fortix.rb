# Install the CLI and helper from the matching platform's verified release archive.
class Fortix < Formula
  desc "FortiGate SSL VPN profile manager with a CLI and desktop tray"
  homepage "https://github.com/avhn/fortix"
  version "1.0.2"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v1.0.2/fortix_1.0.2_darwin_arm64.tar.gz"
      sha256 "ac843aea276285add69c3bcc117cb372d6cbaeb65bf6225c9b1e3981d6cfeb1f"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v1.0.2/fortix_1.0.2_darwin_amd64.tar.gz"
      sha256 "65d3d3b8f701b60a34a65b0ef74646dbc2b3562f082d7a73e54c9abcfb5778da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v1.0.2/fortix_1.0.2_linux_arm64.tar.gz"
      sha256 "dcb0c1890ce9d34ff16624ce95eda1f4b176c484caa171cea4f523ff0efc975c"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v1.0.2/fortix_1.0.2_linux_amd64.tar.gz"
      sha256 "eaadb99099cec2c0751a9e329cd798d40312041e4ddbcef86a1833eb06c2594b"
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
