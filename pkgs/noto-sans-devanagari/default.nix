{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-devanagari-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansdevanagari/NotoSansDevanagari%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansDevanagari_wdth,wght_.ttf";
      sha256 = "9ce7b04f60e363d8870e5997744cf85cf69d38a4d7d129d364d92a3b14b461d7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansDevanagari_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansDevanagari_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Devanagari";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
