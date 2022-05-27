{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-multani-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmultani/NotoSansMultani-Regular.ttf?raw=true";
      name = "NotoSansMultani-Regular.ttf";
      sha256 = "feb45da05d09031ab31c9e34492c2672f6134c911eb73b66dab5ee1efd860973";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMultani-Regular.ttf $out/share/fonts/truetype/NotoSansMultani-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Multani";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
