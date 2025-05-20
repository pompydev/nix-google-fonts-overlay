{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anybody-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/anybody/Anybody%5Bwdth,wght%5D.ttf?raw=true";
      name = "Anybody_wdth,wght_.ttf";
      sha256 = "b184bd7e6ca8348bbaecec98951565729d7e89b7872d4898a1f9981342b5b64c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/anybody/Anybody-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "Anybody-Italic_wdth,wght_.ttf";
      sha256 = "f9a465a1e5af36e30c37ba11812e4763e3c37febda2c2244acbcec8092063fd7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Anybody_wdth-wght_.ttf $out/share/fonts/truetype/Anybody_wdth-wght_.ttf
     install -Dm644 Anybody-Italic_wdth-wght_.ttf $out/share/fonts/truetype/Anybody-Italic_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Anybody";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
