# Homebrew formula for bm — GENERATED CONTENT, DO NOT EDIT BY HAND.
# Source of truth: limmytian/bm repo (.github/homebrew/bm.rb.template).
# The release workflow renders version + sha256 and pushes updates here.
class Bm < Formula
  desc "Browser profile and session sandbox manager for Chrome and Edge"
  homepage "https://github.com/limmytian/bm"
  version "0.0.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/limmytian/bm/releases/download/v0.0.7/bm-0.0.7-darwin-arm64.tar.gz"
      sha256 "1f61c9714f33565944e1ef000a469bbdddae40585b28c7782cf3298f45701b85"
    else
      url "https://github.com/limmytian/bm/releases/download/v0.0.7/bm-0.0.7-darwin-x64.tar.gz"
      sha256 "da3cac3065d24b8e800216648faa6bedc619e7ce944dc129d2276f574631a571"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/limmytian/bm/releases/download/v0.0.7/bm-0.0.7-linux-arm64.tar.gz"
      sha256 "ba25f82e7342448879bcd4c55ed8be60cfcfd6c7c23e71e8dfdd24001a29575c"
    elsif Hardware::CPU.intel?
      url "https://github.com/limmytian/bm/releases/download/v0.0.7/bm-0.0.7-linux-x64.tar.gz"
      sha256 "fa50fda009e8b808a2606a547e0e997fc7cd5ec75163f1899fc2ca29a2ec8880"
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
        bm proxy set work --server socks5://127.0.0.1:1080   # Per-profile egress proxy
    EOS
  end

  test do
    assert_match "bm #{version}", shell_output("#{bin}/bm --version")
  end
end
