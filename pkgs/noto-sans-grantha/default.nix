{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-grantha-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansgrantha/NotoSansGrantha-Regular.ttf?raw=true";
      name = "NotoSansGrantha-Regular.ttf";
      sha256 = "a3e57ddeeb9763111d0e4bd6440af2c7b2fa6763fe02ca56570d33e2afbf7ffb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansGrantha-Regular.ttf $out/share/fonts/truetype/NotoSansGrantha-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Grantha";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
