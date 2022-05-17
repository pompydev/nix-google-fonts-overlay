{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-arabic-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansarabic/NotoSansArabic[wdth,wght].ttf?raw=true";
      name = "NotoSansArabic_wdth,wght_.ttf";
      sha256 = "0034c0191a40ff93d03409e666be59c1dbb5b7a54f0e300a864b588ba850ad5b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansArabic_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansArabic_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Arabic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
