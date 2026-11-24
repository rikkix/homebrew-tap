class Iprober < Formula
  desc "Identify services on open TCP ports"
  homepage "https://git.rikki.moe/rikki/iprober"
  version "0.1.0"

  on_macos do
    depends_on arch: :arm64
    url "https://git.rikki.moe/rikki/iprober/releases/download/v#{version}/iprober-#{version}-macos-arm64.tar.gz"
    sha256 "f3f94d461e09b055bf91921fd2739aef2f42ac939894ca7b49d12ccd07f7ad13"
  end

  on_linux do
    on_intel do
      url "https://git.rikki.moe/rikki/iprober/releases/download/v#{version}/iprober-#{version}-linux-amd64-musl.tar.gz"
      sha256 "d4541b7a84bd5681f3be7807e90a2fe949db06c207121c25c54c04194a5cebd1"
    end

    on_arm do
      url "https://git.rikki.moe/rikki/iprober/releases/download/v#{version}/iprober-#{version}-linux-arm64-musl.tar.gz"
      sha256 "befac7bab2c610d921e8e2eb28d171c939b927e116c001492895bedfed4cc00c"
    end
  end

  livecheck do
    url "https://git.rikki.moe/api/v1/repos/rikki/iprober/releases/latest"
    strategy :json do |json|
      json["tag_name"]&.delete_prefix("v")
    end
  end

  def install
    bin.install "iprober"
    pkgshare.install "licenses"
  end

  test do
    assert_match "iProber", shell_output("#{bin}/iprober --help")
  end
end
