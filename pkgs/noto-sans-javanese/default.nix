{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-javanese-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansjavanese/NotoSansJavanese%5Bwght%5D.ttf?raw=true";
      name = "NotoSansJavanese_wght_.ttf";
      sha256 = "0bcb88de05a855aec38471d6317e860fa2a40d1c3ca93f2736b7c34ad9288d90";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansJavanese_wght_.ttf $out/share/fonts/truetype/NotoSansJavanese_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Javanese";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
