{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "homemade-apple-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/homemadeapple/HomemadeApple-Regular.ttf?raw=true";
      name = "HomemadeApple-Regular.ttf";
      sha256 = "dd1baaca3cde1b1f8415aed3b0aea6808655c9d9ca5a99c7282d9accc16c1a58";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HomemadeApple-Regular.ttf $out/share/fonts/truetype/HomemadeApple-Regular.ttf
  '';

  meta = with lib; {
    description = "Homemade Apple";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
