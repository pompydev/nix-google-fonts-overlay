{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ysabeau-infant-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ysabeauinfant/YsabeauInfant%5Bwght%5D.ttf?raw=true";
      name = "YsabeauInfant_wght_.ttf";
      sha256 = "3c0cfd9022bc445d9234a6dd697134476a86dfdd00e6ad58078c17b65587f984";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ysabeauinfant/YsabeauInfant-Italic%5Bwght%5D.ttf?raw=true";
      name = "YsabeauInfant-Italic_wght_.ttf";
      sha256 = "1babfd11906d06d2ff9c4e1a26afd857e526f6059a7d4126eb4f5f8fbb04aa50";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 YsabeauInfant_wght_.ttf $out/share/fonts/truetype/YsabeauInfant_wght_.ttf
     install -Dm644 YsabeauInfant-Italic_wght_.ttf $out/share/fonts/truetype/YsabeauInfant-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Ysabeau Infant";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
