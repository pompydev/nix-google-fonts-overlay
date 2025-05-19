{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cantora-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/cantoraone/CantoraOne-Regular.ttf?raw=true";
      name = "CantoraOne-Regular.ttf";
      sha256 = "78e9174f67db3e0c1efbe0b570c3546bc805ed43a0fb2dbec4aca7831caf1f15";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CantoraOne-Regular.ttf $out/share/fonts/truetype/CantoraOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Cantora One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
