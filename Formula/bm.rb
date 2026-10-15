class Bm < Formula
  desc "Browser profile and session sandbox manager for Chrome and Edge"
  homepage "https://github.com/limmytian/bm"
  version "0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/limmytian/bm/releases/download/v0.0.2/bm-0.0.2-darwin-arm64.tar.gz"
      sha256 "187604aacabe795502109f7976d5e6161bc56c8b457877a50059e9d6b785b0cc"
    else
      url "https://github.com/limmytian/bm/releases/download/v0.0.2/bm-0.0.2-darwin-x64.tar.gz"
      sha256 "97b823977ae3fc4c3f3a590af939301c84948c7876c66611cc83749b9b0bef1f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/limmytian/bm/releases/download/v0.0.2/bm-0.0.2-linux-x64.tar.gz"
      sha256 "73699a05494cffe605957378594c937af2dec967a431ed7789e61319ab2e9fd2"
    end
  end

  def install
    bin.install "bm"
  end

  def caveats
    <<~EOS
      bm v#{version} installed successfully!

      Quick start:
        bm list                    # List all managed profiles
        bm create work             # Create a clean isolated profile
        bm switch work             # Activate profile via symlink (conda-like)
        bm shortcut work           # Generate standalone desktop launcher
    EOS
  end

  test do
    assert_match "bm #{version}", shell_output("#{bin}/bm --version")
  end
end
