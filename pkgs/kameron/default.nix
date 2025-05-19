{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kameron-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kameron/Kameron%5Bwght%5D.ttf?raw=true";
      name = "Kameron_wght_.ttf";
      sha256 = "b7e9bf8756c3403c1acb1d93d225dcd14dbafc9864ee891268c89459e99db410";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kameron_wght_.ttf $out/share/fonts/truetype/Kameron_wght_.ttf
  '';

  meta = with lib; {
    description = "Kameron";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
