{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "geist-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/geist/Geist%5Bwght%5D.ttf?raw=true";
      name = "Geist_wght_.ttf";
      sha256 = "611e93a8401ee574c9fb3250bdaf5c52262aee3231015e9336359c1b2242cb13";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Geist_wght_.ttf $out/share/fonts/truetype/Geist_wght_.ttf
  '';

  meta = with lib; {
    description = "Geist";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
