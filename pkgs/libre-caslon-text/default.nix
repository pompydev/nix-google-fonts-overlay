{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-caslon-text-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/librecaslontext/LibreCaslonText%5Bwght%5D.ttf?raw=true";
      name = "LibreCaslonText_wght_.ttf";
      sha256 = "c11809dbfd5445886293d89b32bfc2584075c80e77750cf1c284113e36b8b3f4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/librecaslontext/LibreCaslonText-Italic%5Bwght%5D.ttf?raw=true";
      name = "LibreCaslonText-Italic_wght_.ttf";
      sha256 = "60ca1a3aade61c8c381800ca85b9b2f0fb341d89ebe065e12cd6ec2ee2e53e54";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreCaslonText_wght_.ttf $out/share/fonts/truetype/LibreCaslonText_wght_.ttf
     install -Dm644 LibreCaslonText-Italic_wght_.ttf $out/share/fonts/truetype/LibreCaslonText-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Libre Caslon Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
