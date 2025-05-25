{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "paprika-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/paprika/Paprika-Regular.ttf?raw=true";
      name = "Paprika-Regular.ttf";
      sha256 = "a53bba54989b5401d61115332ad2554c3cc6b7ab82e02cb0bd1abc4d48ad63cb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Paprika-Regular.ttf $out/share/fonts/truetype/Paprika-Regular.ttf
  '';

  meta = with lib; {
    description = "Paprika";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
