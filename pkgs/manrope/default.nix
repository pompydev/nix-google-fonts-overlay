{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "manrope-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/manrope/Manrope%5Bwght%5D.ttf?raw=true";
      name = "Manrope_wght_.ttf";
      sha256 = "d0639be45d0af36e798172419d7bd173c4bd4f29e2b76cbb69db1d11bf8b0a40";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Manrope_wght_.ttf $out/share/fonts/truetype/Manrope_wght_.ttf
  '';

  meta = with lib; {
    description = "Manrope";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
