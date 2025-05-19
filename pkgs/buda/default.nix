{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "buda-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/buda/Buda-Light.ttf?raw=true";
      name = "Buda-Light.ttf";
      sha256 = "1c8a9bb52f69dba3b66961b792c03e5407f48070bf9ff8436103082f6dd6a720";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Buda-Light.ttf $out/share/fonts/truetype/Buda-Light.ttf
  '';

  meta = with lib; {
    description = "Buda";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
