{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kumbh-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kumbhsans/KumbhSans%5BYOPQ,wght%5D.ttf?raw=true";
      name = "KumbhSans_YOPQ,wght_.ttf";
      sha256 = "f29b8814e682a1524c1b6cad866700c844c287c2df1f6d362dcaec4cc75dadf9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KumbhSans_YOPQ,wght_.ttf $out/share/fonts/truetype/KumbhSans_YOPQ,wght_.ttf
  '';

  meta = with lib; {
    description = "Kumbh Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
