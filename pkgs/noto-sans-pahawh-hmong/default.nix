{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-pahawh-hmong-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanspahawhhmong/NotoSansPahawhHmong-Regular.ttf?raw=true";
      name = "NotoSansPahawhHmong-Regular.ttf";
      sha256 = "303dbcc71425c331cc5d293254acfdf15aed04cf5e0075ecba0ed0d8a5d5862b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansPahawhHmong-Regular.ttf $out/share/fonts/truetype/NotoSansPahawhHmong-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Pahawh Hmong";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
