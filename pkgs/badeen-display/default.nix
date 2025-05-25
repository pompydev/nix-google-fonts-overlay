{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "badeen-display-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/badeendisplay/BadeenDisplay-Regular.ttf?raw=true";
      name = "BadeenDisplay-Regular.ttf";
      sha256 = "274805b3ee44f9b45a99bdcecf25cd44944c0a81f6cf8086b5cf30d00e860537";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BadeenDisplay-Regular.ttf $out/share/fonts/truetype/BadeenDisplay-Regular.ttf
  '';

  meta = with lib; {
    description = "Badeen Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
