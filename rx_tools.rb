class RxTools < Formula
  desc "rx_fm, rx_power, and rx_sdr tools for receiving data from SDRs"
  homepage "https://github.com/rxseger/rx_tools"
  head "https://github.com/rxseger/rx_tools.git"

  depends_on "cmake" => :build
  depends_on "pothosware/pothos/soapysdr"
  depends_on "pothosware/pothos/soapybladerf" => :optional
  depends_on "pothosware/pothos/soapyhackrf" => :optional
  depends_on "pothosware/pothos/soapysomo" => :optional
  depends_on "pothosware/pothos/soapyredpitaya" => :optional
  depends_on "pothosware/pothos/soapyrtlsdr" => :optional
  depends_on "pothosware/pothos/soapyuhd" => :optional

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end
end
