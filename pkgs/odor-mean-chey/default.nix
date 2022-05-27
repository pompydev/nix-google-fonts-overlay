{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "odor-mean-chey-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5dbdb58c9075640112a760b0f2376ab04cd187/ofl/odormeanchey/OdorMeanChey-Regular.ttf?raw=true";
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
