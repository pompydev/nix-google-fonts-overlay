{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-psalter-pahlavi-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanspsalterpahlavi/NotoSansPsalterPahlavi-Regular.ttf?raw=true";
      name = "NotoSansPsalterPahlavi-Regular.ttf";
      sha256 = "90878c31ab37edb5f75c487e1a61ef5082acfecc2a74798f38499cbab3746dbb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansPsalterPahlavi-Regular.ttf $out/share/fonts/truetype/NotoSansPsalterPahlavi-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Psalter Pahlavi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
