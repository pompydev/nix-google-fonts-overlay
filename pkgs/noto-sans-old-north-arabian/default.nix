{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-old-north-arabian-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansoldnortharabian/NotoSansOldNorthArabian-Regular.ttf?raw=true";
      name = "NotoSansOldNorthArabian-Regular.ttf";
      sha256 = "9068680d32d6bc14909bd1917d0270ce83e655f5e4d76c94ac55fc9a0a16d17f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOldNorthArabian-Regular.ttf $out/share/fonts/truetype/NotoSansOldNorthArabian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Old North Arabian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
