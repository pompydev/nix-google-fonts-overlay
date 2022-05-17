{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "new-tegomin-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/65de92210286af265c9f3d7fb5e96c71d0913127/ofl/newtegomin/NewTegomin-Regular.ttf?raw=true";
      name = "NewTegomin-Regular.ttf";
      sha256 = "bcae8775f0f9b88e12e40434918c56817e96e3a291e2a6595a34fb38fe3e58fb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NewTegomin-Regular.ttf $out/share/fonts/truetype/NewTegomin-Regular.ttf
  '';

  meta = with lib; {
    description = "New Tegomin";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
