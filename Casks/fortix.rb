# Install the arm64 app without removing machine-wide helper state on cask removal.
cask "fortix" do
  version "0.2.2"
  sha256 "aa054f327a5c784dac73cd051961d67f27ce2a302bfbc149ddfa9db15c6b323f"

  url "https://github.com/avhn/fortix/releases/download/v0.2.2/fortix_0.2.2_darwin_arm64.dmg"
  name "Fortix"
  desc "FortiGate SSL VPN profile manager with a CLI and desktop tray"
  homepage "https://github.com/avhn/fortix"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Fortix.app"

  caveats <<~EOS
    Fortix.app is ad-hoc signed, not notarized.
    After verifying the download, clear quarantine for this app only if needed:
      xattr -dr com.apple.quarantine /Applications/Fortix.app
    Use the app's own uninstall action to remove its privileged helper.
    Cask removal and zap never remove helper state or stored VPN profiles.
  EOS

  zap trash: "~/Library/Preferences/com.github.avhn.fortix.plist"
end
