{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "slackside-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/slacksideone/SlacksideOne-Regular.ttf?raw=true";
      name = "SlacksideOne-Regular.ttf";
      sha256 = "c32d67d921cfde2f89d2fe12b6e78a58618a41774a7cb1b0e321d5d1ae9a324a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SlacksideOne-Regular.ttf $out/share/fonts/truetype/SlacksideOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Slackside One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
