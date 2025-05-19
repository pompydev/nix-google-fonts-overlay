{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sofia-sans-condensed-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sofiasanscondensed/SofiaSansCondensed%5Bwght%5D.ttf?raw=true";
      name = "SofiaSansCondensed_wght_.ttf";
      sha256 = "3282c4e1a09d14e91c5fdb10aadee93048d017fa00f857f43fdcc29c989221fd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sofiasanscondensed/SofiaSansCondensed-Italic%5Bwght%5D.ttf?raw=true";
      name = "SofiaSansCondensed-Italic_wght_.ttf";
      sha256 = "5832d10c7277b70baf954c3a9f5e235da075daa187dfa59c86b8e62649f81250";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SofiaSansCondensed_wght_.ttf $out/share/fonts/truetype/SofiaSansCondensed_wght_.ttf
     install -Dm644 SofiaSansCondensed-Italic_wght_.ttf $out/share/fonts/truetype/SofiaSansCondensed-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Sofia Sans Condensed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
