{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-music-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notomusic/NotoMusic-Regular.ttf?raw=true";
      name = "NotoMusic-Regular.ttf";
      sha256 = "e913be269fe16723d1dea0afc3c31a28be6958f6a7f0e6d5be6e98506c4022bd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoMusic-Regular.ttf $out/share/fonts/truetype/NotoMusic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Music";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
