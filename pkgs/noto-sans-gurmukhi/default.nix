{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-gurmukhi-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansgurmukhi/NotoSansGurmukhi%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansGurmukhi_wdth,wght_.ttf";
      sha256 = "52cadbb92119cd25ea3096b4df5914f911d8961232427bd4338772a70800eb25";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansGurmukhi_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansGurmukhi_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Gurmukhi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
