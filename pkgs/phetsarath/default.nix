{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "phetsarath-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/phetsarath/Phetsarath-Regular.ttf?raw=true";
      name = "Phetsarath-Regular.ttf";
      sha256 = "0d0328c2036319a06ae4e0093d1ea32b6d849069f624cf6dd67e1f6ebc4635a8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/phetsarath/Phetsarath-Bold.ttf?raw=true";
      name = "Phetsarath-Bold.ttf";
      sha256 = "3b8cced65a9b4a49da487c4abb6c36c9dafb2c11e3c75a16b7da32a28bc2ecab";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Phetsarath-Regular.ttf $out/share/fonts/truetype/Phetsarath-Regular.ttf
     install -Dm644 Phetsarath-Bold.ttf $out/share/fonts/truetype/Phetsarath-Bold.ttf
  '';

  meta = with lib; {
    description = "Phetsarath";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
