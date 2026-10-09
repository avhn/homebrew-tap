# Install the CLI and helper from the matching platform's verified release archive.
class Fortix < Formula
  desc "FortiGate SSL VPN profile manager with a CLI and desktop tray"
  homepage "https://github.com/avhn/fortix"
  version "0.2.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v0.2.0/fortix_0.2.0_darwin_arm64.tar.gz"
      sha256 "560440e1a8c5686627570340647b349bdde883408b9386b1a90495e43582e887"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v0.2.0/fortix_0.2.0_darwin_amd64.tar.gz"
      sha256 "f4bf8c62707d520c3f9470427c58cfc3d42544075d4f98a5a699f3c5f6acdf4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v0.2.0/fortix_0.2.0_linux_arm64.tar.gz"
      sha256 "22136bb2b5659fc5adbf3fa14632eba41b40aa04cddaff9cfa70e639ac13a45f"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v0.2.0/fortix_0.2.0_linux_amd64.tar.gz"
      sha256 "059aa6b9abd09b768a873d359ed8a0bcad45927b79de0199de3b1860e5659cd5"
    end
  end

  # Archives have no separate pinentry binary; helper installation creates its link.
  def install
    bin.install "fortix", "fortix-helper"
  end

  # Privileged installation is explicit; native gateways need no optional backend.
  def caveats
    <<~EOS
      Run sudo fortix-helper install once to install the privileged helper.
      openfortivpn is optional, only for second-factor gateways:
        brew install openfortivpn
    EOS
  end

  # Version reporting exercises the CLI without installing or contacting the helper.
  test do
    system "#{bin}/fortix", "version"
  end
end
