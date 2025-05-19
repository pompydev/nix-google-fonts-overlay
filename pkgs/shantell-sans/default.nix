{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "shantell-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/shantellsans/ShantellSans%5BBNCE,INFM,SPAC,wght%5D.ttf?raw=true";
      name = "ShantellSans_BNCE,INFM,SPAC,wght_.ttf";
      sha256 = "d98a7913853f78d71aa0b86daf66b5eddb5a3266c07bfd51ef70632b88c41084";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/shantellsans/ShantellSans-Italic%5BBNCE,INFM,SPAC,wght%5D.ttf?raw=true";
      name = "ShantellSans-Italic_BNCE,INFM,SPAC,wght_.ttf";
      sha256 = "269eb72414b3e7eb66fe5159ce507a61266485c41dbcbc1b44a25fadeb4a2c71";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ShantellSans_BNCE,INFM,SPAC,wght_.ttf $out/share/fonts/truetype/ShantellSans_BNCE,INFM,SPAC,wght_.ttf
     install -Dm644 ShantellSans-Italic_BNCE,INFM,SPAC,wght_.ttf $out/share/fonts/truetype/ShantellSans-Italic_BNCE,INFM,SPAC,wght_.ttf
  '';

  meta = with lib; {
    description = "Shantell Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
