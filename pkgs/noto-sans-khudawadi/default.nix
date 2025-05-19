{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-khudawadi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanskhudawadi/NotoSansKhudawadi-Regular.ttf?raw=true";
      name = "NotoSansKhudawadi-Regular.ttf";
      sha256 = "1650e84136b1e9a4e3b4e8f2e96b3542be7587716c58b4c0da6814ed1d87a721";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansKhudawadi-Regular.ttf $out/share/fonts/truetype/NotoSansKhudawadi-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Khudawadi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
