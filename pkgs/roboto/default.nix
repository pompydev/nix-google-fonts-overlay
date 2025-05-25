{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "roboto-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/roboto/Roboto%5Bwdth,wght%5D.ttf?raw=true";
      name = "Roboto_wdth,wght_.ttf";
      sha256 = "e1722faf1243fd28995b776f9192e44e0bc7f5a07fc6a80b9d73eda34d4d4c8f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/roboto/Roboto-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "Roboto-Italic_wdth,wght_.ttf";
      sha256 = "c38704321bfebbbdffdcc47cf210b4c3911a19e966e263b183b79404e583a39e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Roboto_wdth-wght_.ttf $out/share/fonts/truetype/Roboto_wdth-wght_.ttf
     install -Dm644 Roboto-Italic_wdth-wght_.ttf $out/share/fonts/truetype/Roboto-Italic_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Roboto";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
