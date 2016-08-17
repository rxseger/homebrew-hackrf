class Inspectrum < Formula
  desc "Offline radio signal analyser"
  homepage "https://github.com/miek/inspectrum"
  head "https://github.com/miek/inspectrum.git"

  depends_on "qt5"
  depends_on "fftw"
  depends_on "cmake" => :build
  depends_on "pkg-config"
  depends_on "dholm/sdr/liquid-dsp" # TODO: how to specify requires --HEAD? or get https://gist.github.com/rxseger/2c0aea05f47e162725f5ec703461d32a


  def install
    # TODO: need to set to use qt5 not qt4, otherwise fails:
    # /tmp/inspectrum-20160704–46579-gxda2b/moc_cursor.cpp:9:10: fatal error: ‘../../private/tmp/inspectrum-20160704–46579-gxda2b/cursor.h’ file not found
    # how to do this within Homebrew? works fine with manual compilation, but not in the Homebrew formula
    #qt5 = `brew --prefix qt5`.chomp # TODO: better way to do this? need QT5 not QT4
    qt5 = "/usr/local/opt/qt5"
    ENV["CMAKE_PREFIX_PATH"] = "#{qt5}/lib/cmake"
    puts "prefix-path=",ENV["CMAKE_PREFIX_PATH"]
    ENV["CMAKE_SYSTEM_PREFIX_PATH"] = ENV["CMAKE_PREFIX_PATH"]

    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end
end
