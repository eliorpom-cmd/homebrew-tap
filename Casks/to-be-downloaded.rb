cask "to-be-downloaded" do
  version "1.1.0"
  sha256 "e9bc43eaf393a0c103273ef2ae443f8ee3241519bc483c268b66a2e30364fec8"

  url "https://github.com/eliorpom-cmd/to-be-downloaded/releases/download/v#{version}/TBD-#{version}-macos.zip",
      verified: "github.com/eliorpom-cmd/to-be-downloaded/"
  name "TBD - To Be Downloaded"
  name "TBD"
  desc "Downloads YouTube video and audio, with a LAN web remote"
  homepage "https://github.com/eliorpom-cmd/to-be-downloaded"

  # The app updates itself (Ed25519-signed releases), so Homebrew shouldn't
  # worry about seeing a newer version than its own.
  auto_updates true
  # A bare symbol means "this version or newer". The ">= :ventura" string form
  # is deprecated since Homebrew 6 and warns on every tap.
  depends_on macos: :ventura

  # Installed with the full name: Spotlight indexes an app by its FILE NAME
  # and ignores CFBundleDisplayName. Under "TBD.app" the app would be unfound
  # searching for "to be downloaded".
  # Lowercase "downloaded" on purpose: this is an existing path on other
  # people's disks, not a label. Renaming it is how you give someone two apps.
  app "TBD.app", target: "TBD - To be downloaded.app"

  caveats <<~EOS
    This app is signed ad-hoc and is not notarised by Apple, so macOS
    quarantines it and refuses to open it. Homebrew dropped --no-quarantine in
    5.1, so the attribute has to come off by hand, once:

      xattr -dr com.apple.quarantine "/Applications/TBD - To be downloaded.app"

    Updates afterwards are automatic and are verified against the developer's
    Ed25519 key before anything is installed.
  EOS

  zap trash: [
    "~/Library/Application Support/TBD",
    "~/Library/Preferences/com.byelior.tbd.plist",
    "~/Library/Saved Application State/com.byelior.tbd.savedState",
  ]
end
