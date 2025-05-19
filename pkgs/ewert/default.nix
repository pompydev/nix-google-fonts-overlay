{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ewert-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ewert/Ewert-Regular.ttf?raw=true";
      name = "Ewert-Regular.ttf";
      sha256 = "8a7eb23adce5193b61bc1843d752f37c208c163dd6db2fc1b64791791969f4ab";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ewert-Regular.ttf $out/share/fonts/truetype/Ewert-Regular.ttf
  '';

  meta = with lib; {
    description = "Ewert";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
