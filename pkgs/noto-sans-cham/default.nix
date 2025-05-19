{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-cham-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanscham/NotoSansCham%5Bwght%5D.ttf?raw=true";
      name = "NotoSansCham_wght_.ttf";
      sha256 = "0b4db93cffadd22de4668cdf8238725f0eedf5c2fcbf89a36bb24ccc82a1d889";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansCham_wght_.ttf $out/share/fonts/truetype/NotoSansCham_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Cham";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
