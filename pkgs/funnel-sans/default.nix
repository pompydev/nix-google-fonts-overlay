{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "funnel-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/funnelsans/FunnelSans%5Bwght%5D.ttf?raw=true";
      name = "FunnelSans_wght_.ttf";
      sha256 = "652c9834434bc01835c4e75a73d3c7e42ff2e4beb261cc851cb911e889af6a77";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/funnelsans/FunnelSans-Italic%5Bwght%5D.ttf?raw=true";
      name = "FunnelSans-Italic_wght_.ttf";
      sha256 = "bc8670ca582ceb02139c7d301b7bf0d87bccc56f16173583d8aa89829c98af0e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FunnelSans_wght_.ttf $out/share/fonts/truetype/FunnelSans_wght_.ttf
     install -Dm644 FunnelSans-Italic_wght_.ttf $out/share/fonts/truetype/FunnelSans-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Funnel Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
