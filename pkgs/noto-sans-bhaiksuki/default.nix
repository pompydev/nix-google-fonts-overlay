{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-bhaiksuki-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansbhaiksuki/NotoSansBhaiksuki-Regular.ttf?raw=true";
      name = "NotoSansBhaiksuki-Regular.ttf";
      sha256 = "c2b72982fc4c28287a5df6dccfbec65d2a74e3f7526e4a083195160d6211f80d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansBhaiksuki-Regular.ttf $out/share/fonts/truetype/NotoSansBhaiksuki-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Bhaiksuki";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
