class Arbor < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/artisanexperiences/arbor"
  version "0.9.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.9.2/arbor-0.9.2-darwin_arm64.tar.gz"
      sha256 "7a9e6bddbd82b0709df90b39d42ec59525786dd383b641e57d702af6161e55ef"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.9.2/arbor-0.9.2-darwin_amd64.tar.gz"
      sha256 "f09e197f82e7d475cedbb86ac8a0b45dd90c61a1155bf60366371299ae6631ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.9.2/arbor-0.9.2-linux_arm64.tar.gz"
      sha256 "1dc1ab9d7c31af0951cab091ebbdc87f742f2ad6a47db1d19abb0ebc8fdb5c24"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.9.2/arbor-0.9.2-linux_amd64.tar.gz"
      sha256 "54153ac19ff0f25334e933b0b3a0021e517b0bbcc44cba10d7996ee6cb94504c"
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
