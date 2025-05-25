{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cantora-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cantoraone/CantoraOne-Regular.ttf?raw=true";
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
