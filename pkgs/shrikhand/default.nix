{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "shrikhand-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/shrikhand/Shrikhand-Regular.ttf?raw=true";
      name = "Shrikhand-Regular.ttf";
      sha256 = "8ba32f6d6a96fb8dbc92fc1acfbc4d2123d5348063d89b2c3dd784e7afcb81af";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Shrikhand-Regular.ttf $out/share/fonts/truetype/Shrikhand-Regular.ttf
  '';

  meta = with lib; {
    description = "Shrikhand";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
