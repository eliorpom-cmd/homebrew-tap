cask "lumac" do
  version "1.0"
  sha256 "584262ab953c7ce541ba2b60149da8a2eb43d8f9796e15e9a39f33cd008e33f0"

  url "https://github.com/eliorpom-cmd/lumac/releases/download/v#{version}/Lumac-#{version}.zip"
  name "Lumac"
  desc "Sleeps a MacBook when its lid closes with an external display connected"
  homepage "https://lumac.byelior.dev"

  depends_on macos: :sonoma

  app "Lumac.app"

  zap trash: "~/Library/Preferences/dev.byelior.lumac.plist"
end
