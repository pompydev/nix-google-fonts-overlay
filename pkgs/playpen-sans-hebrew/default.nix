{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playpen-sans-hebrew-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playpensanshebrew/PlaypenSansHebrew%5Bwght%5D.ttf?raw=true";
      name = "PlaypenSansHebrew_wght_.ttf";
      sha256 = "0ec8a95033c5a01e1799c60b49ab76d9922a68f715a081fc1f5587e4d2bb5b69";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaypenSansHebrew_wght_.ttf $out/share/fonts/truetype/PlaypenSansHebrew_wght_.ttf
  '';

  meta = with lib; {
    description = "Playpen Sans Hebrew";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
