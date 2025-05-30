{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-hatran-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanshatran/NotoSansHatran-Regular.ttf?raw=true";
      name = "NotoSansHatran-Regular.ttf";
      sha256 = "8d26a25e634783f3fe285868bc71ca396c11d0f760129ce9f85a24f3f943116d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansHatran-Regular.ttf $out/share/fonts/truetype/NotoSansHatran-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Hatran";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
