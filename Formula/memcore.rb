class Memcore < Formula
  desc "Long-term memory for coding agents"
  homepage "https://memco.re"
  version "0.12.0"

  on_macos do
    on_arm do
      url "https://github.com/atmin/memcore/releases/download/v0.12.0/memcore-darwin-arm64", using: :nounzip
      sha256 "4e513a71addf7921768264983b1a6682703df54831d9cdd7110a4d685e8f181b"
      depends_on arch: :arm64
    end
    on_intel do
      url "https://github.com/atmin/memcore/releases/download/v0.12.0/memcore-darwin-amd64", using: :nounzip
      sha256 "56257f7690ac5f536eb32ba95e23fbdea6d11b938dac9b849a2acbd9724e19f2"
      depends_on arch: :x86_64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atmin/memcore/releases/download/v0.12.0/memcore-linux-arm64-glibc", using: :nounzip
      sha256 "05f0babae2ac785a5fcfb3dc90b3839996f1a5227eada3631bb878c7732ee40b"
      depends_on arch: :arm64
    end
    on_intel do
      url "https://github.com/atmin/memcore/releases/download/v0.12.0/memcore-linux-amd64-glibc", using: :nounzip
      sha256 "8c98e25c3a2e2bc27aece40ae5919f0d51e3d00c3908bac4a8aad3f53b66ae2c"
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
