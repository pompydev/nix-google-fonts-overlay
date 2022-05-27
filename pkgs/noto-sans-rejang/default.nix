{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-rejang-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansrejang/NotoSansRejang-Regular.ttf?raw=true";
      name = "NotoSansRejang-Regular.ttf";
      sha256 = "929034bf94778de56bcfda14d4099eaf094e472eb4db2b173b6e838ab35d4427";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansRejang-Regular.ttf $out/share/fonts/truetype/NotoSansRejang-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Rejang";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
