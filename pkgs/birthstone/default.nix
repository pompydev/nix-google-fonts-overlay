{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "birthstone-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d829350c2f34cb6e60cf77bf786befe7b40a8073/ofl/birthstone/Birthstone-Regular.ttf?raw=true";
      name = "Birthstone-Regular.ttf";
      sha256 = "cd04bb37f03d2e8caebaee2f26b09d3244bab7810fa348d8acb2e6a5228d8783";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Birthstone-Regular.ttf $out/share/fonts/truetype/Birthstone-Regular.ttf
  '';

  meta = with lib; {
    description = "Birthstone";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
