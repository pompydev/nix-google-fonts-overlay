{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "padauk-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/padauk/Padauk-Regular.ttf?raw=true";
      name = "Padauk-Regular.ttf";
      sha256 = "c89cf56e572abda9652d9e54203bd729b0c59541c4b569046b9b61acd0b532f3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/padauk/Padauk-Bold.ttf?raw=true";
      name = "Padauk-Bold.ttf";
      sha256 = "9dbb46745ae4ed42d9030210e63f7aa53281861c7fa0be072980161f94927115";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Padauk-Regular.ttf $out/share/fonts/truetype/Padauk-Regular.ttf
     install -Dm644 Padauk-Bold.ttf $out/share/fonts/truetype/Padauk-Bold.ttf
  '';

  meta = with lib; {
    description = "Padauk";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
