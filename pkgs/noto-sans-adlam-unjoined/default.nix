{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-adlam-unjoined-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansadlamunjoined/NotoSansAdlamUnjoined%5Bwght%5D.ttf?raw=true";
      name = "NotoSansAdlamUnjoined_wght_.ttf";
      sha256 = "edd3827faf66232eede488883b7bc73fdc7de0cddc96cfc1e3a72c7a73e5f2a2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansAdlamUnjoined_wght_.ttf $out/share/fonts/truetype/NotoSansAdlamUnjoined_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Adlam Unjoined";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
