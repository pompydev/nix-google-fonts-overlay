{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "commissioner-${version}";
  version = "2022-05-25-093611";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d23af73a0ea1e8125c7d5efa1e3d35b7b66f52b2/ofl/commissioner/Commissioner%5BFLAR,VOLM,slnt,wght%5D.ttf?raw=true";
      name = "Commissioner_FLAR,VOLM,slnt,wght_.ttf";
      sha256 = "38c8e907705f1bdd19e9272b63218244b572d3dd687262eef01a95b79cf82b88";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Commissioner_FLAR,VOLM,slnt,wght_.ttf $out/share/fonts/truetype/Commissioner_FLAR,VOLM,slnt,wght_.ttf
  '';

  meta = with lib; {
    description = "Commissioner";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
