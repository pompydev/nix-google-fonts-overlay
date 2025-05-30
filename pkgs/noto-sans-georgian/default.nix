{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-georgian-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansgeorgian/NotoSansGeorgian%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansGeorgian_wdth,wght_.ttf";
      sha256 = "dc591156f36842d38996c4a7a17fee9bb58e45da3e2cac7a31b7d33de700adb9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansGeorgian_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansGeorgian_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Georgian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
