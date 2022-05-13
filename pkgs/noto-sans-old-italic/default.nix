{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-old-italic-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansolditalic/NotoSansOldItalic-Regular.ttf?raw=true";
      name = "NotoSansOldItalic-Regular.ttf";
      sha256 = "732462966b4e78346875e63b78c66094d64bf2a3a9a56d4084f623a542f74904";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOldItalic-Regular.ttf $out/share/fonts/truetype/NotoSansOldItalic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Old Italic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
