{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kaisei-tokumin-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/kaiseitokumin/KaiseiTokumin-Regular.ttf?raw=true";
      name = "KaiseiTokumin-Regular.ttf";
      sha256 = "3fbdbec539369aed11bb1fa0cdda1d19ea246e795107357383dfa561848a427d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/kaiseitokumin/KaiseiTokumin-Medium.ttf?raw=true";
      name = "KaiseiTokumin-Medium.ttf";
      sha256 = "fc58ac081468ca3a06c9f8b89077fbbf01c57729c1d5787cc7f33adb3e40d6f3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/kaiseitokumin/KaiseiTokumin-Bold.ttf?raw=true";
      name = "KaiseiTokumin-Bold.ttf";
      sha256 = "4540f6b5c32724acc9c4ba77692195078de43a4ee762d436e39d32fa8d1a73c9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/kaiseitokumin/KaiseiTokumin-ExtraBold.ttf?raw=true";
      name = "KaiseiTokumin-ExtraBold.ttf";
      sha256 = "bf44bb3e23cc703bfb19111833f78e651998d0a2b1863eff9e88cecb38a8bc53";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KaiseiTokumin-Regular.ttf $out/share/fonts/truetype/KaiseiTokumin-Regular.ttf
     install -Dm644 KaiseiTokumin-Medium.ttf $out/share/fonts/truetype/KaiseiTokumin-Medium.ttf
     install -Dm644 KaiseiTokumin-Bold.ttf $out/share/fonts/truetype/KaiseiTokumin-Bold.ttf
     install -Dm644 KaiseiTokumin-ExtraBold.ttf $out/share/fonts/truetype/KaiseiTokumin-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Kaisei Tokumin";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
