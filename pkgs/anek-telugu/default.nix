{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anek-telugu-${version}";
  version = "2022-05-23-195233";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2d216f8bd5906809f23313a9fe05480000669367/ofl/anektelugu/AnekTelugu%5Bwdth,wght%5D.ttf?raw=true";
      name = "AnekTelugu_wdth,wght_.ttf";
      sha256 = "25981968a8a3faab975993a54eec455829214390821037fb3a4d6c447d2e1179";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AnekTelugu_wdth,wght_.ttf $out/share/fonts/truetype/AnekTelugu_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Anek Telugu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
