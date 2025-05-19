{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-cherokee-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanscherokee/NotoSansCherokee%5Bwght%5D.ttf?raw=true";
      name = "NotoSansCherokee_wght_.ttf";
      sha256 = "865d9e644f5011f2020a10325b7242f85c9c8ef0edece00e5ed743e5dfb275fd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansCherokee_wght_.ttf $out/share/fonts/truetype/NotoSansCherokee_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Cherokee";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
