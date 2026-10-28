# Homebrew formula for bm — GENERATED CONTENT, DO NOT EDIT BY HAND.
# Source of truth: limmytian/bm repo (.github/homebrew/bm.rb.template).
# The release workflow renders version + sha256 and pushes updates here.
class Bm < Formula
  desc "Browser profile and session sandbox manager for Chrome and Edge"
  homepage "https://github.com/limmytian/bm"
  version "0.0.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/limmytian/bm/releases/download/v0.0.8/bm-0.0.8-darwin-arm64.tar.gz"
      sha256 "0880a5afaf26c976ed976fb05e9381175972d08868a1e287af0e25184fe958b6"
    else
      url "https://github.com/limmytian/bm/releases/download/v0.0.8/bm-0.0.8-darwin-x64.tar.gz"
      sha256 "bc4bbcf16ae742861e41a89b05cc3085c031da27064528e5016789a58b041435"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/limmytian/bm/releases/download/v0.0.8/bm-0.0.8-linux-arm64.tar.gz"
      sha256 "fac397e39e805208edf1a7d76abdb4bb531cce90d40071ce6e0a82b715508378"
    elsif Hardware::CPU.intel?
      url "https://github.com/limmytian/bm/releases/download/v0.0.8/bm-0.0.8-linux-x64.tar.gz"
      sha256 "7988721fa5ffc33c995e6fc9f435f72f95eab3759fd15ed550b8e8db4eee3fd8"
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
