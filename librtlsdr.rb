class Librtlsdr < Formula
  desc "Use Realtek DVT-T dongles as a cheap SDR"
  homepage "https://sdr.osmocom.org/trac/wiki/rtl-sdr"
  head "https://github.com/rxseger/librtlsdr.git"

  option :universal

  depends_on "pkg-config" => :build
  depends_on "cmake" => :build
  depends_on "libusb"

  def install
    args = std_cmake_args

    if build.universal?
      ENV.universal_binary
      args << "-DCMAKE_OSX_ARCHITECTURES=#{Hardware::CPU.universal_archs.as_cmake_arch_flags}"
    end

    mkdir "build" do
      system "cmake", "..", *args
      system "make", "install"
    end
  end
end
