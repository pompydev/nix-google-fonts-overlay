{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-cuneiform-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanscuneiform/NotoSansCuneiform-Regular.ttf?raw=true";
      name = "NotoSansCuneiform-Regular.ttf";
      sha256 = "1138815fabc470753e09876c6deeb4a006219b756e6b2d9bfe0e91aa4bcc21e1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansCuneiform-Regular.ttf $out/share/fonts/truetype/NotoSansCuneiform-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Cuneiform";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
