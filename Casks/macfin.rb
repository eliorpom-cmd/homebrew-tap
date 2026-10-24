cask "macfin" do
  version "1.0"
  sha256 "0e02081a239969115ba6a2a935a48cb7ce6f2aefdbbba43dd8d7ea67d9aa0a3c"

  url "https://github.com/eliorpom-cmd/macfin/releases/download/v#{version}/Macfin-#{version}.zip"
  name "Macfin"
  desc "Native app for the movies and TV shows on a Jellyfin server"
  homepage "https://github.com/eliorpom-cmd/macfin"

  depends_on macos: :tahoe

  app "Macfin.app"

  zap trash: "~/Library/Containers/dev.byelior.macfin"
end
