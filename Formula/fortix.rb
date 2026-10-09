# Install the CLI and helper from the matching platform's verified release archive.
class Fortix < Formula
  desc "FortiGate SSL VPN profile manager with a CLI and desktop tray"
  homepage "https://github.com/avhn/fortix"
  version "0.2.2"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v0.2.2/fortix_0.2.2_darwin_arm64.tar.gz"
      sha256 "2757cfbfefb19d6e6bdb84cb7e021553ae244731eca6de5c4bbb787a665a1338"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v0.2.2/fortix_0.2.2_darwin_amd64.tar.gz"
      sha256 "09b05241bbb30725ef551916fae9f4cf992cd50649b292e1e9710ff822797eb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v0.2.2/fortix_0.2.2_linux_arm64.tar.gz"
      sha256 "b52704f30d1173b4949a1a1fc41991c5a218e57cdc5cceb33298e889719bdcac"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v0.2.2/fortix_0.2.2_linux_amd64.tar.gz"
      sha256 "42297a1b8febb30d51f506d1ceea616ba36f7301b7784fbb7087ef011619bb4c"
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
