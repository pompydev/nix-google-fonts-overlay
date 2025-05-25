{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "marcellus-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/marcellus/Marcellus-Regular.ttf?raw=true";
      name = "Marcellus-Regular.ttf";
      sha256 = "1cf0cd10b17d35e852729962cc1ffaffed94514895972458345e2df34abb2f81";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Marcellus-Regular.ttf $out/share/fonts/truetype/Marcellus-Regular.ttf
  '';

  meta = with lib; {
    description = "Marcellus";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
