{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fontdiner-swanky-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/fontdinerswanky/FontdinerSwanky-Regular.ttf?raw=true";
      name = "FontdinerSwanky-Regular.ttf";
      sha256 = "847229fbf58c7f7479f93fd7cf9fc269b54c0c9f6465abcb65a206fb261be41b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FontdinerSwanky-Regular.ttf $out/share/fonts/truetype/FontdinerSwanky-Regular.ttf
  '';

  meta = with lib; {
    description = "Fontdiner Swanky";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
