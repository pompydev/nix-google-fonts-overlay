{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playpen-sans-thai-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playpensansthai/PlaypenSansThai%5Bwght%5D.ttf?raw=true";
      name = "PlaypenSansThai_wght_.ttf";
      sha256 = "14ac51adb087ad8d0395e4b6c0a976d33421ecbc5fe3e3506415505da95f47ef";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaypenSansThai_wght_.ttf $out/share/fonts/truetype/PlaypenSansThai_wght_.ttf
  '';

  meta = with lib; {
    description = "Playpen Sans Thai";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
