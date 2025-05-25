{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "arsenal-sc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/arsenalsc/ArsenalSC-Regular.ttf?raw=true";
      name = "ArsenalSC-Regular.ttf";
      sha256 = "56d7ae5099045e6b04a963156f665abeb5cfec2b55af0ddec74af6564bc7af47";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/arsenalsc/ArsenalSC-Italic.ttf?raw=true";
      name = "ArsenalSC-Italic.ttf";
      sha256 = "e384e807ddd1888db1ae39fb96df3065e224b6d975dbef972e6697a7249547ef";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/arsenalsc/ArsenalSC-Bold.ttf?raw=true";
      name = "ArsenalSC-Bold.ttf";
      sha256 = "a06dae429de1ffd9de35b290bd0bc2cafc6e542390b118ab95f5414d2d99414b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/arsenalsc/ArsenalSC-BoldItalic.ttf?raw=true";
      name = "ArsenalSC-BoldItalic.ttf";
      sha256 = "f2e9fc066073bff6dbf4b99af102e9f303abab11886665df0346ffb3c54b090b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ArsenalSC-Regular.ttf $out/share/fonts/truetype/ArsenalSC-Regular.ttf
     install -Dm644 ArsenalSC-Italic.ttf $out/share/fonts/truetype/ArsenalSC-Italic.ttf
     install -Dm644 ArsenalSC-Bold.ttf $out/share/fonts/truetype/ArsenalSC-Bold.ttf
     install -Dm644 ArsenalSC-BoldItalic.ttf $out/share/fonts/truetype/ArsenalSC-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Arsenal SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
