{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ewert-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ewert/Ewert-Regular.ttf?raw=true";
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
