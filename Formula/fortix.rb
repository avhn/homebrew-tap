# Install the CLI and helper from the matching platform's verified release archive.
class Fortix < Formula
  desc "FortiGate SSL VPN profile manager with a CLI and desktop tray"
  homepage "https://github.com/avhn/fortix"
  version "1.0.4"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v1.0.4/fortix_1.0.4_darwin_arm64.tar.gz"
      sha256 "2774f113887caee3c3d9168a62c921cc12f2972f3deeab987ef44c7814881edf"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v1.0.4/fortix_1.0.4_darwin_amd64.tar.gz"
      sha256 "d333baf8899e597619b513089beb49470826257e89da08564621d55ae0c0ba97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v1.0.4/fortix_1.0.4_linux_arm64.tar.gz"
      sha256 "bb9212b3ebd0b597233a9aac0fe75adb017bce9f0254e12dbc1035cae604f7e3"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v1.0.4/fortix_1.0.4_linux_amd64.tar.gz"
      sha256 "f8bf505a57b3cea2a9d2c27d2c54c237b7a42539f41cb3d547fcec3272f3a2d0"
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
