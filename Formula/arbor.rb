class Arbor < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/artisanexperiences/arbor"
  version "0.9.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.9.5/arbor-0.9.5-darwin_arm64.tar.gz"
      sha256 "e733c248b1efc56a03a9929d712bb7b0432d60edb9948ad7ea013639f639c2b1"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.9.5/arbor-0.9.5-darwin_amd64.tar.gz"
      sha256 "a2f4bfa9b030fd6c33eaaecf0aab5c74c8710cbbf8403bfde19a73901fbb3e49"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.9.5/arbor-0.9.5-linux_arm64.tar.gz"
      sha256 "38f21f7f78116886cd9de573e5a4419f207a164839c6ba74a0ff4eea068cda2e"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.9.5/arbor-0.9.5-linux_amd64.tar.gz"
      sha256 "3ab614a59bccda842c9225741672d0d5042ec56240cf23099a48d4fed69d03c8"
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
