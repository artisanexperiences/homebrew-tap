class Arbor < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/artisanexperiences/arbor"
  version "0.13.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.13.1/arbor-0.13.1-darwin_arm64.tar.gz"
      sha256 "0747033dd03f648ee4ca71fdad74cf10614ef359f61453d4c059e269a508eb43"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.13.1/arbor-0.13.1-darwin_amd64.tar.gz"
      sha256 "4801601941b97074bb9e823ea27b4a528b8394a4bf2ea87b1670ab3ae8e6fa5a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.13.1/arbor-0.13.1-linux_arm64.tar.gz"
      sha256 "db6ca2e580e36aecfd057e66d4fc3c81bf350aa371da78780001ed5b549e2298"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.13.1/arbor-0.13.1-linux_amd64.tar.gz"
      sha256 "9ff03ebf7c056024c83a6f397c890aeb2820e8d6c8960c11a70d1a43a7221e9c"
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
