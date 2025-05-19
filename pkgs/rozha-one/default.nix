{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rozha-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rozhaone/RozhaOne-Regular.ttf?raw=true";
      name = "RozhaOne-Regular.ttf";
      sha256 = "8491b838c31f30272aa6da67e4749afabab8297db82a055fd2d0aa689f500ee3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RozhaOne-Regular.ttf $out/share/fonts/truetype/RozhaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Rozha One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
