{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-zanabazar-square-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanszanabazarsquare/NotoSansZanabazarSquare-Regular.ttf?raw=true";
      name = "NotoSansZanabazarSquare-Regular.ttf";
      sha256 = "7fa099bf15f01ab7ac6fa001658d08696bf3321f6bed3e3b569fdc266e334745";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansZanabazarSquare-Regular.ttf $out/share/fonts/truetype/NotoSansZanabazarSquare-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Zanabazar Square";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
