{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tiro-devanagari-sanskrit-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/265268499351c2a22f660b9ded70cb111eea4203/ofl/tirodevanagarisanskrit/TiroDevanagariSanskrit-Regular.ttf?raw=true";
      name = "TiroDevanagariSanskrit-Regular.ttf";
      sha256 = "75ae873e5e3f9c30fb962a3d283b9f5e7bc5bca57822a2aa926753b297b150ca";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/265268499351c2a22f660b9ded70cb111eea4203/ofl/tirodevanagarisanskrit/TiroDevanagariSanskrit-Italic.ttf?raw=true";
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
