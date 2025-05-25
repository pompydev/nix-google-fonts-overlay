{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-symbols-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanssymbols/NotoSansSymbols%5Bwght%5D.ttf?raw=true";
      name = "NotoSansSymbols_wght_.ttf";
      sha256 = "f7e7e04b4a24b6c78893d50cbfd2b2f6cae49617ab047bfef668d252adb128f7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSymbols_wght_.ttf $out/share/fonts/truetype/NotoSansSymbols_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Symbols";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
