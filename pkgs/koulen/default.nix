{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "koulen-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/koulen/Koulen-Regular.ttf?raw=true";
      name = "Koulen-Regular.ttf";
      sha256 = "4e19b0b83c537547b0f1ff1fb39dafb55cefbf6e957ef4bc900dccb9e4220117";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Koulen-Regular.ttf $out/share/fonts/truetype/Koulen-Regular.ttf
  '';

  meta = with lib; {
    description = "Koulen";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
