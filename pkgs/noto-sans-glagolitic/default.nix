{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-glagolitic-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansglagolitic/NotoSansGlagolitic-Regular.ttf?raw=true";
      name = "NotoSansGlagolitic-Regular.ttf";
      sha256 = "5526e640b205befa2f59b3c46513fc94be896a13c4428f84000eb22f8a8f3a32";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansGlagolitic-Regular.ttf $out/share/fonts/truetype/NotoSansGlagolitic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Glagolitic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
