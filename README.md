---
published: false
---

# HackRF OSX Install

This will walk you through getting HackRF to work on OSX. It is really just an adaptation of the awesome collection of [Homebrew](https://github.com/mxcl/homebrew) recipes from [Titanous](https://github.com/titanous/homebrew-gnuradio) and [jjeising](https://github.com/jjeising/homebrew-hackrf) for getting GNU Radio running on OSX.

Note: [homebrew-core](https://github.com/homebrew/homebrew-core) now includes the gnuradio, librtlsdr, and hackrf formulas.
This repository only includes gqrx, gr-baz, and gr-osmosdr.

## Installation

These steps have been tested on El Capitan 10.11.5 with Xcode 7.3.1. It is probably a good idea to make sure all OSX updates have been applied and Xcode is up to date. Also, probably good to install the Xcode command line apps as explained over at [Stackoverflow](http://stackoverflow.com/a/932932).

- Install [Homebrew](http://brew.sh/) if you haven't already

  ```sh
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```
  or if you already have it installed, update and upgrade everything:
  
  ```sh
  brew update
  brew upgrade
  ```
  
- After that is done run the following to make sure you have no issues with your setup, cleanup anything it catches

  ```sh
  brew doctor
  ```

- Add this line to your profile (ie `~/.profile` or `~/.bash_profile` or `~/.zshenv`) and reload
  your profile (`source ~/.profile` or `exec $SHELL`)

  ```sh
  export PATH=/usr/local/sbin:/usr/local/bin:$PATH
  ```

- Install the prerequisite python package (TODO: move to homebrew dependency)

  ```sh
  pip install Cheetah
  ```


- Install gnuradio 

  ```sh
  brew install gnuradio
  ```
- Install HackRF and RTL-SDR libraries

  ```sh
  brew install hackrf
  brew install librtlsdr
  ```

- Create the `~/.gnuradio/config.conf` config file for custom block support and add this into it

  ```ini
  [grc]
  local_blocks_path=/usr/local/share/gnuradio/grc/blocks
  ```

- Install HackRF & RTL-SDR related blocks

  ```sh
  brew tap rxseger/homebrew-hackrf
  brew install gr-osmosdr gr-baz --HEAD
  ```
- If you want a graphic interface to play with your HackRF, GQRX is great
  To install it:
  
  ```sh
  brew install --HEAD gqrx
  ```
  
  To run:
  
  ```sh
  gqrx
  ```
  
  And then configure it to use the HackRF. Probably best to start the sample rate at 10e6 until you know how much your system can handle.
  
**Congratulations!!**

Everything should now be working. It is time to give it a try! Below are some of the programs you can try

```sh
gnuradio-companion
osmocom_fft -a hackrf
```

- **Uninstall Homebrew**
  If you think you have some cruftiness with Homebrew, this Gist will completely uninstall Homebrew and any libraries it may have installed. Of course if you are using Homebrew for other things you could make a mess of your life. 
  
  This [Gist](https://gist.github.com/mxcl/1173223) is from the [Homebrew FAQ](https://github.com/mxcl/homebrew/wiki/FAQ)
  
  Then finish the clean-up with these steps
  
  ```sh
  rm -rf /usr/local/Cellar /usr/local/.git && brew cleanup
  rm -rf /Library/Caches/Homebrew
  rm -rf /usr/local/lib/python2.7/site-packages
  ```

