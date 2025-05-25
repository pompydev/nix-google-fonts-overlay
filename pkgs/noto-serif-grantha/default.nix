{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-grantha-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notoserifgrantha/NotoSerifGrantha-Regular.ttf?raw=true";
      name = "NotoSerifGrantha-Regular.ttf";
      sha256 = "f47a1d121f525a1bedffdc836ddbc824c005bbaf25076650df93c5292122f94a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifGrantha-Regular.ttf $out/share/fonts/truetype/NotoSerifGrantha-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Grantha";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
