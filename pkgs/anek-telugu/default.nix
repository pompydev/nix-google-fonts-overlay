{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anek-telugu-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/anektelugu/AnekTelugu%5Bwdth,wght%5D.ttf?raw=true";
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
