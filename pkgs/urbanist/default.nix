{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "urbanist-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/urbanist/Urbanist%5Bwght%5D.ttf?raw=true";
      name = "Urbanist_wght_.ttf";
      sha256 = "748362d51eb276840e9f0023cd2d98299bf709a95fb3a5ae4ffcb624c638ebb9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/urbanist/Urbanist-Italic%5Bwght%5D.ttf?raw=true";
      name = "Urbanist-Italic_wght_.ttf";
      sha256 = "05ac7a65decda23806d1678d44b8ef23dd656d6793555499dd79ee24c3e777ed";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Urbanist_wght_.ttf $out/share/fonts/truetype/Urbanist_wght_.ttf
     install -Dm644 Urbanist-Italic_wght_.ttf $out/share/fonts/truetype/Urbanist-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Urbanist";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
