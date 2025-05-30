{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "im-fell-great-primer-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/imfellgreatprimer/IMFeGPrm28P.ttf?raw=true";
      name = "IMFeGPrm28P.ttf";
      sha256 = "5c6de386acb87550ded558f701d288ec1ce7ffa9ec4b160ae06ee3728a1784b2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/imfellgreatprimer/IMFeGPit28P.ttf?raw=true";
      name = "IMFeGPit28P.ttf";
      sha256 = "a3c1cd9fc694e6f090923423ed8e4dc203c6ccc74ea246ee86279068302fe23d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IMFeGPrm28P.ttf $out/share/fonts/truetype/IMFeGPrm28P.ttf
     install -Dm644 IMFeGPit28P.ttf $out/share/fonts/truetype/IMFeGPit28P.ttf
  '';

  meta = with lib; {
    description = "IM Fell Great Primer";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
