class Arbor < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/artisanexperiences/arbor"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.10.0/arbor-0.10.0-darwin_arm64.tar.gz"
      sha256 "a647172c406a0bede90d44aa02ec7f8dd1e7be851dc7c90b18382b5376b10e64"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.10.0/arbor-0.10.0-darwin_amd64.tar.gz"
      sha256 "b7f9a29c1744e039c308c81195bde6bd8db91827e2b2aa30a6367afba8740a64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.10.0/arbor-0.10.0-linux_arm64.tar.gz"
      sha256 "69c8f298e91043e01a8453f11cf476bab51c3508270a1dbcbd85eb961d1d4ca7"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.10.0/arbor-0.10.0-linux_amd64.tar.gz"
      sha256 "48ef14431a27b8364e7d1e8ab3e9b72e2b21869f73522742d98ba3135bc360ce"
    end
  end

  def install
    bin.install "arbor-#{version}-darwin_arm64" => "arbor" if OS.mac? && Hardware::CPU.arm?
    bin.install "arbor-#{version}-darwin_amd64" => "arbor" if OS.mac? && Hardware::CPU.intel?
    bin.install "arbor-#{version}-linux_arm64" => "arbor" if OS.linux? && Hardware::CPU.arm?
    bin.install "arbor-#{version}-linux_amd64" => "arbor" if OS.linux? && Hardware::CPU.intel?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/arbor version")
  end
end
