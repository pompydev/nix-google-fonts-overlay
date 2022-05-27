{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "reem-kufi-ink-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3321ecdb8a5dfe8133e867b6a4af4377a7a78f25/ofl/reemkufiink/ReemKufiInk-Regular.ttf?raw=true";
      name = "ReemKufiInk-Regular.ttf";
      sha256 = "0e82878de9a528f7d0028a48126b9e3fe36615227f0c0ce0db9c5d3fa92ee944";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3321ecdb8a5dfe8133e867b6a4af4377a7a78f25/ofl/reemkufiink/ReemKufiInk-Bold.ttf?raw=true";
      name = "ReemKufiInk-Bold.ttf";
      sha256 = "2630619c55a4338e6108cc17b74b69d84d927f63fd8b74335a8f80479613aa03";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ReemKufiInk-Regular.ttf $out/share/fonts/truetype/ReemKufiInk-Regular.ttf
     install -Dm644 ReemKufiInk-Bold.ttf $out/share/fonts/truetype/ReemKufiInk-Bold.ttf
  '';

  meta = with lib; {
    description = "Reem Kufi Ink";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
