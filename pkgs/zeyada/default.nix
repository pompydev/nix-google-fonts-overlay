{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zeyada-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/zeyada/Zeyada.ttf?raw=true";
      name = "Zeyada.ttf";
      sha256 = "09f23d0d78b6e166ddb8480793bb550ab4c2aaf6602eda47a394fee93d2a9667";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Zeyada.ttf $out/share/fonts/truetype/Zeyada.ttf
  '';

  meta = with lib; {
    description = "Zeyada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
