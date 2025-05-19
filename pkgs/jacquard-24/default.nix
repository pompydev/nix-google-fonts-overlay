{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jacquard-24-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/jacquard24/Jacquard24-Regular.ttf?raw=true";
      name = "Jacquard24-Regular.ttf";
      sha256 = "8e5b1bdb8b6087d6175f1d9edd2634e38b10fb109c0955c24ad55272a866ed49";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jacquard24-Regular.ttf $out/share/fonts/truetype/Jacquard24-Regular.ttf
  '';

  meta = with lib; {
    description = "Jacquard 24";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
