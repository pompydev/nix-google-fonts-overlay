{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "buenard-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/buenard/Buenard%5Bwght%5D.ttf?raw=true";
      name = "Buenard_wght_.ttf";
      sha256 = "275f9307353c7502ce7553cbd09ab7c80c73dd2da854728df18d796f9455beb9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Buenard_wght_.ttf $out/share/fonts/truetype/Buenard_wght_.ttf
  '';

  meta = with lib; {
    description = "Buenard";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
