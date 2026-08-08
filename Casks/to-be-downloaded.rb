cask "to-be-downloaded" do
  version "1.0.0"
  sha256 "261d6ed40a40e0a3df58804039bcdbeb8d289bf3b38ded288974413b6e4b1a10"

  url "https://github.com/eliorpom-cmd/to-be-downloaded/releases/download/v#{version}/TBD-#{version}-macos.zip",
      verified: "github.com/eliorpom-cmd/to-be-downloaded/"
  name "TBD - To be downloaded"
  name "TBD"
  desc "Downloads YouTube video and audio, with a LAN web remote"
  homepage "https://github.com/eliorpom-cmd/to-be-downloaded"

  # The app updates itself (Ed25519-signed releases), so Homebrew shouldn't
  # worry about seeing a newer version than its own.
  auto_updates true
  depends_on macos: ">= :ventura"

  # Installed with the full name: Spotlight indexes an app by its FILE NAME
  # and ignores CFBundleDisplayName. Under "TBD.app" the app would be unfound
  # searching for "to be downloaded".
  app "TBD.app", target: "TBD - To be downloaded.app"

  caveats <<~EOS
    This app is signed ad-hoc, not notarised by Apple, so install it with
    --no-quarantine (otherwise macOS refuses to open it):

      brew install --cask --no-quarantine eliorpom-cmd/tap/to-be-downloaded

    Updates afterwards are automatic and are verified against the developer's
    Ed25519 key before anything is installed.
  EOS

  zap trash: [
    "~/Library/Application Support/TBD",
    "~/Library/Preferences/com.byelior.tbd.plist",
    "~/Library/Saved Application State/com.byelior.tbd.savedState",
  ]
end
