# Install the CLI and helper from the matching platform's verified release archive.
class Fortix < Formula
  desc "FortiGate SSL VPN profile manager with a CLI and desktop tray"
  homepage "https://github.com/avhn/fortix"
  version "1.0.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v1.0.0/fortix_1.0.0_darwin_arm64.tar.gz"
      sha256 "ad6c23e03764c4f2db508e3cbf7154500bfcace8be4befea949ce6ed4f9c3097"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v1.0.0/fortix_1.0.0_darwin_amd64.tar.gz"
      sha256 "b12e81f04be826feda0d29c3ed092cd192daac7283017c528201a8695ce2975d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avhn/fortix/releases/download/v1.0.0/fortix_1.0.0_linux_arm64.tar.gz"
      sha256 "aa0da8acaaa392eef60849e27b37244f1c460145a814dad8f2c7fe74a24a8326"
    end
    on_intel do
      url "https://github.com/avhn/fortix/releases/download/v1.0.0/fortix_1.0.0_linux_amd64.tar.gz"
      sha256 "a9f8ae138d1c785d441c09980710c1ec469043962853fd1b481c9d53d73c5a85"
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
