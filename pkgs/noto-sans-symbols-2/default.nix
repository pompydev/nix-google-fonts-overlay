{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-symbols-2-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanssymbols2/NotoSansSymbols2-Regular.ttf?raw=true";
      name = "NotoSansSymbols2-Regular.ttf";
      sha256 = "7d5fb73b7ca67a6798101741f5d280a3d016a56a197afcd4199dbb57b4b82a21";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSymbols2-Regular.ttf $out/share/fonts/truetype/NotoSansSymbols2-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Symbols 2";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
