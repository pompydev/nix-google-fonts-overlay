{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nuosu-sil-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/nuosusil/NuosuSIL-Regular.ttf?raw=true";
      name = "NuosuSIL-Regular.ttf";
      sha256 = "632b875ede95598e162da0323fb79e0f4dace58643ddbe29bfc460c78ee2ac64";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NuosuSIL-Regular.ttf $out/share/fonts/truetype/NuosuSIL-Regular.ttf
  '';

  meta = with lib; {
    description = "Nuosu SIL";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
