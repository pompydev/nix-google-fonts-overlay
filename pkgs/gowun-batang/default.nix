{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gowun-batang-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/539f6c4bb51e9b328dd5826bcbf2fd9b1ce56e19/ofl/gowunbatang/GowunBatang-Regular.ttf?raw=true";
      name = "GowunBatang-Regular.ttf";
      sha256 = "466c593e7147412e748af4856d5ad14709b5a860bdf62b9c2546f2c5874e9849";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/539f6c4bb51e9b328dd5826bcbf2fd9b1ce56e19/ofl/gowunbatang/GowunBatang-Bold.ttf?raw=true";
      name = "GowunBatang-Bold.ttf";
      sha256 = "dbfcaa646e5831e7478524924f02906f550285a5050699b4e38c9950b3ec4b94";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GowunBatang-Regular.ttf $out/share/fonts/truetype/GowunBatang-Regular.ttf
     install -Dm644 GowunBatang-Bold.ttf $out/share/fonts/truetype/GowunBatang-Bold.ttf
  '';

  meta = with lib; {
    description = "Gowun Batang";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
