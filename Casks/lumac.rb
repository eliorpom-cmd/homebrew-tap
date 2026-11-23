cask "lumac" do
  version "1.1.1"
  sha256 "5493649e1fb4934d86469cf3e3e8f569266a0b03878a183586d00a2755de5bd9"

  url "https://github.com/eliorpom-cmd/lumac/releases/download/v#{version}/Lumac-#{version}.zip"
  name "Lumac"
  desc "Sleeps a MacBook when its lid closes with an external display connected"
  homepage "https://lumac.byelior.dev"

  depends_on macos: :sonoma

  app "Lumac.app"

  zap trash: "~/Library/Preferences/dev.byelior.lumac.plist"
end
