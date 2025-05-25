{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cantarell-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cantarell/Cantarell-Regular.ttf?raw=true";
      name = "Cantarell-Regular.ttf";
      sha256 = "840a255779258a2b24b5e3d1f32a821ed641fdd5ef1e47c4dc180064db9ccfa1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cantarell/Cantarell-Italic.ttf?raw=true";
      name = "Cantarell-Italic.ttf";
      sha256 = "113797007a0baa9eaba2688de40b51f1d907f5c4f2add61cfd25a5e626153613";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cantarell/Cantarell-Bold.ttf?raw=true";
      name = "Cantarell-Bold.ttf";
      sha256 = "1b15d4acd20df636755bafa1e026e73fb277740aa27442198795fcf0d1cb9818";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cantarell/Cantarell-BoldItalic.ttf?raw=true";
      name = "Cantarell-BoldItalic.ttf";
      sha256 = "913df4975de5e304a2395c7e1b9c994dad4bc93f1e80b94ec8662113d87d3e3b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cantarell-Regular.ttf $out/share/fonts/truetype/Cantarell-Regular.ttf
     install -Dm644 Cantarell-Italic.ttf $out/share/fonts/truetype/Cantarell-Italic.ttf
     install -Dm644 Cantarell-Bold.ttf $out/share/fonts/truetype/Cantarell-Bold.ttf
     install -Dm644 Cantarell-BoldItalic.ttf $out/share/fonts/truetype/Cantarell-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Cantarell";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
