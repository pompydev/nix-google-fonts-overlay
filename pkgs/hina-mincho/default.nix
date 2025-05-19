{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hina-mincho-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hinamincho/HinaMincho-Regular.ttf?raw=true";
      name = "HinaMincho-Regular.ttf";
      sha256 = "8395fafa0c2721b4b5c274031e1336fea0f703d908b175ee21f8ba2f1ad566a0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HinaMincho-Regular.ttf $out/share/fonts/truetype/HinaMincho-Regular.ttf
  '';

  meta = with lib; {
    description = "Hina Mincho";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
