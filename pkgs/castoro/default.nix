{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "castoro-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/castoro/Castoro-Regular.ttf?raw=true";
      name = "Castoro-Regular.ttf";
      sha256 = "9af87f7db6ab1da918c0b0312bea5f4349782f1397b541a1d0fb2fc4ee35aead";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/castoro/Castoro-Italic.ttf?raw=true";
      name = "Castoro-Italic.ttf";
      sha256 = "802fea3a19b819c1b2705ef3c1c0bff3b8e37f832e40da1d2e6932d733f99fcc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Castoro-Regular.ttf $out/share/fonts/truetype/Castoro-Regular.ttf
     install -Dm644 Castoro-Italic.ttf $out/share/fonts/truetype/Castoro-Italic.ttf
  '';

  meta = with lib; {
    description = "Castoro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
