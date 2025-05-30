{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-osage-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansosage/NotoSansOsage-Regular.ttf?raw=true";
      name = "NotoSansOsage-Regular.ttf";
      sha256 = "fb7f7fed310568cceddf3d08cfbb13ccde7b84b1ddd93f9430cb91c2bdd4172d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOsage-Regular.ttf $out/share/fonts/truetype/NotoSansOsage-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Osage";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
