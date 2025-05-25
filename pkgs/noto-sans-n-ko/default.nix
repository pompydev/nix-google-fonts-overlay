{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-n-ko-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansnko_todelist/NotoSansNKo-Regular.ttf?raw=true";
      name = "NotoSansNKo-Regular.ttf";
      sha256 = "389f4082894bf1833dc5f140a282496114366b410779fbb16b3486f4660e9313";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansNKo-Regular.ttf $out/share/fonts/truetype/NotoSansNKo-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans N Ko";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
