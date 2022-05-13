{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-old-persian-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansoldpersian/NotoSansOldPersian-Regular.ttf?raw=true";
      name = "NotoSansOldPersian-Regular.ttf";
      sha256 = "cda81a3d030784988209f9fb7cdf9b8a8ced66f3bd59239184d53e2158229893";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOldPersian-Regular.ttf $out/share/fonts/truetype/NotoSansOldPersian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Old Persian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
