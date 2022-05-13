{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-inscriptional-parthian-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansinscriptionalparthian/NotoSansInscriptionalParthian-Regular.ttf?raw=true";
      name = "NotoSansInscriptionalParthian-Regular.ttf";
      sha256 = "6389b35ade6db9c469309d84034057c6738a032abe13f4eb2435cfd86ed10cc4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansInscriptionalParthian-Regular.ttf $out/share/fonts/truetype/NotoSansInscriptionalParthian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Inscriptional Parthian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
