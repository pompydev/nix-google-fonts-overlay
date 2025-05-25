{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-armenian-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansarmenian/NotoSansArmenian%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansArmenian_wdth,wght_.ttf";
      sha256 = "0870908d8318435a5daf1cd280ae15063f990cd9ad60f3e94c734ce9e1ffef71";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansArmenian_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansArmenian_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Armenian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
