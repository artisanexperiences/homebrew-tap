class Arbor < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/artisanexperiences/arbor"
  version "0.9.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.9.4/arbor-0.9.4-darwin_arm64.tar.gz"
      sha256 "04c2dfdd09cf3757ac34bc3b982fce38e73d094c961b0c0cf67423b01e543235"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.9.4/arbor-0.9.4-darwin_amd64.tar.gz"
      sha256 "31f149ff874640dc56992d990c37a7e87d7fe942ec573d58de2d87e3b3973694"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.9.4/arbor-0.9.4-linux_arm64.tar.gz"
      sha256 "0cad5b03906a5a490741a34d9456de32d4c9d604cf358ff68f995c19e75dcc5f"
    else
      url "https://github.com/artisanexperiences/arbor/releases/download/v0.9.4/arbor-0.9.4-linux_amd64.tar.gz"
      sha256 "05a818b0df7c60e5248a80c54b9449435f4afcae3ebb648ea165599d7630f487"
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
