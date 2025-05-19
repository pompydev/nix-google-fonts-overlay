{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "im-fell-double-pica-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/imfelldoublepica/IMFELLDoublePica-Regular.ttf?raw=true";
      name = "IMFELLDoublePica-Regular.ttf";
      sha256 = "481afa82a0060b3649668fa629455caeea407864d4c1f6d815380866c504df07";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/imfelldoublepica/IMFELLDoublePica-Italic.ttf?raw=true";
      name = "IMFELLDoublePica-Italic.ttf";
      sha256 = "00ac0e73855f16e7192a76bc284fb86f69b2f2c21b405e29991f99ece83d6391";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IMFELLDoublePica-Regular.ttf $out/share/fonts/truetype/IMFELLDoublePica-Regular.ttf
     install -Dm644 IMFELLDoublePica-Italic.ttf $out/share/fonts/truetype/IMFELLDoublePica-Italic.ttf
  '';

  meta = with lib; {
    description = "IM Fell Double Pica";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
