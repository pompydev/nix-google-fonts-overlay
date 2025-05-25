{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "englebert-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/englebert/Englebert-Regular.ttf?raw=true";
      name = "Englebert-Regular.ttf";
      sha256 = "97be7df4f050113b713077b9cb4a51e7f62c155ba22c7adf7ee65e0d7b0f7577";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Englebert-Regular.ttf $out/share/fonts/truetype/Englebert-Regular.ttf
  '';

  meta = with lib; {
    description = "Englebert";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
