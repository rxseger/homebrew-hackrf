class KalibrateHackrf < Formula
  desc "Scan for GSM base stations in a given frequency band and use those GSM base stations to calculate the local oscillator frequency offset"
  homepage "https://web.archive.org/web/20131226204943/http://thre.at/kalibrate"
  head "git://github.com/rxseger/kalibrate-hackrf",
    :shallow => false

  depends_on "fftw"
  depends_on "hackrf"
  depends_on "libtool"
  depends_on "automake"
  depends_on "autoconf"
  depends_on "pkg-config"

  def install
    system "./bootstrap"
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
