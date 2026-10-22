# Install the CLI and helper from the matching platform's verified release archive.
class Fortix < Formula
  desc "FortiGate SSL VPN profile manager with a CLI and desktop tray"
  homepage "https://github.com/avhn/fortix"
  version "1.0.5"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v1.0.5/fortix_1.0.5_darwin_arm64.tar.gz"
      sha256 "3caebe2de1940c622edcc8c96438c276148ef5e60152ad7f5663bbc346574917"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v1.0.5/fortix_1.0.5_darwin_amd64.tar.gz"
      sha256 "822be02d591f3df6f6bf00e9f7f118b5aaffa19b466b52c868afe0a1d515e88a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v1.0.5/fortix_1.0.5_linux_arm64.tar.gz"
      sha256 "b0ba73d4eec3b93f123ffce5d2c0e859b7b52b9c97c62a85d248b2f3d4a53d34"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v1.0.5/fortix_1.0.5_linux_amd64.tar.gz"
      sha256 "5e407499e93ae0d02186f55b927a634a9a25799815c6f9006e803f965d13497f"
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
