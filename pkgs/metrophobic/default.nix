{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "metrophobic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/metrophobic/Metrophobic-Regular.ttf?raw=true";
      name = "Metrophobic-Regular.ttf";
      sha256 = "34e4ac3257307c28e6dd14f5d77bb296211f0ddd217607228a5375416ed8ac58";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Metrophobic-Regular.ttf $out/share/fonts/truetype/Metrophobic-Regular.ttf
  '';

  meta = with lib; {
    description = "Metrophobic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
