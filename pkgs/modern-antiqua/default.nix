{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "modern-antiqua-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/modernantiqua/ModernAntiqua-Regular.ttf?raw=true";
      name = "ModernAntiqua-Regular.ttf";
      sha256 = "36ce0d70604b58915a29189065a1b8383d5197ba117994c87cbfd4f360831efd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ModernAntiqua-Regular.ttf $out/share/fonts/truetype/ModernAntiqua-Regular.ttf
  '';

  meta = with lib; {
    description = "Modern Antiqua";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
