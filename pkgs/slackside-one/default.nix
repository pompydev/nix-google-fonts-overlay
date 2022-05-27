{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "slackside-one-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/77d59e6d9c29cf2c3576be600a4e5582134d395b/ofl/slacksideone/SlacksideOne-Regular.ttf?raw=true";
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
