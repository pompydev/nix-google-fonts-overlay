{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "luckiest-guy-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/luckiestguy/LuckiestGuy-Regular.ttf?raw=true";
      name = "LuckiestGuy-Regular.ttf";
      sha256 = "cfbdd68a039f92df51cf3721506af6242e64594c6325fe0bedbeff3fe385d980";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LuckiestGuy-Regular.ttf $out/share/fonts/truetype/LuckiestGuy-Regular.ttf
  '';

  meta = with lib; {
    description = "Luckiest Guy";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
