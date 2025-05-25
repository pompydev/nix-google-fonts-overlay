{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "life-savers-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lifesavers/LifeSavers-Regular.ttf?raw=true";
      name = "LifeSavers-Regular.ttf";
      sha256 = "9cfbf78067b2f17079be543d38bc614ddad23cc6e9c61f119b2ad96289236056";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lifesavers/LifeSavers-Bold.ttf?raw=true";
      name = "LifeSavers-Bold.ttf";
      sha256 = "cbcc2ded1b108aca167abc1a8d752b1deb975c445611c0fb725d32d21dcfb000";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lifesavers/LifeSavers-ExtraBold.ttf?raw=true";
      name = "LifeSavers-ExtraBold.ttf";
      sha256 = "a7392b6a21ec8f22e5019d0adf9945fc4acba8761d4ff1e53eec65c9a230b454";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LifeSavers-Regular.ttf $out/share/fonts/truetype/LifeSavers-Regular.ttf
     install -Dm644 LifeSavers-Bold.ttf $out/share/fonts/truetype/LifeSavers-Bold.ttf
     install -Dm644 LifeSavers-ExtraBold.ttf $out/share/fonts/truetype/LifeSavers-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Life Savers";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
