{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-soyombo-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanssoyombo/NotoSansSoyombo-Regular.ttf?raw=true";
      name = "NotoSansSoyombo-Regular.ttf";
      sha256 = "a1ed643ffe8f84fd7c397a6eb0030f58e2722e7acd8b6a2305f33bf569d1bb2f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSoyombo-Regular.ttf $out/share/fonts/truetype/NotoSansSoyombo-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Soyombo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
