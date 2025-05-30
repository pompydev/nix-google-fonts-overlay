{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cookie-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cookie/Cookie-Regular.ttf?raw=true";
      name = "Cookie-Regular.ttf";
      sha256 = "9daf3cc9e5efe1b65094cdf1f14729ef6f07a70c27ee0679bf7f544a828b080e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cookie-Regular.ttf $out/share/fonts/truetype/Cookie-Regular.ttf
  '';

  meta = with lib; {
    description = "Cookie";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
