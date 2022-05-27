{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-linear-a-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanslineara/NotoSansLinearA-Regular.ttf?raw=true";
      name = "NotoSansLinearA-Regular.ttf";
      sha256 = "230daa2578f04ad8a38441f1cf128d70d64dc90fca891fd3e93c15693701564e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansLinearA-Regular.ttf $out/share/fonts/truetype/NotoSansLinearA-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Linear A";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
