{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "national-park-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/nationalpark/NationalPark%5Bwght%5D.ttf?raw=true";
      name = "NationalPark_wght_.ttf";
      sha256 = "17699dc82c52b177b95dec6805c8091ab79a965c866fa0f07ffa8672ddde0b5c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NationalPark_wght_.ttf $out/share/fonts/truetype/NationalPark_wght_.ttf
  '';

  meta = with lib; {
    description = "National Park";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
