{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "itim-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/itim/Itim-Regular.ttf?raw=true";
      name = "Itim-Regular.ttf";
      sha256 = "9164d7eb92ca717b53b07193e3445c96782222d24215151b8d2851b576b17645";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Itim-Regular.ttf $out/share/fonts/truetype/Itim-Regular.ttf
  '';

  meta = with lib; {
    description = "Itim";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
