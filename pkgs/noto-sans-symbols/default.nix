{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-symbols-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanssymbols/NotoSansSymbols[wght].ttf?raw=true";
      name = "NotoSansSymbols[wght].ttf";
      sha256 = "d0ce73181c5c2bf20778d2d4447da9c94cb7ba5db16a6754abf311be2e2caf69";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansSymbols[wght].ttf' $out/share/fonts/truetype/'NotoSansSymbols[wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans Symbols";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
