{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "stalinist-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/stalinistone/StalinistOne-Regular.ttf?raw=true";
      name = "StalinistOne-Regular.ttf";
      sha256 = "73cc48eefa01543b09fd3df9bab6af2a302e52e292b8625f4b62c868bc152eeb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 StalinistOne-Regular.ttf $out/share/fonts/truetype/StalinistOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Stalinist One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
