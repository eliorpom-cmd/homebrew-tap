cask "claude-bounce" do
  version "1.0.1"
  sha256 "bc2a565dcfbf2cd9bc638290e200c8a287658c4ddcb1e6ebfa9d288723e9d689"

  url "https://github.com/eliorpom-cmd/claude-bounce/releases/download/v#{version}/ClaudeBounce-#{version}.dmg"
  name "Claude Bounce"
  desc "Bounces your editor's Dock icon when Claude Code finishes a task"
  homepage "https://github.com/eliorpom-cmd/claude-bounce"

  depends_on macos: :ventura

  app "Claude Bounce.app"

  # The setup edits ~/.claude/settings.json and installs a VS Code extension: the user runs it,
  # not the cask, so nothing in their config changes without them asking.
  caveats <<~EOS
    Run the setup once, which registers the Claude Code hooks and the VS Code extension:
      "#{appdir}/Claude Bounce.app/Contents/Resources/setup.sh"
    Before `brew uninstall`, remove the hooks and the extension with:
      "#{appdir}/Claude Bounce.app/Contents/Resources/uninstall.sh"
  EOS
end
