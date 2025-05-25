{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "expletus-sans-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/expletussans/ExpletusSans%5Bwght%5D.ttf?raw=true";
      name = "ExpletusSans_wght_.ttf";
      sha256 = "33508b3b477c548ac00179d97c6deaca1e98dab4cc1d869dec5815931e7540f8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/expletussans/ExpletusSans-Italic%5Bwght%5D.ttf?raw=true";
      name = "ExpletusSans-Italic_wght_.ttf";
      sha256 = "5e69f9842ef3bddf9db581642306216f9d25649b9f9de2e80944e694ac189799";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ExpletusSans_wght_.ttf $out/share/fonts/truetype/ExpletusSans_wght_.ttf
     install -Dm644 ExpletusSans-Italic_wght_.ttf $out/share/fonts/truetype/ExpletusSans-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Expletus Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
