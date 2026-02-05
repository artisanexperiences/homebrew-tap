class Arbor < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/artisanexperiences/arbor"
  version "0.10.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.10.1/arbor-0.10.1-darwin_arm64.tar.gz"
      sha256 "0b431ff37d4c0f26d768e806a5e040c72e519795dd91908dc5286e9e98319251"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.10.1/arbor-0.10.1-darwin_amd64.tar.gz"
      sha256 "6a29ac5badb30782676acaa3d97b534eefdd0d270b973a1dbd10e0d6ecc89ca4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.10.1/arbor-0.10.1-linux_arm64.tar.gz"
      sha256 "7ec5ccaa4224e080723c80e930cbf9f11a8167d6e02d576b43825e3aa923acbf"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.10.1/arbor-0.10.1-linux_amd64.tar.gz"
      sha256 "5e546cd4e28b91d5daa9861d08eb3601bfa52dd986e6ea0fc692051f3d44de37"
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
