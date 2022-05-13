{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-symbols-2-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanssymbols2/NotoSansSymbols2-Regular.ttf?raw=true";
      name = "NotoSansSymbols2-Regular.ttf";
      sha256 = "876598db5f1e3bef2bc77c4d94c5b0d5d2c1620be4878a06f18fb5434e331688";
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
