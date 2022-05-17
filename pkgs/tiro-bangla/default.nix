{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tiro-bangla-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3d54dc796a267cfb25d9f99f5b36b96202e98394/ofl/tirobangla/TiroBangla-Regular.ttf?raw=true";
      name = "TiroBangla-Regular.ttf";
      sha256 = "a763523dc3f90a71962cb8d9400b8f0a86b40b2cb01676f165101a2967127ae4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3d54dc796a267cfb25d9f99f5b36b96202e98394/ofl/tirobangla/TiroBangla-Italic.ttf?raw=true";
      name = "TiroBangla-Italic.ttf";
      sha256 = "deb8330a56697cfabef8ff393c6d36af60531229b138bf9a3ffe834330cb03e1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TiroBangla-Regular.ttf $out/share/fonts/truetype/TiroBangla-Regular.ttf
     install -Dm644 TiroBangla-Italic.ttf $out/share/fonts/truetype/TiroBangla-Italic.ttf
  '';

  meta = with lib; {
    description = "Tiro Bangla";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
