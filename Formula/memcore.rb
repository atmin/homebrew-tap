class Memcore < Formula
  desc "Long-term memory for coding agents"
  homepage "https://memco.re"
  version "0.13.0"

  on_macos do
    on_arm do
      url "https://github.com/atmin/memcore/releases/download/v0.13.0/memcore-darwin-arm64", using: :nounzip
      sha256 "4dbbda5145f65620ca4821c9aadb2a2860790ad295c6e824a4f32bc956a54efa"
      depends_on arch: :arm64
    end
    on_intel do
      url "https://github.com/atmin/memcore/releases/download/v0.13.0/memcore-darwin-amd64", using: :nounzip
      sha256 "cf5707c9cd5bb735c584713bdc7f66700dd3ca4a09ca8c0822377dfc0c4ea46b"
      depends_on arch: :x86_64
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/atmin/memcore/releases/download/v0.13.0/memcore-linux-arm64-glibc", using: :nounzip
      sha256 "eaca61799def44c6ece7a71549eabfe1d6b1a1d1bf71eef0c12e455a2fb198fc"
      depends_on arch: :arm64
    end
    on_intel do
      url "https://github.com/atmin/memcore/releases/download/v0.13.0/memcore-linux-amd64-glibc", using: :nounzip
      sha256 "d5d5b5199a39afbd7f68ce15a03ed4d9c9a5b29d681e132acc322ee3b3a197de"
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
