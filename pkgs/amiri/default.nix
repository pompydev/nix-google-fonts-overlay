{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "amiri-${version}";
  version = "2022-05-23-195233";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4210df1abd7797158390c50c4a36dc8bcdb07f09/ofl/amiri/Amiri-Regular.ttf?raw=true";
      name = "Amiri-Regular.ttf";
      sha256 = "6f909d81f17de2919be4ce99fac51b07623794d9a46cfd1df53e2d6e669d9263";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4210df1abd7797158390c50c4a36dc8bcdb07f09/ofl/amiri/Amiri-Italic.ttf?raw=true";
      name = "Amiri-Italic.ttf";
      sha256 = "df76cc7db0656e22c1968436586fd60d86caa0a3ec933034211f4f39dd7e8a7f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4210df1abd7797158390c50c4a36dc8bcdb07f09/ofl/amiri/Amiri-Bold.ttf?raw=true";
      name = "Amiri-Bold.ttf";
      sha256 = "a0e7946a97cd016e4322c3d3dc06bdc62776a5c933e9a3417ad74c91d822b9bd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4210df1abd7797158390c50c4a36dc8bcdb07f09/ofl/amiri/Amiri-BoldItalic.ttf?raw=true";
      name = "Amiri-BoldItalic.ttf";
      sha256 = "25c7d04a613c4c38a55c515d7fac0375704b5955cf0f64e3b6e761c125041ce7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Amiri-Regular.ttf $out/share/fonts/truetype/Amiri-Regular.ttf
     install -Dm644 Amiri-Italic.ttf $out/share/fonts/truetype/Amiri-Italic.ttf
     install -Dm644 Amiri-Bold.ttf $out/share/fonts/truetype/Amiri-Bold.ttf
     install -Dm644 Amiri-BoldItalic.ttf $out/share/fonts/truetype/Amiri-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Amiri";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
