{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "patua-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/patuaone/PatuaOne-Regular.ttf?raw=true";
      name = "PatuaOne-Regular.ttf";
      sha256 = "a3faa8b9efdd9d89980b56fa2b080669d66f3f977f07a2a6295498dbe7c26a7c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PatuaOne-Regular.ttf $out/share/fonts/truetype/PatuaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Patua One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
