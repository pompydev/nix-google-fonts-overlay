{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playpen-sans-arabic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playpensansarabic/PlaypenSansArabic%5Bwght%5D.ttf?raw=true";
      name = "PlaypenSansArabic_wght_.ttf";
      sha256 = "31122f11b6aa8a36a283f95797663a575afffbe2d52b69e496f3a2440942a226";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaypenSansArabic_wght_.ttf $out/share/fonts/truetype/PlaypenSansArabic_wght_.ttf
  '';

  meta = with lib; {
    description = "Playpen Sans Arabic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
