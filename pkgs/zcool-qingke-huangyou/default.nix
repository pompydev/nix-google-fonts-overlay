{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zcool-qingke-huangyou-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/zcoolqingkehuangyou/ZCOOLQingKeHuangYou-Regular.ttf?raw=true";
      name = "ZCOOLQingKeHuangYou-Regular.ttf";
      sha256 = "54f0c0df4308cd74cd0f2fd3494ae054dbc4a1fd6fa7d71f4807eb4cdd8b4136";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ZCOOLQingKeHuangYou-Regular.ttf $out/share/fonts/truetype/ZCOOLQingKeHuangYou-Regular.ttf
  '';

  meta = with lib; {
    description = "ZCOOL QingKe HuangYou";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
