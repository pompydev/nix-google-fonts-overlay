{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "monda-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7f1eb1639d1954370545329a3219ad9c83cd7cc5/ofl/monda/Monda-Regular.ttf?raw=true";
      name = "Monda-Regular.ttf";
      sha256 = "e83b59ea26513c912843522204ff9ec5b5eca46429061e19202b628bff1c9331";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7f1eb1639d1954370545329a3219ad9c83cd7cc5/ofl/monda/Monda-Bold.ttf?raw=true";
      name = "Monda-Bold.ttf";
      sha256 = "5466c59e352a18e1283534994a3a96fd44c6c00c237453a34b69bee883d24f9b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Monda-Regular.ttf $out/share/fonts/truetype/Monda-Regular.ttf
     install -Dm644 Monda-Bold.ttf $out/share/fonts/truetype/Monda-Bold.ttf
  '';

  meta = with lib; {
    description = "Monda";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
