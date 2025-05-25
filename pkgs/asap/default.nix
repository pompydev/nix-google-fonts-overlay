{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "asap-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/asap/Asap%5Bwdth,wght%5D.ttf?raw=true";
      name = "Asap_wdth,wght_.ttf";
      sha256 = "a3938b208d7a46d88faf22d2d4221e871ab2cc686c0e555a273b2a126a2bd321";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/asap/Asap-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "Asap-Italic_wdth,wght_.ttf";
      sha256 = "6cea0e3ea852761503c25f3505a328a9f4c064a33d28ab97c78533f093e6ab74";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Asap_wdth-wght_.ttf $out/share/fonts/truetype/Asap_wdth-wght_.ttf
     install -Dm644 Asap-Italic_wdth-wght_.ttf $out/share/fonts/truetype/Asap-Italic_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Asap";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
