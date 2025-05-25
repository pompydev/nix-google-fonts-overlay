{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-nabataean-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansnabataean/NotoSansNabataean-Regular.ttf?raw=true";
      name = "NotoSansNabataean-Regular.ttf";
      sha256 = "b21dc4564143ce3647bfb5c410b8b2f0affb257756693b9578a1328fdf9d82e8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansNabataean-Regular.ttf $out/share/fonts/truetype/NotoSansNabataean-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Nabataean";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
