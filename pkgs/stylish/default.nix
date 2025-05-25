{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "stylish-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/stylish/Stylish-Regular.ttf?raw=true";
      name = "Stylish-Regular.ttf";
      sha256 = "3ea2e4c9d0183fdcc1362039305ef30fa8bb5154f030b303a029059a44a8516c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Stylish-Regular.ttf $out/share/fonts/truetype/Stylish-Regular.ttf
  '';

  meta = with lib; {
    description = "Stylish";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
