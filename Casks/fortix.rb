# Install the arm64 app without removing machine-wide helper state on cask removal.
cask "fortix" do
  version "0.3.1"
  sha256 "98215b970852258f2f83617a555185de5ef5db3155c60933787d5c4572009df4"

  url "https://github.com/avhn/fortix/releases/download/v0.3.1/fortix_0.3.1_darwin_arm64.dmg"
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
