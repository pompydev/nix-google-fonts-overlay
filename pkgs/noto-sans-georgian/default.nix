{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-georgian-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansgeorgian/NotoSansGeorgian%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansGeorgian_wdth,wght_.ttf";
      sha256 = "4fde7bd804de6e81d80c7a38e25b674062a7170b64c038ee24a0b0c3f5b1d7dc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansGeorgian_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansGeorgian_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Georgian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
