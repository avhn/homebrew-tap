# Install the CLI and helper from the matching platform's verified release archive.
class Fortix < Formula
  desc "FortiGate SSL VPN profile manager with a CLI and desktop tray"
  homepage "https://github.com/avhn/fortix"
  version "0.3.1"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v0.3.1/fortix_0.3.1_darwin_arm64.tar.gz"
      sha256 "4e7e82b4451bfab9e60ae80753cde1bf335d2c4dc51e44be6114940c78a55ff6"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v0.3.1/fortix_0.3.1_darwin_amd64.tar.gz"
      sha256 "12f020ff18231a3679ba6fb33c0079fd65ef8754e86c80aa1596d1e0587f0851"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v0.3.1/fortix_0.3.1_linux_arm64.tar.gz"
      sha256 "369c1ba1a4526f5a2ecae72c970ff89c4a1feb85d02c56b3190b34326e8591fe"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v0.3.1/fortix_0.3.1_linux_amd64.tar.gz"
      sha256 "695d74bbcd9965c55261ab38c712bdb169e06b2e560bdb4faa250af0df9bf864"
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
