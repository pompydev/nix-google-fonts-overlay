{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gelasio-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gelasio/Gelasio%5Bwght%5D.ttf?raw=true";
      name = "Gelasio_wght_.ttf";
      sha256 = "4daecea457258c9ebeb8bc99ed3fd24353618bfad3ea4b93fa0b5d0468fc04e4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gelasio/Gelasio-Italic%5Bwght%5D.ttf?raw=true";
      name = "Gelasio-Italic_wght_.ttf";
      sha256 = "52559e845a4d33514e5f93bb9ae7dbeae1894a53f2c565a15f18af40cd337c09";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gelasio_wght_.ttf $out/share/fonts/truetype/Gelasio_wght_.ttf
     install -Dm644 Gelasio-Italic_wght_.ttf $out/share/fonts/truetype/Gelasio-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Gelasio";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
