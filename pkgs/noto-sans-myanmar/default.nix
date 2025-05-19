{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-myanmar-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansmyanmar/NotoSansMyanmar%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansMyanmar_wdth,wght_.ttf";
      sha256 = "7abbbfbe2514105d7ce94937aee3feb2ba89b73a256c8b77b5866bd9b83e32ec";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMyanmar_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansMyanmar_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Myanmar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
