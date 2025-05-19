{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rem-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rem/REM%5Bwght%5D.ttf?raw=true";
      name = "REM_wght_.ttf";
      sha256 = "ea889cb78c4a724a865859c29d5d9fbf26932eb56442865b37303e1277428d3d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rem/REM-Italic%5Bwght%5D.ttf?raw=true";
      name = "REM-Italic_wght_.ttf";
      sha256 = "4ed7f32cb4c5ec11c5c8138c27dc26d83704a38027da0bf673a16f6135ee72bc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 REM_wght_.ttf $out/share/fonts/truetype/REM_wght_.ttf
     install -Dm644 REM-Italic_wght_.ttf $out/share/fonts/truetype/REM-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "REM";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
