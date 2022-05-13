{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-phoenician-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansphoenician/NotoSansPhoenician-Regular.ttf?raw=true";
      name = "NotoSansPhoenician-Regular.ttf";
      sha256 = "a79d2c4f0b4c04cfb8dc97c91145d29dc89965f3afc3985f7c4006ccbde58def";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansPhoenician-Regular.ttf $out/share/fonts/truetype/NotoSansPhoenician-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Phoenician";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
