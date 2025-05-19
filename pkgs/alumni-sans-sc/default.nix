{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alumni-sans-sc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/alumnisanssc/AlumniSansSC%5Bwght%5D.ttf?raw=true";
      name = "AlumniSansSC_wght_.ttf";
      sha256 = "41a67970fd2a6f6a806578451d7e9902b45008043de2d60bf47e005ec0dab922";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/alumnisanssc/AlumniSansSC-Italic%5Bwght%5D.ttf?raw=true";
      name = "AlumniSansSC-Italic_wght_.ttf";
      sha256 = "62b490f2ee301d2dda0554f4bfc68ac8ab905d89762716702391a49174554a26";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AlumniSansSC_wght_.ttf $out/share/fonts/truetype/AlumniSansSC_wght_.ttf
     install -Dm644 AlumniSansSC-Italic_wght_.ttf $out/share/fonts/truetype/AlumniSansSC-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Alumni Sans SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
