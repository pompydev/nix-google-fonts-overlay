{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-gurmukhi-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoserifgurmukhi/NotoSerifGurmukhi%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifGurmukhi_wght_.ttf";
      sha256 = "ba746e1c4ad372c19763dfe5b0d1e5148d86ec66f14011e3708100f31836bd4f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifGurmukhi_wght_.ttf $out/share/fonts/truetype/NotoSerifGurmukhi_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Gurmukhi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
