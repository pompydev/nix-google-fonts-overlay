{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-new-tai-lue-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansnewtailue/NotoSansNewTaiLue-Regular.ttf?raw=true";
      name = "NotoSansNewTaiLue-Regular.ttf";
      sha256 = "53005c3e1b61c5d3002510479144867a5a1370a32a78c5cf374f9a6dd576cf9b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansNewTaiLue-Regular.ttf $out/share/fonts/truetype/NotoSansNewTaiLue-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans New Tai Lue";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
