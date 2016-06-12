require "formula"

class LteCellScanner < Formula
  homepage "https://github.com/rxseger/LTE-Cell-Scanner"
  head "https://github.com/rxseger/LTE-Cell-Scanner.git"

  depends_on "cmake" => :build
  depends_on "librtlsdr"
  depends_on "hackrf"
  depends_on "boost"
  depends_on "itpp"
  depends_on "openblas"
  depends_on "fftw"

  def install
    mkdir "build" do
      args = %W[
        -DUSE_RTLSDR=1
        -DUSE_HACKRF=1
      ] + std_cmake_args

      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
