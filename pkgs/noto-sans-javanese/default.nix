{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-javanese-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansjavanese/NotoSansJavanese-Regular.ttf?raw=true";
      name = "NotoSansJavanese-Regular.ttf";
      sha256 = "faff63a3ea4c5a882508d85935f02e4f80e923551d4716e27706dd3c6cb07d67";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansjavanese/NotoSansJavanese-Bold.ttf?raw=true";
      name = "NotoSansJavanese-Bold.ttf";
      sha256 = "5f22e4a45700f7ec3f1eb36d36fbc9669f7c2fe418fa32088857b9f7c214d764";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansJavanese-Regular.ttf $out/share/fonts/truetype/NotoSansJavanese-Regular.ttf
     install -Dm644 NotoSansJavanese-Bold.ttf $out/share/fonts/truetype/NotoSansJavanese-Bold.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Javanese";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
