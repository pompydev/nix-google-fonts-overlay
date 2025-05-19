{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "norican-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/norican/Norican-Regular.ttf?raw=true";
      name = "Norican-Regular.ttf";
      sha256 = "71ee99002e70bb69f8f613bd29d646d6044aaf34612efcff689a11afa4291d04";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Norican-Regular.ttf $out/share/fonts/truetype/Norican-Regular.ttf
  '';

  meta = with lib; {
    description = "Norican";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
