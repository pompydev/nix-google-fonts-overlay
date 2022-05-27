{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-hanifi-rohingya-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanshanifirohingya/NotoSansHanifiRohingya%5Bwght%5D.ttf?raw=true";
      name = "NotoSansHanifiRohingya_wght_.ttf";
      sha256 = "11295c1cb5d0144bec38c240614fffdcf9fce4f8eaa17e119bbae3fb87a00767";
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
