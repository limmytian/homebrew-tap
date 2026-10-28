# Homebrew formula for bm — GENERATED CONTENT, DO NOT EDIT BY HAND.
# Source of truth: limmytian/bm repo (.github/homebrew/bm.rb.template).
# The release workflow renders version + sha256 and pushes updates here.
class Bm < Formula
  desc "Browser profile and session sandbox manager for Chrome and Edge"
  homepage "https://github.com/limmytian/bm"
  version "0.0.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/limmytian/bm/releases/download/v0.0.6/bm-0.0.6-darwin-arm64.tar.gz"
      sha256 "64d46d83784c6c5e91472fdd82db905a2fbf1f024fad1955a8cf5e6ba3478efd"
    else
      url "https://github.com/limmytian/bm/releases/download/v0.0.6/bm-0.0.6-darwin-x64.tar.gz"
      sha256 "cfdc691e7458366bb4cac53f82e369f9f41965d59230faff7c816b61b8d5724b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/limmytian/bm/releases/download/v0.0.6/bm-0.0.6-linux-arm64.tar.gz"
      sha256 "8decfbe7b0dd1f474ba1949a7fce05c99bc8f3aad81a1f08f5f117b8b3c8636f"
    elsif Hardware::CPU.intel?
      url "https://github.com/limmytian/bm/releases/download/v0.0.6/bm-0.0.6-linux-x64.tar.gz"
      sha256 "149dbf5455472bc9b65257ce6033fa37abe54071fc2febb8695bdf335e2a94fe"
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
