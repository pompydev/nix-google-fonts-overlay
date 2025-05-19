{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sulphur-point-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sulphurpoint/SulphurPoint-Light.ttf?raw=true";
      name = "SulphurPoint-Light.ttf";
      sha256 = "5d3aa827b5fd1544712081f4509df1451c36b1d10191291862902a51c7f78801";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sulphurpoint/SulphurPoint-Regular.ttf?raw=true";
      name = "SulphurPoint-Regular.ttf";
      sha256 = "46d6d54960c777007434e2a992b0ecf63c9f554c2b27f059321f4204662dcb6a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sulphurpoint/SulphurPoint-Bold.ttf?raw=true";
      name = "SulphurPoint-Bold.ttf";
      sha256 = "6c486637421b3b7507ade75795ca51abd5063fb74f2811618f393fae6d9ce8cb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SulphurPoint-Light.ttf $out/share/fonts/truetype/SulphurPoint-Light.ttf
     install -Dm644 SulphurPoint-Regular.ttf $out/share/fonts/truetype/SulphurPoint-Regular.ttf
     install -Dm644 SulphurPoint-Bold.ttf $out/share/fonts/truetype/SulphurPoint-Bold.ttf
  '';

  meta = with lib; {
    description = "Sulphur Point";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
