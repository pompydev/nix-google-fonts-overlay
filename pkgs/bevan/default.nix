{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bevan-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/160c7fe82ecb74b108d886ed8d27762f6e346163/ofl/bevan/Bevan-Regular.ttf?raw=true";
      name = "Bevan-Regular.ttf";
      sha256 = "8d16c0920330f1def84e342ce70626c27fbf179b4294e6391b19301ff5873469";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/160c7fe82ecb74b108d886ed8d27762f6e346163/ofl/bevan/Bevan-Italic.ttf?raw=true";
      name = "Bevan-Italic.ttf";
      sha256 = "bdf6744e1a398c2bbf80e94a8195209759992b25d09863eefacc42de4c9caf6b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bevan-Regular.ttf $out/share/fonts/truetype/Bevan-Regular.ttf
     install -Dm644 Bevan-Italic.ttf $out/share/fonts/truetype/Bevan-Italic.ttf
  '';

  meta = with lib; {
    description = "Bevan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
