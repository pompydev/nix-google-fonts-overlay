{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tagbanwa-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanstagbanwa/NotoSansTagbanwa-Regular.ttf?raw=true";
      name = "NotoSansTagbanwa-Regular.ttf";
      sha256 = "9f9288024e3eddfd3ce77088c4806e0515d47aa093b1a04bc7bc24bdfd5d998a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTagbanwa-Regular.ttf $out/share/fonts/truetype/NotoSansTagbanwa-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Tagbanwa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
