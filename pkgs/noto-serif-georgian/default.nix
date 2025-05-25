{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-georgian-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notoserifgeorgian/NotoSerifGeorgian%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSerifGeorgian_wdth,wght_.ttf";
      sha256 = "a13a90c44a612ab80f79032d3edbbc7f6757f0c6b1613dba1a92f38077cccc57";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifGeorgian_wdth-wght_.ttf $out/share/fonts/truetype/NotoSerifGeorgian_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Georgian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
