{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-hanifi-rohingya-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanshanifirohingya/NotoSansHanifiRohingya%5Bwght%5D.ttf?raw=true";
      name = "NotoSansHanifiRohingya_wght_.ttf";
      sha256 = "8ae85e850664b2d319c3b359bbf59b285e0e472afcaf96e34f37810e4b441d1b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansHanifiRohingya_wght_.ttf $out/share/fonts/truetype/NotoSansHanifiRohingya_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Hanifi Rohingya";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
