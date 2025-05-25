{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-yi-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansyi/NotoSansYi-Regular.ttf?raw=true";
      name = "NotoSansYi-Regular.ttf";
      sha256 = "ee4de376a1e4f3c4bc7e116f4f46538348716b8408b86a0fc18c1c6128d2e56d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansYi-Regular.ttf $out/share/fonts/truetype/NotoSansYi-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Yi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
