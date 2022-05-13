{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-hatran-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanshatran/NotoSansHatran-Regular.ttf?raw=true";
      name = "NotoSansHatran-Regular.ttf";
      sha256 = "b4c2cee352c218a47f64c186636bd28ef7646156a5171ca348f2fbf8773e83fa";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansHatran-Regular.ttf $out/share/fonts/truetype/NotoSansHatran-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Hatran";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
