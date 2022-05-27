{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-gunjala-gondi-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansgunjalagondi/NotoSansGunjalaGondi-Regular.ttf?raw=true";
      name = "NotoSansGunjalaGondi-Regular.ttf";
      sha256 = "10b7744bfd151e4ad844155cefd0f60032b005269cf34738fea02b0ff5dacf9c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansGunjalaGondi-Regular.ttf $out/share/fonts/truetype/NotoSansGunjalaGondi-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Gunjala Gondi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
