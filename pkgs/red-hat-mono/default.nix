{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "red-hat-mono-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78451af6645cd74705cc18b245107637010d6b79/ofl/redhatmono/RedHatMono[wght].ttf?raw=true";
      name = "RedHatMono[wght].ttf";
      sha256 = "04bb17e675f38652f94f108b923d55dc1508a85fb807bdf4b2d5759557e93f2f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/78451af6645cd74705cc18b245107637010d6b79/ofl/redhatmono/RedHatMono-Italic[wght].ttf?raw=true";
      name = "RedHatMono-Italic[wght].ttf";
      sha256 = "26d35c573ca0b1909c9b32d6237a1859046029c4cfa20f7b9238a9a39760e1f6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'RedHatMono[wght].ttf' $out/share/fonts/truetype/'RedHatMono[wght].ttf'
     install -Dm644 'RedHatMono-Italic[wght].ttf' $out/share/fonts/truetype/'RedHatMono-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Red Hat Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
