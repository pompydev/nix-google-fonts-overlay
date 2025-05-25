{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-lepcha-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanslepcha/NotoSansLepcha-Regular.ttf?raw=true";
      name = "NotoSansLepcha-Regular.ttf";
      sha256 = "9624931ae8f9a8a2a45233e5486fac1a80f333a0b3a25f84d0e2484363914f84";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansLepcha-Regular.ttf $out/share/fonts/truetype/NotoSansLepcha-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Lepcha";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
