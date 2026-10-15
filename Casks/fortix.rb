# Install the arm64 app without removing machine-wide helper state on cask removal.
cask "fortix" do
  version "1.0.2"
  sha256 "e1a400deffe5bd2ba473150880432bda459fc3201e04e6b3e986d4f96833986b"

  url "https://github.com/avhn/fortix/releases/download/v1.0.2/fortix_1.0.2_darwin_arm64.dmg"
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
