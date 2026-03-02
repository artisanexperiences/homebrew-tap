class Arbor < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/artisanexperiences/arbor"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.13.0/arbor-0.13.0-darwin_arm64.tar.gz"
      sha256 "5131bb3f9d8e424a777aec45e7139893a88199edaa396ba881d1079a954fc678"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.13.0/arbor-0.13.0-darwin_amd64.tar.gz"
      sha256 "4c61ff78029bfd6bd0ba27d2848ba785b24805cea22fa3aacf48be5122c86d29"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.13.0/arbor-0.13.0-linux_arm64.tar.gz"
      sha256 "766ef0c3da0abef95614681c214d8ce529243b7c8bf9b93aea61a68b7ed87788"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.13.0/arbor-0.13.0-linux_amd64.tar.gz"
      sha256 "169d1559ba8690bdece8a839eb34db7db32fda26477b7481840e40d6b7675fc4"
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
