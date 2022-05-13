{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-elymaic-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanselymaic/NotoSansElymaic-Regular.ttf?raw=true";
      name = "NotoSansElymaic-Regular.ttf";
      sha256 = "47760a41aa36d69b442a3988e12b904290c24e7b54ff11762d826e84aa0c1e7a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansElymaic-Regular.ttf $out/share/fonts/truetype/NotoSansElymaic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Elymaic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
