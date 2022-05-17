{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-telugu-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoseriftelugu/NotoSerifTelugu%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifTelugu_wght_.ttf";
      sha256 = "9ee37ceffe84c87216c14a182da0f312cc925baf069f74eba5a762d8fac8ef8a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifTelugu_wght_.ttf $out/share/fonts/truetype/NotoSerifTelugu_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Telugu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
