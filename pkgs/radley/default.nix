{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "radley-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/radley/Radley-Regular.ttf?raw=true";
      name = "Radley-Regular.ttf";
      sha256 = "22012c9224fd2e6fe87bbea65648063a5a56dfca17282d65a4c1db4fd863dba7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/radley/Radley-Italic.ttf?raw=true";
      name = "Radley-Italic.ttf";
      sha256 = "31be2a0bbae272eae2ae125e059c67e113990620da4190cf966d7e2182152bcf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Radley-Regular.ttf $out/share/fonts/truetype/Radley-Regular.ttf
     install -Dm644 Radley-Italic.ttf $out/share/fonts/truetype/Radley-Italic.ttf
  '';

  meta = with lib; {
    description = "Radley";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
