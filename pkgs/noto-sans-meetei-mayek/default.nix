{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-meetei-mayek-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansmeeteimayek/NotoSansMeeteiMayek%5Bwght%5D.ttf?raw=true";
      name = "NotoSansMeeteiMayek_wght_.ttf";
      sha256 = "d56eb6d54ad8aad3570b7ee07f64866832a04f29bce6e5f183918c9eaf008fac";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMeeteiMayek_wght_.ttf $out/share/fonts/truetype/NotoSansMeeteiMayek_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Meetei Mayek";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
