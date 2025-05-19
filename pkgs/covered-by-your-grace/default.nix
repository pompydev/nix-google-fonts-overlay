{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "covered-by-your-grace-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/coveredbyyourgrace/CoveredByYourGrace.ttf?raw=true";
      name = "CoveredByYourGrace.ttf";
      sha256 = "8a7e5687a4f9aad95243eb28cdc624009a335e0de5175113bc5f1348a4d67fd7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CoveredByYourGrace.ttf $out/share/fonts/truetype/CoveredByYourGrace.ttf
  '';

  meta = with lib; {
    description = "Covered By Your Grace";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
