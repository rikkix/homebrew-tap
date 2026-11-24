class Iprober < Formula
  desc "Identify services on open TCP ports"
  homepage "https://git.rikki.moe/rikki/iprober"
  version "0.1.1"

  on_macos do
    depends_on arch: :arm64
    url "https://git.rikki.moe/rikki/iprober/releases/download/v#{version}/iprober-#{version}-macos-arm64.tar.gz"
    sha256 "ac1e3790d27177102503301a1ce496de66c28d0d70a0e5cb400b725eb45697ea"
  end

  on_linux do
    on_intel do
      url "https://git.rikki.moe/rikki/iprober/releases/download/v#{version}/iprober-#{version}-linux-amd64-musl.tar.gz"
      sha256 "e29ac4ce7d993fcaa2dab1e3ca22bee16f93f22b07cb02a2220869333dd24834"
    end

    on_arm do
      url "https://git.rikki.moe/rikki/iprober/releases/download/v#{version}/iprober-#{version}-linux-arm64-musl.tar.gz"
      sha256 "2dac4255cafe03b85e8e864c9698fd592d46343bfa6640abe60dc947681dbe77"
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
