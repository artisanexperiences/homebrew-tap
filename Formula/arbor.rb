class Arbor < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/artisanexperiences/arbor"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.11.0/arbor-0.11.0-darwin_arm64.tar.gz"
      sha256 "20e25def282c4c582c374f97ff4ce88d4ebc5965cb39894ed432f02d3b3107b0"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.11.0/arbor-0.11.0-darwin_amd64.tar.gz"
      sha256 "2b263f6013394333592c729a41cb5a9aff4d5303823dd89224370c78a3fd8067"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.11.0/arbor-0.11.0-linux_arm64.tar.gz"
      sha256 "e3c7024f5de65f9715e41b8e9721a9fc8527c7fd609ee5e66acb4ed006355dfc"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.11.0/arbor-0.11.0-linux_amd64.tar.gz"
      sha256 "2dfc78c6ed46d8a0268066cd85a62497a24ffa09eb8b4e88d54914e161e85f65"
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
