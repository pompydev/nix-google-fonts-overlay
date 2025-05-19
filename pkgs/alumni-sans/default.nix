{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alumni-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/alumnisans/AlumniSans%5Bwght%5D.ttf?raw=true";
      name = "AlumniSans_wght_.ttf";
      sha256 = "9255d5201c7aba5bf1bde1e8521f0fee691f0588b83f40db228a5f9bbaacfbc4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/alumnisans/AlumniSans-Italic%5Bwght%5D.ttf?raw=true";
      name = "AlumniSans-Italic_wght_.ttf";
      sha256 = "2ad29364c0841c2057eee44b3d13deb2af74d3f13e14bc519a8dfd4142c1ad54";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AlumniSans_wght_.ttf $out/share/fonts/truetype/AlumniSans_wght_.ttf
     install -Dm644 AlumniSans-Italic_wght_.ttf $out/share/fonts/truetype/AlumniSans-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Alumni Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
