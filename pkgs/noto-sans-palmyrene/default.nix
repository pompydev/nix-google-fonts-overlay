{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-palmyrene-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanspalmyrene/NotoSansPalmyrene-Regular.ttf?raw=true";
      name = "NotoSansPalmyrene-Regular.ttf";
      sha256 = "f8d17a44b0a90e742d4213fbba95ca61f5cc1c0b7e14127e93a8e7e86d975718";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansPalmyrene-Regular.ttf $out/share/fonts/truetype/NotoSansPalmyrene-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Palmyrene";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
