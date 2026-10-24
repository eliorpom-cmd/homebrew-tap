class Arsene < Formula
  desc "Pseudonymises French text before it reaches ChatGPT or Claude"
  homepage "https://github.com/eliorpom-cmd/arsene"
  url "https://github.com/eliorpom-cmd/arsene/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d0d617f6afbab81c0ecdc9d1a481d65a99ba9a03456c6f182fe8d79e3a42af09"
  license "AGPL-3.0-only"

  depends_on :macos
  depends_on "uv"

  def install
    libexec.install Dir["*"]
    # The scripts locate their files from their own path: wrappers, not symlinks
    { "arsene-setup" => "install.sh", "arsene-uninstall" => "uninstall.sh" }.each do |cmd, script|
      (bin/cmd).write <<~SH
        #!/bin/bash
        exec "#{opt_libexec}/#{script}" "$@"
      SH
    end
  end

  def caveats
    <<~EOS
      Install the engine and the detection model (about 1 GB, in
      ~/Library/Application Support/Pseudonymiseur), then register it with Chrome:
        arsene-setup
      Run it again after each `brew upgrade arsene`. To remove the engine: arsene-uninstall
    EOS
  end

  test do
    assert_path_exists libexec/"install.sh"
  end
end
