cask "lumac" do
  version "0.2"
  sha256 "bcb1fd4383cd89ec0781a32f501bbf7ce569cfc8d80d55ff11596388f7da395b"

  url "https://github.com/eliorpom-cmd/lumac/releases/download/v#{version}/Lumac-#{version}.zip"
  name "Lumac"
  desc "Sleeps a MacBook when its lid closes with an external display connected"
  homepage "https://github.com/eliorpom-cmd/lumac"

  depends_on macos: :sonoma

  app "Lumac.app"

  zap trash: "~/Library/Preferences/dev.byelior.lumac.plist"
end
