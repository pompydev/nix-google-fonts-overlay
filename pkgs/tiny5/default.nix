{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tiny5-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/tiny5/Tiny5-Regular.ttf?raw=true";
      name = "Tiny5-Regular.ttf";
      sha256 = "cb8168f80cfee2f47f6db59f2a7afbde31cdcdcdcf262e7a993e4d468a5bf4b0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Tiny5-Regular.ttf $out/share/fonts/truetype/Tiny5-Regular.ttf
  '';

  meta = with lib; {
    description = "Tiny5";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
