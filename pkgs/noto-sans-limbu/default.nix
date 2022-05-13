{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-limbu-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanslimbu/NotoSansLimbu-Regular.ttf?raw=true";
      name = "NotoSansLimbu-Regular.ttf";
      sha256 = "2a7e9f84c1dedb1016a841a81363b2e609090c78799afe01247ccb0f25efd9b0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansLimbu-Regular.ttf $out/share/fonts/truetype/NotoSansLimbu-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Limbu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
