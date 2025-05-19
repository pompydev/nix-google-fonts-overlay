{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-phagspa-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansphagspa/NotoSansPhagsPa-Regular.ttf?raw=true";
      name = "NotoSansPhagsPa-Regular.ttf";
      sha256 = "1f90e0a9e6b83c903e4ed9470261ba4e61b7068de2063516665b62c1bf389dab";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansPhagsPa-Regular.ttf $out/share/fonts/truetype/NotoSansPhagsPa-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans PhagsPa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
