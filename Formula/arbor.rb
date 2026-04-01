class Arbor < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/artisanexperiences/arbor"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.14.0/arbor-0.14.0-darwin_arm64.tar.gz"
      sha256 "a5dedf565ee9b193a222644976c851d04e0350c410598623f9914bf9151f09dd"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.14.0/arbor-0.14.0-darwin_amd64.tar.gz"
      sha256 "4d101cd9181baf2fb4135111c786baa0c1a09ed28f600997487b84f17bdc4d85"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.14.0/arbor-0.14.0-linux_arm64.tar.gz"
      sha256 "87e9c01b275e70e0dcd7bc090d69d26caf3d88c7e97c43e34e5438265006ba65"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.14.0/arbor-0.14.0-linux_amd64.tar.gz"
      sha256 "24fe1a0246be508f39dddee0dd8c18e6cda7406144fef8ef3a9d833c67b7f22f"
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
