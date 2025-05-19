{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cantata-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/cantataone/CantataOne-Regular.ttf?raw=true";
      name = "CantataOne-Regular.ttf";
      sha256 = "e12df35ae88a3e0898422110301e0b7ff4c54a4c129b92077ae7f456f45ba3db";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CantataOne-Regular.ttf $out/share/fonts/truetype/CantataOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Cantata One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
