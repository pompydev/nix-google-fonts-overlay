{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sawarabi-mincho-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sawarabimincho/SawarabiMincho-Regular.ttf?raw=true";
      name = "SawarabiMincho-Regular.ttf";
      sha256 = "1f27e6b0c2543a311c31d2ba3e895e50028069bd24b5e0d20a5b6e0a0b03e9c4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SawarabiMincho-Regular.ttf $out/share/fonts/truetype/SawarabiMincho-Regular.ttf
  '';

  meta = with lib; {
    description = "Sawarabi Mincho";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
