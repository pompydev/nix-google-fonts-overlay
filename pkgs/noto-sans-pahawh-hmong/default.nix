{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-pahawh-hmong-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanspahawhhmong/NotoSansPahawhHmong-Regular.ttf?raw=true";
      name = "NotoSansPahawhHmong-Regular.ttf";
      sha256 = "8b575d82f37d1119c7fb6d0f569fafea572bddfeb83861c8501d4ab5a5faef92";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansPahawhHmong-Regular.ttf $out/share/fonts/truetype/NotoSansPahawhHmong-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Pahawh Hmong";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
