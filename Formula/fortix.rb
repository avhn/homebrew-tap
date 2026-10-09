# Install the CLI and helper from the matching platform's verified release archive.
class Fortix < Formula
  desc "FortiGate SSL VPN profile manager with a CLI and desktop tray"
  homepage "https://github.com/avhn/fortix"
  version "0.2.1"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v0.2.1/fortix_0.2.1_darwin_arm64.tar.gz"
      sha256 "2991c8dbbb9a51e853254a9fa1f3b9956270cb9c1c277ed17c3ea90b6f8e4b84"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v0.2.1/fortix_0.2.1_darwin_amd64.tar.gz"
      sha256 "62d0e199b53bc813d02591c854a4d0439468b4a28495805cc4d8df8b06e5dd23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v0.2.1/fortix_0.2.1_linux_arm64.tar.gz"
      sha256 "d2e342422e3dd56dbf8f74861f6298c8444b0187bac0d472322b62d122f9c862"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v0.2.1/fortix_0.2.1_linux_amd64.tar.gz"
      sha256 "a122c3d3cbe28db8506ddebbf921e3283b15278603c78196fc28f2c164bc6906"
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
