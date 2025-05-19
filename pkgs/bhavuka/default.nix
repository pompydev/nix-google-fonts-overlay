{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bhavuka-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bhavuka/Bhavuka-Regular.ttf?raw=true";
      name = "Bhavuka-Regular.ttf";
      sha256 = "153806257782e9bb99f4504659175a4ba27a5933291702963416c98870b37aa9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bhavuka-Regular.ttf $out/share/fonts/truetype/Bhavuka-Regular.ttf
  '';

  meta = with lib; {
    description = "Bhavuka";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
