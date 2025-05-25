{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tagbanwa-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanstagbanwa/NotoSansTagbanwa-Regular.ttf?raw=true";
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
