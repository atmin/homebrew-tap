class Memcore < Formula
  desc "Long-term memory for coding agents"
  homepage "https://memco.re"
  version "0.11.0"

  on_macos do
    on_arm do
      url "https://github.com/atmin/memcore/releases/download/v0.11.0/memcore-darwin-arm64", using: :nounzip
      sha256 "5a75cb4eea3c4cde4976ba11c6382c8341b4f4078f479a2bc3f1e190772a21a4"
      depends_on arch: :arm64
    end
    on_intel do
      url "https://github.com/atmin/memcore/releases/download/v0.11.0/memcore-darwin-amd64", using: :nounzip
      sha256 "ea658dce211c9e90fce9ba8718c9b6a4fa8968841a3a41cef31d1c6e5695a7ad"
      depends_on arch: :x86_64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atmin/memcore/releases/download/v0.11.0/memcore-linux-arm64-glibc", using: :nounzip
      sha256 "2c0466861043d34ea28214b83272770ce073c9f385e6ce0b151ed41acdc69222"
      depends_on arch: :arm64
    end
    on_intel do
      url "https://github.com/atmin/memcore/releases/download/v0.11.0/memcore-linux-amd64-glibc", using: :nounzip
      sha256 "6c1379e5f99b61b37ae651933d07a68f618434b1023f6e3db970f9dce0d7c147"
      depends_on arch: :x86_64
    end
  end

  def install
    bin.install Dir["memcore-*"].first => "memcore"
    chmod 0555, bin/"memcore"
  end

  def caveats
    <<~EOS
      To add the desktop application, run this after the installation and after each upgrade:
        memcore ui --install
    EOS
  end

  test do
    assert_equal "v#{version}", shell_output("#{bin}/memcore version").split[1]
  end
end
