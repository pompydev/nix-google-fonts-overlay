{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-runic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansrunic/NotoSansRunic-Regular.ttf?raw=true";
      name = "NotoSansRunic-Regular.ttf";
      sha256 = "615b6c1166a8c51816dc1536784acbf486547e3bed03dbfdd70910e10066793b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansRunic-Regular.ttf $out/share/fonts/truetype/NotoSansRunic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Runic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
