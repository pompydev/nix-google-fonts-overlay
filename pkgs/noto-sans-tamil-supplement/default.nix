{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tamil-supplement-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanstamilsupplement/NotoSansTamilSupplement-Regular.ttf?raw=true";
      name = "NotoSansTamilSupplement-Regular.ttf";
      sha256 = "0fadc30c3c3fd7846e607a3c0eaadcafc7c76579943bc8e7e2856c22d533b680";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTamilSupplement-Regular.ttf $out/share/fonts/truetype/NotoSansTamilSupplement-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Tamil Supplement";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
