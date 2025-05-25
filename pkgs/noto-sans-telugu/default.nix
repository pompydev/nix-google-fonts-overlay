{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-telugu-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanstelugu/NotoSansTelugu%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansTelugu_wdth,wght_.ttf";
      sha256 = "e618af7bf999df192ed4f388eba2e563f2b5015034e9cbb317b5bd793bd7334d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTelugu_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansTelugu_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Telugu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
