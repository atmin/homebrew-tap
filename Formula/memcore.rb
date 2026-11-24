class Memcore < Formula
  desc "Long-term memory for coding agents"
  homepage "https://memco.re"
  version "0.10.0"

  on_macos do
    on_arm do
      url "https://github.com/atmin/memcore/releases/download/v0.10.0/memcore-darwin-arm64", using: :nounzip
      sha256 "51fc1f5e7a2ee7d1223a2cc2e9c783e3f2ff33c36baa5b6c3e779968bc32e1d1"
      depends_on arch: :arm64
    end
    on_intel do
      url "https://github.com/atmin/memcore/releases/download/v0.10.0/memcore-darwin-amd64", using: :nounzip
      sha256 "f3f858d34e60405f13302f80b8277d00a38e0e75fbe7b5cd9a4d3a2940fd616c"
      depends_on arch: :x86_64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atmin/memcore/releases/download/v0.10.0/memcore-linux-arm64-glibc", using: :nounzip
      sha256 "8245f41188d514beb6856a583862e33e5745c0ee7bf4b8454d23c7881f23e81e"
      depends_on arch: :arm64
    end
    on_intel do
      url "https://github.com/atmin/memcore/releases/download/v0.10.0/memcore-linux-amd64-glibc", using: :nounzip
      sha256 "f995007f70f4cf6fd092b72b7c6af9082eebf0a881be04dec66652c28c2baf58"
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
