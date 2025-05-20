{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kalnia-glaze-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kalniaglaze/KalniaGlaze%5Bwdth,wght%5D.ttf?raw=true";
      name = "KalniaGlaze_wdth,wght_.ttf";
      sha256 = "526a3f364fff570bf01dfeb71b2de2f52bac0376b51004804e703df698b964ac";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KalniaGlaze_wdth-wght_.ttf $out/share/fonts/truetype/KalniaGlaze_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Kalnia Glaze";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
