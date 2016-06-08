class Dump1090Hackrf < Formula
  desc "Dump1090_sdrplus is a Mode S decoder specifically designed for SDR devices (HackRF version)"
  homepage "https://github.com/itemir/dump1090_sdrplus"
  head "https://github.com/itemir/dump1090_sdrplus", :tag => "HackRF_One"
  url "https://github.com/itemir/dump1090_sdrplus/archive/HackRF_One.zip"
  sha256 "f2a68df609a44ebaaa30bcbf58c1242fabb5231f13029a582ded33b7113ab455"

  depends_on "fftw"
  depends_on "hackrf"
  depends_on "librtlsdr"
  depends_on "pkg-config"

  def install
    system "make"
    bin.install "dump1090"
  end
end
