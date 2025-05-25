{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yomogi-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/yomogi/Yomogi-Regular.ttf?raw=true";
      name = "Yomogi-Regular.ttf";
      sha256 = "3424e34bb951e89bf5dd2554a65d8964335ea3c0560f8d1ea9aa3591ef73cba9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Yomogi-Regular.ttf $out/share/fonts/truetype/Yomogi-Regular.ttf
  '';

  meta = with lib; {
    description = "Yomogi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
