{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-chakma-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanschakma/NotoSansChakma-Regular.ttf?raw=true";
      name = "NotoSansChakma-Regular.ttf";
      sha256 = "0e560c61cfe0f378377741770d38b5f802457455dd78aaf4b89614082659fba5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansChakma-Regular.ttf $out/share/fonts/truetype/NotoSansChakma-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Chakma";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
