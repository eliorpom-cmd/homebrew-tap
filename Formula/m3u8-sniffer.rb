class M3u8Sniffer < Formula
  desc "Chrome extension that finds the m3u8 video in a tab and downloads it"
  homepage "https://github.com/eliorpom-cmd/m3u8-sniffer"
  url "https://github.com/eliorpom-cmd/m3u8-sniffer/archive/refs/tags/v2.2.1.tar.gz"
  sha256 "feafc7af87fe97769c14c4342a62a14f56ee7f53a0be1059e876261a73f9d1c9"
  license "MIT"

  depends_on "ffmpeg"
  depends_on :macos
  depends_on "python@3.13"
  depends_on "yt-dlp"

  def install
    libexec.install "extension", "host", "install-host.sh", "m3u8-dl.sh"
    python = formula_opt_bin("python@3.13")/"python3.13"
    # Chrome's manifest points at opt_libexec, which survives upgrades: the launcher is part of the keg
    (libexec/"host/m3u8_host.sh").write <<~SH
      #!/bin/sh
      exec "#{python}" "#{opt_libexec}/host/m3u8_host.py" "$@"
    SH
    chmod 0755, libexec/"host/m3u8_host.sh"
    (bin/"m3u8-sniffer-setup").write <<~SH
      #!/bin/sh
      M3U8_PYTHON="#{python}" exec /bin/zsh "#{opt_libexec}/install-host.sh" "$@"
    SH
  end

  def caveats
    <<~EOS
      Register the downloader with Chrome (once):
        m3u8-sniffer-setup
      Then in chrome://extensions, turn on Developer mode, click "Load unpacked" and choose:
        #{opt_libexec}/extension
    EOS
  end

  test do
    assert_path_exists libexec/"extension/manifest.json"
    msg = '{"action":"series"}'
    out = pipe_output(libexec/"host/m3u8_host.sh", [msg.bytesize].pack("V") + msg)
    assert_match "series", out
  end
end
