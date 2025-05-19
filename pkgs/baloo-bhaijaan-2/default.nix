{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-bhaijaan-2-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/baloobhaijaan2/BalooBhaijaan2%5Bwght%5D.ttf?raw=true";
      name = "BalooBhaijaan2_wght_.ttf";
      sha256 = "3e9f07fbc796c0ddcb3e6e0aa26f9c86741d9f5b7f5cb72f4ed3c06e55a19336";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BalooBhaijaan2_wght_.ttf $out/share/fonts/truetype/BalooBhaijaan2_wght_.ttf
  '';

  meta = with lib; {
    description = "Baloo Bhaijaan 2";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
