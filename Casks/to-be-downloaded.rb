cask "to-be-downloaded" do
  version "1.3.0"
  sha256 "30adc63c702c8f83b32f1b8ecba5c248a3ae523325f9c3efa61deb6202d07387"

  # No "verified" stanza: Homebrew 7 deprecates it and warns on every command
  # that touches the cask. It existed to vouch for a URL whose host does not
  # match the homepage; here they are the same GitHub repository, which is
  # exactly the case the default verification already covers.
  url "https://github.com/eliorpom-cmd/to-be-downloaded/releases/download/v#{version}/TBD-#{version}-macos.zip"
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

  zap trash: [
    "~/Library/Application Support/TBD",
    "~/Library/Preferences/com.byelior.tbd.plist",
    "~/Library/Saved Application State/com.byelior.tbd.savedState",
  ]
end
