{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-meroitic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansmeroitic/NotoSansMeroitic-Regular.ttf?raw=true";
      name = "NotoSansMeroitic-Regular.ttf";
      sha256 = "0a9920e60a884d517c9385f68bef840d380ea0918b397a02357a882c28acca69";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMeroitic-Regular.ttf $out/share/fonts/truetype/NotoSansMeroitic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Meroitic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
