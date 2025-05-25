{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "artifika-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/artifika/Artifika-Regular.ttf?raw=true";
      name = "Artifika-Regular.ttf";
      sha256 = "51d5e3b59c907938e11964306dcd13e4e4cd413acac7dccce4f81860d1ed9f86";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Artifika-Regular.ttf $out/share/fonts/truetype/Artifika-Regular.ttf
  '';

  meta = with lib; {
    description = "Artifika";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
