{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-runic-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansrunic/NotoSansRunic-Regular.ttf?raw=true";
      name = "NotoSansRunic-Regular.ttf";
      sha256 = "49e540798dedccf24301437fb5ea5c8a3f42143b1b6c108c1d48c78a41c4ce0f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansRunic-Regular.ttf $out/share/fonts/truetype/NotoSansRunic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Runic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
