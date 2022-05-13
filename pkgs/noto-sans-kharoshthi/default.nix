{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-kharoshthi-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanskharoshthi/NotoSansKharoshthi-Regular.ttf?raw=true";
      name = "NotoSansKharoshthi-Regular.ttf";
      sha256 = "debbf499348e5a8ac8e292fef6cb4a9e24438ef8abfc4f50a3d32287e4a466d3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansKharoshthi-Regular.ttf $out/share/fonts/truetype/NotoSansKharoshthi-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Kharoshthi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
