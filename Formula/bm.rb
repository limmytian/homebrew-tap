class Bm < Formula
  desc "Browser profile and session sandbox manager for Chrome and Edge"
  homepage "https://github.com/limmytian/bm"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/limmytian/bm/releases/download/v0.0.1/bm-0.0.1-darwin-arm64.tar.gz"
      sha256 "671864706717374b8fe16806859d561bf2244bdbebc5775ad7a1bad87f07136d"
    else
      url "https://github.com/limmytian/bm/releases/download/v0.0.1/bm-0.0.1-darwin-x64.tar.gz"
      sha256 "2573d5642d0aeb97eb6dbf944f1f5592913e215c1458e703b359bfd7dc3d535e"
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
