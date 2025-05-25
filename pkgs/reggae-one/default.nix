{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "reggae-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/reggaeone/ReggaeOne-Regular.ttf?raw=true";
      name = "ReggaeOne-Regular.ttf";
      sha256 = "aebe62598732d76036f30ec11bb0ec5f68938e373a06d1b4ceb6b9cf1abf3db2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ReggaeOne-Regular.ttf $out/share/fonts/truetype/ReggaeOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Reggae One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
