{ stdenv, fetchgit, makeWrapper, qt5, qmltermwidget }:

stdenv.mkDerivation rec {
  version = "1.0.0";
  name = "cool-retro-term-${version}";

  src = fetchgit {
    url = "https://github.com/Swordfish90/cool-retro-term.git";
    rev = "refs/tags/v${version}";
    sha256 = "042ikarg6n0c09niwrm987pkzi8xjxxdrg2nqvk9pj7lgmmkkfn1";
    fetchSubmodules = false;
  };

  patchPhase = ''
    sed -i -e '/qmltermwidget/d' cool-retro-term.pro 
  '';

  buildInputs = [ makeWrapper qt5 qmltermwidget ];

  configurePhase = "qmake PREFIX=$out";

  installPhase = "make -j $NIX_BUILD_CORES INSTALL_ROOT=$out install";

  preFixup = ''
    mv $out/usr/share $out/share
    mv $out/usr/bin $out/bin
    rmdir $out/usr

    wrapProgram $out/bin/cool-retro-term \
      --prefix QML2_IMPORT_PATH : "${qmltermwidget}/lib/qml/"
  '';

  enableParallelBuilding = true;

  meta = {
    description = "Terminal emulator which mimics the old cathode display";
    longDescription = ''
      cool-retro-term is a terminal emulator which tries to mimic the look and
      feel of the old cathode tube screens. It has been designed to be
      eye-candy, customizable, and reasonably lightweight.
    '';
    homepage = "https://github.com/Swordifish90/cool-retro-term";
    license = with stdenv.lib.licenses; [ gpl2 gpl3 ];
    platforms = stdenv.lib.platforms.linux;
    maintainers = with stdenv.lib.maintainers; [ skeidel ];
  };
}
