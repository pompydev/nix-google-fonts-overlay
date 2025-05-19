{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "inclusive-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/inclusivesans/InclusiveSans%5Bwght%5D.ttf?raw=true";
      name = "InclusiveSans_wght_.ttf";
      sha256 = "52ae5fdb8eda45633f1e9817ebdb07d8075c89081d51204f16f78394608a5c4e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/inclusivesans/InclusiveSans-Italic%5Bwght%5D.ttf?raw=true";
      name = "InclusiveSans-Italic_wght_.ttf";
      sha256 = "1b94e7bc731a3d91e358bff9f9253ccef36012e214c0ba64661741fa44494b2e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 InclusiveSans_wght_.ttf $out/share/fonts/truetype/InclusiveSans_wght_.ttf
     install -Dm644 InclusiveSans-Italic_wght_.ttf $out/share/fonts/truetype/InclusiveSans-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Inclusive Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
