{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "stalinist-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/stalinistone/StalinistOne-Regular.ttf?raw=true";
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
