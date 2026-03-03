class Arbor < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/artisanexperiences/arbor"
  version "0.13.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.13.2/arbor-0.13.2-darwin_arm64.tar.gz"
      sha256 "74e01b36de5e260bda98aa1f1ca27d19d10398b3cab3dc88db4c68f3a7143825"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.13.2/arbor-0.13.2-darwin_amd64.tar.gz"
      sha256 "ef19fdf064e1e719d8a67bbcc716646e79a4aa9de235202bef3dcb58879184cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.13.2/arbor-0.13.2-linux_arm64.tar.gz"
      sha256 "86e8c97e7d320552048402034f7ce47c4d433bda6db5c69ebb3563af40bcd1b2"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.13.2/arbor-0.13.2-linux_amd64.tar.gz"
      sha256 "804dfd1bf6a1164375576700eb0ba647b1bd8f966c29cafdf79e1d881157fb74"
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
