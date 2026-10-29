# Homebrew formula for bm — GENERATED CONTENT, DO NOT EDIT BY HAND.
# Source of truth: limmytian/bm repo (.github/homebrew/bm.rb.template).
# The release workflow renders version + sha256 and pushes updates here.
class Bm < Formula
  desc "Browser profile and session sandbox manager for Chrome and Edge"
  homepage "https://github.com/limmytian/bm"
  version "0.0.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/limmytian/bm/releases/download/v0.0.9/bm-0.0.9-darwin-arm64.tar.gz"
      sha256 "6afc158ef088268ca54b28020ec0c19236d529eae959e4e0fb70f23ae8fa8e57"
    else
      url "https://github.com/limmytian/bm/releases/download/v0.0.9/bm-0.0.9-darwin-x64.tar.gz"
      sha256 "41cf12d6d08540f0e98a1197df62a7f9172812b499d65fbfdf04249680777910"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/limmytian/bm/releases/download/v0.0.9/bm-0.0.9-linux-arm64.tar.gz"
      sha256 "5625b1add06f0109f17cd5f0233f98e8edfeaa66c158bcbe5287e8c0f91e9247"
    elsif Hardware::CPU.intel?
      url "https://github.com/limmytian/bm/releases/download/v0.0.9/bm-0.0.9-linux-x64.tar.gz"
      sha256 "e41af2e2ac5f1b391bdd4470f54cb568c7f9d084e8aa0c030fbe6e57d9b151ea"
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
