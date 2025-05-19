{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "new-tegomin-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/newtegomin/NewTegomin-Regular.ttf?raw=true";
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
