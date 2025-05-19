{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "reem-kufi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/reemkufi/ReemKufi%5Bwght%5D.ttf?raw=true";
      name = "ReemKufi_wght_.ttf";
      sha256 = "dfaf50e19cb9faa2b35cff3e88aab6d28d0aa6d0298b3f5ddc398b9e0e8732ab";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ReemKufi_wght_.ttf $out/share/fonts/truetype/ReemKufi_wght_.ttf
  '';

  meta = with lib; {
    description = "Reem Kufi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
