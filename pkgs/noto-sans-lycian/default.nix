{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-lycian-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanslycian/NotoSansLycian-Regular.ttf?raw=true";
      name = "NotoSansLycian-Regular.ttf";
      sha256 = "81ad6994c822aba066219b06e6e097dcedba449b33c6fe6ceb79c2cdeb88664f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansLycian-Regular.ttf $out/share/fonts/truetype/NotoSansLycian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Lycian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
