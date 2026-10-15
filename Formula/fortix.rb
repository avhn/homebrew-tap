# Install the CLI and helper from the matching platform's verified release archive.
class Fortix < Formula
  desc "FortiGate SSL VPN profile manager with a CLI and desktop tray"
  homepage "https://github.com/avhn/fortix"
  version "1.0.3"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v1.0.3/fortix_1.0.3_darwin_arm64.tar.gz"
      sha256 "24af14d7502446bbbd067bfe8b9a12399d479420935f6ebd2297f0bb6a3eccb3"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v1.0.3/fortix_1.0.3_darwin_amd64.tar.gz"
      sha256 "dd57959442ea17182251e8c8f53145fe5af322969e4b350005a258d7f5c9a916"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v1.0.3/fortix_1.0.3_linux_arm64.tar.gz"
      sha256 "ebb36eaf8403de173d67da338b154dda83b4f1c2c2f3bda07c528274b62ef8be"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v1.0.3/fortix_1.0.3_linux_amd64.tar.gz"
      sha256 "2d3198720c9760b007497d79abb9c4b98a4cef2f3d7a24ff8b8dca7318f2cb6a"
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
