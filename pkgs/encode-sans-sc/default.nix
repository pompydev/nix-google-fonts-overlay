{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "encode-sans-sc-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a13d629c86d6880db5df718f4eaae0ee90a53d85/ofl/encodesanssc/EncodeSansSC[wdth,wght].ttf?raw=true";
      name = "EncodeSansSC[wdth,wght].ttf";
      sha256 = "fcad22c3440992bf42216e6a0ad6e8640d2d1dfff1ddc5573934933152123bd0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'EncodeSansSC[wdth,wght].ttf' $out/share/fonts/truetype/'EncodeSansSC[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Encode Sans SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
