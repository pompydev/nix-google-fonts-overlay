{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alumni-sans-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9f8863f59281e444a6273b30fa23cbc59eac304d/ofl/alumnisans/AlumniSans[wght].ttf?raw=true";
      name = "AlumniSans[wght].ttf";
      sha256 = "9255d5201c7aba5bf1bde1e8521f0fee691f0588b83f40db228a5f9bbaacfbc4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9f8863f59281e444a6273b30fa23cbc59eac304d/ofl/alumnisans/AlumniSans-Italic[wght].ttf?raw=true";
      name = "AlumniSans-Italic[wght].ttf";
      sha256 = "2ad29364c0841c2057eee44b3d13deb2af74d3f13e14bc519a8dfd4142c1ad54";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'AlumniSans[wght].ttf' $out/share/fonts/truetype/'AlumniSans[wght].ttf'
     install -Dm644 'AlumniSans-Italic[wght].ttf' $out/share/fonts/truetype/'AlumniSans-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Alumni Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
