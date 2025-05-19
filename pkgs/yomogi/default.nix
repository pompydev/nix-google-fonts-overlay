{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yomogi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/yomogi/Yomogi-Regular.ttf?raw=true";
      name = "Yomogi-Regular.ttf";
      sha256 = "3424e34bb951e89bf5dd2554a65d8964335ea3c0560f8d1ea9aa3591ef73cba9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Yomogi-Regular.ttf $out/share/fonts/truetype/Yomogi-Regular.ttf
  '';

  meta = with lib; {
    description = "Yomogi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
