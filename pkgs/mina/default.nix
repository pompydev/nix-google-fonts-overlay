{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mina-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/mina/Mina-Regular.ttf?raw=true";
      name = "Mina-Regular.ttf";
      sha256 = "1ca8f5fb637e21fd6ce7cd4cc230b7284a90524ce93a696b838bbe3edd25ab7c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/mina/Mina-Bold.ttf?raw=true";
      name = "Mina-Bold.ttf";
      sha256 = "eb125869e00d5e2fa33baa03344923141f31a5f10e1ae3fa65143cb2739fc318";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mina-Regular.ttf $out/share/fonts/truetype/Mina-Regular.ttf
     install -Dm644 Mina-Bold.ttf $out/share/fonts/truetype/Mina-Bold.ttf
  '';

  meta = with lib; {
    description = "Mina";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
