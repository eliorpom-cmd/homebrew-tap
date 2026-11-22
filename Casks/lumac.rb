cask "lumac" do
  version "1.1"
  sha256 "bf8f23d41b74c4c4e95b1f69b07573c0ce1f7ebf0e64bef102d402a291028185"

  url "https://github.com/eliorpom-cmd/lumac/releases/download/v#{version}/Lumac-#{version}.zip"
  name "Lumac"
  desc "Sleeps a MacBook when its lid closes with an external display connected"
  homepage "https://lumac.byelior.dev"

  depends_on macos: :sonoma

  app "Lumac.app"

  zap trash: "~/Library/Preferences/dev.byelior.lumac.plist"
end
