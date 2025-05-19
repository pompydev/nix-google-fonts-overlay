{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-franklin-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/librefranklin/LibreFranklin%5Bwght%5D.ttf?raw=true";
      name = "LibreFranklin_wght_.ttf";
      sha256 = "2329f394b10ed1c71107df20fddc11e2bb1b68c1ecbb385f975b36fd64a971f8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/librefranklin/LibreFranklin-Italic%5Bwght%5D.ttf?raw=true";
      name = "LibreFranklin-Italic_wght_.ttf";
      sha256 = "b8d2f40203bd4d90fe3e805953d9b79d62a6486db756d984b0d8ef4435b367ba";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreFranklin_wght_.ttf $out/share/fonts/truetype/LibreFranklin_wght_.ttf
     install -Dm644 LibreFranklin-Italic_wght_.ttf $out/share/fonts/truetype/LibreFranklin-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Libre Franklin";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
