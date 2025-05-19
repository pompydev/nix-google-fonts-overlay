{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "purple-purse-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/purplepurse/PurplePurse-Regular.ttf?raw=true";
      name = "PurplePurse-Regular.ttf";
      sha256 = "9c5d7289f22bdb1ef20ae0c47fb896c00f8b35bbf9e114ad6fd2528485380deb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PurplePurse-Regular.ttf $out/share/fonts/truetype/PurplePurse-Regular.ttf
  '';

  meta = with lib; {
    description = "Purple Purse";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
