class Arbor < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/artisanexperiences/arbor"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.12.0/arbor-0.12.0-darwin_arm64.tar.gz"
      sha256 "6a64516f51063c3bb1c672300ddbebbf6e2119918f94ea8fc581904a4c4c5694"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.12.0/arbor-0.12.0-darwin_amd64.tar.gz"
      sha256 "bd501fca180dab10b9e559eb0efa28d5d45b8e64fde87fbbb28f819edc7b9def"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.12.0/arbor-0.12.0-linux_arm64.tar.gz"
      sha256 "42ca517a9b055f0a4921c29f97107b5bef6fd049856e52ded5a750d5be7d2180"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.12.0/arbor-0.12.0-linux_amd64.tar.gz"
      sha256 "862a67b39cdcc015be53f5cb28f1e9830f01e2120db831319c038b60e3590839"
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
