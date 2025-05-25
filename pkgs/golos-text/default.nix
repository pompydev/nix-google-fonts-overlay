{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "golos-text-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/golostext/GolosText%5Bwght%5D.ttf?raw=true";
      name = "GolosText_wght_.ttf";
      sha256 = "17bb58fb69aec2dfb047a2ebf52534023e9b688c97a6b7ac795b0a72912c2063";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GolosText_wght_.ttf $out/share/fonts/truetype/GolosText_wght_.ttf
  '';

  meta = with lib; {
    description = "Golos Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
