{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-linear-b-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanslinearb/NotoSansLinearB-Regular.ttf?raw=true";
      name = "NotoSansLinearB-Regular.ttf";
      sha256 = "15faf3ff9b5d0343edb7ed4e55b2c9f5ba907473197d65f0739dc3a34d9bf334";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansLinearB-Regular.ttf $out/share/fonts/truetype/NotoSansLinearB-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Linear B";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
