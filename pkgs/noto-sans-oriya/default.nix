{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-oriya-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansoriya/NotoSansOriya%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansOriya_wdth,wght_.ttf";
      sha256 = "29d1f34f038175f43a8ce650116992b72e2df64ed8d4bef2b36921e1884dd694";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOriya_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansOriya_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Oriya";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
