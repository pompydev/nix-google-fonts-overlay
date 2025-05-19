{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tiro-devanagari-sanskrit-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/tirodevanagarisanskrit/TiroDevanagariSanskrit-Regular.ttf?raw=true";
      name = "TiroDevanagariSanskrit-Regular.ttf";
      sha256 = "75ae873e5e3f9c30fb962a3d283b9f5e7bc5bca57822a2aa926753b297b150ca";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/tirodevanagarisanskrit/TiroDevanagariSanskrit-Italic.ttf?raw=true";
      name = "TiroDevanagariSanskrit-Italic.ttf";
      sha256 = "9641914032154ea68a7caed100320cf547d63891a1e3962033ba91dc9c33ac2b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TiroDevanagariSanskrit-Regular.ttf $out/share/fonts/truetype/TiroDevanagariSanskrit-Regular.ttf
     install -Dm644 TiroDevanagariSanskrit-Italic.ttf $out/share/fonts/truetype/TiroDevanagariSanskrit-Italic.ttf
  '';

  meta = with lib; {
    description = "Tiro Devanagari Sanskrit";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
