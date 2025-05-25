{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alex-brush-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/alexbrush/AlexBrush-Regular.ttf?raw=true";
      name = "AlexBrush-Regular.ttf";
      sha256 = "df702038d8e27797230c77959c139eeea38cac0caf53e19ea5b513d3b0d3362d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AlexBrush-Regular.ttf $out/share/fonts/truetype/AlexBrush-Regular.ttf
  '';

  meta = with lib; {
    description = "Alex Brush";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
