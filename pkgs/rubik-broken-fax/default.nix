{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-broken-fax-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubikbrokenfax/RubikBrokenFax-Regular.ttf?raw=true";
      name = "RubikBrokenFax-Regular.ttf";
      sha256 = "52062566e93a07757574a2eb993befa2bf00638a2c1d10a12ccdb7e8c86a3e5e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikBrokenFax-Regular.ttf $out/share/fonts/truetype/RubikBrokenFax-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Broken Fax";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
