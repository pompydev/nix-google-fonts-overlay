{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-tc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notoseriftc/NotoSerifTC%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifTC_wght_.ttf";
      sha256 = "0077e18f57c6908f4a000969880940bdb0dad057c0e8d98b49dc364c3d1b09c6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifTC_wght_.ttf $out/share/fonts/truetype/NotoSerifTC_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif TC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
