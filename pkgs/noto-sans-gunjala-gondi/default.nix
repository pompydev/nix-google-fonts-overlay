{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-gunjala-gondi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansgunjalagondi/NotoSansGunjalaGondi%5Bwght%5D.ttf?raw=true";
      name = "NotoSansGunjalaGondi_wght_.ttf";
      sha256 = "1de8a430d5c176994d1c5ae61151af141ae39fcb38a29f340b1f46e7ad9522d4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansGunjalaGondi_wght_.ttf $out/share/fonts/truetype/NotoSansGunjalaGondi_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Gunjala Gondi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
