{ pkgName, version, pkgSha256 }:
{ stdenv, fetchurl, cmake, pkgconfig, buildInputs, drvParams ? {} }:
let name = "${pkgName}-${version}";
in stdenv.mkDerivation ({
  inherit name buildInputs;
  src = fetchurl {
    url = "http://downloads.sourceforge.net/cdemu/${name}.tar.bz2";
    sha256 = pkgSha256;
  };
  nativeBuildInputs = [ pkgconfig cmake ];
  setSourceRoot = ''
    mkdir build
    cd build
    sourceRoot="`pwd`"
  '';
  configurePhase = ''
    cmake ../${name} -DCMAKE_INSTALL_PREFIX=$out -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_RPATH=ON
  '';
  meta = {
    description = "A Software suite designed to emulate an optical drive and disc (including CD-ROMs and DVD-ROMs) on the Linux operating system";
    longDescription = ''
      CDEmu consists of:

      - a kernel module implementing a virtual drive-controller
      - libmirage which is a software library for interpreting optical disc images
      - a daemon which emulates the functionality of an optical drive+disc
      - textmode and GTK clients for controlling the emulator
      - an image analyzer to view the structure of image files

      Optical media emulated by CDemu can be mounted within Linux. Automounting is also allowed.
    '';
    homepage = "http://cdemu.sourceforge.net/";
    license = stdenv.lib.licenses.gpl2Plus;
    platforms = stdenv.lib.platforms.linux;
    maintainers = [ "Rok Mandeljc <mrok AT users DOT sourceforge DOT net>" ];
  };
} // drvParams)
