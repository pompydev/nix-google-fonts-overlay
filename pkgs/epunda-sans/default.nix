{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "epunda-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/epundasans/EpundaSans%5Bwght%5D.ttf?raw=true";
      name = "EpundaSans_wght_.ttf";
      sha256 = "7ffff4f353f31e66f459ef47beb50d4e39e987421d3bd4b68f622461771dfe8d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/epundasans/EpundaSans-Italic%5Bwght%5D.ttf?raw=true";
      name = "EpundaSans-Italic_wght_.ttf";
      sha256 = "c2cb23ad0ce25f306458545efff1341ce0221e4cc94b1ca3277b785aaf3184d2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EpundaSans_wght_.ttf $out/share/fonts/truetype/EpundaSans_wght_.ttf
     install -Dm644 EpundaSans-Italic_wght_.ttf $out/share/fonts/truetype/EpundaSans-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Epunda Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
