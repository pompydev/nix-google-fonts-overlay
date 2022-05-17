{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "varta-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fea96ec714e4a082faf107e54e65103ac4f2a0eb/ofl/varta/Varta[wght].ttf?raw=true";
      name = "Varta_wght_.ttf";
      sha256 = "45933f4041ba1df953c13bdab388bf3127c7081b2e7dfbe71e36f9214d05760f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Varta_wght_.ttf $out/share/fonts/truetype/Varta_wght_.ttf
  '';

  meta = with lib; {
    description = "Varta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
