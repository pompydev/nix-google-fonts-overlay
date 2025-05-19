{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "aclonica-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/aclonica/Aclonica-Regular.ttf?raw=true";
      name = "Aclonica-Regular.ttf";
      sha256 = "774a49351cc62a469b56972e9769679ce818a3de15b409ad5f1b6244ee84d85b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Aclonica-Regular.ttf $out/share/fonts/truetype/Aclonica-Regular.ttf
  '';

  meta = with lib; {
    description = "Aclonica";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
