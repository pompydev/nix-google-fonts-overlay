{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tai-heritage-pro-${version}";
  version = "2022-05-12-152025";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f6d3dee82ebbc3bec83e78e200f6d0b62a9d702e/ofl/taiheritagepro/TaiHeritagePro-Regular.ttf?raw=true";
      name = "TaiHeritagePro-Regular.ttf";
      sha256 = "dd2e9d518584b2214762ab4de572c5bd2d3955c0d32b74739a5c471412e2bbac";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f6d3dee82ebbc3bec83e78e200f6d0b62a9d702e/ofl/taiheritagepro/TaiHeritagePro-Bold.ttf?raw=true";
      name = "TaiHeritagePro-Bold.ttf";
      sha256 = "658ba5d655942e0139233cc8e8a7e04529976c38dd9abd80a093dceccad42ff4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TaiHeritagePro-Regular.ttf $out/share/fonts/truetype/TaiHeritagePro-Regular.ttf
     install -Dm644 TaiHeritagePro-Bold.ttf $out/share/fonts/truetype/TaiHeritagePro-Bold.ttf
  '';

  meta = with lib; {
    description = "Tai Heritage Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
