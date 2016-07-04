require 'formula'

class GrOsmosdr < Formula
  homepage 'http://sdr.osmocom.org/trac/wiki/GrOsmoSDR'
  head 'https://github.com/Nuand/gr-osmosdr.git', :branch => 'master'

  depends_on 'cmake' => :build
  depends_on 'gnuradio'
  depends_on 'librtlsdr'
  depends_on 'swig'
  depends_on 'homebrew/python/numpy'
  depends_on 'homebrew/python/scipy'
  depends_on 'homebrew/python/matplotlib'

  def install
    mkdir 'build' do
      system 'cmake', '..', *std_cmake_args << "-DPYTHON_LIBRARY=#{python_path}/Frameworks/Python.framework/" << "-DENABLE_PYTHON=ON"
      system 'make'
      system 'make install'
    end
  end

  def python_path
    python = Formula.factory('python')
    kegs = python.rack.children.reject { |p| p.basename.to_s == '.DS_Store' }
    kegs.find { |p| Keg.new(p).linked? } || kegs.last
  end
end
