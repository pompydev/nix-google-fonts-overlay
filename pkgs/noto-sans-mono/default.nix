{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-mono-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmono/NotoSansMono[wdth,wght].ttf?raw=true";
      name = "NotoSansMono_wdth,wght_.ttf";
      sha256 = "83433121d6c3235a30b5b5b779f11daa7d76aefc3d2c8388bb48296694a73ccd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMono_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansMono_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
