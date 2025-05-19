{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "odor-mean-chey-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/odormeanchey/OdorMeanChey-Regular.ttf?raw=true";
      name = "OdorMeanChey-Regular.ttf";
      sha256 = "29cb2e094a7e8ed9dd5701f48a5ef42c4e15db8acd85ea78e22804ae67188fbe";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 OdorMeanChey-Regular.ttf $out/share/fonts/truetype/OdorMeanChey-Regular.ttf
  '';

  meta = with lib; {
    description = "Odor Mean Chey";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
