{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "palanquin-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/palanquin/Palanquin-Thin.ttf?raw=true";
      name = "Palanquin-Thin.ttf";
      sha256 = "387c32989030704407c8b6e711b05268b67dd93e0f033f8eebdd300a9c4f0809";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/palanquin/Palanquin-ExtraLight.ttf?raw=true";
      name = "Palanquin-ExtraLight.ttf";
      sha256 = "1e92eeaf00081e9320bbcbda4e1c54cbaa4c8148dc6a6a25c1ad0b3f1474f198";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/palanquin/Palanquin-Light.ttf?raw=true";
      name = "Palanquin-Light.ttf";
      sha256 = "33c40ff07f925a26240a76de1ac3a57c086a388138c44966f0ea2f56522893d0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/palanquin/Palanquin-Regular.ttf?raw=true";
      name = "Palanquin-Regular.ttf";
      sha256 = "f4f9cf415279b466b1c4df6168283f95fa88440b27bb34e884aeb03a432b02f0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/palanquin/Palanquin-Medium.ttf?raw=true";
      name = "Palanquin-Medium.ttf";
      sha256 = "9afdd20558ad624c4a45ec9d4450980320c49093be397c83d33033e413dcc4c4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/palanquin/Palanquin-SemiBold.ttf?raw=true";
      name = "Palanquin-SemiBold.ttf";
      sha256 = "08cf0011bc5ab632e75ca79f2df1f37956fc3b93d1305b46117df17fb58cb414";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/palanquin/Palanquin-Bold.ttf?raw=true";
      name = "Palanquin-Bold.ttf";
      sha256 = "b9ff87d5743c179d1300ecbbdb97c53e7a1adb2f54c446c21acec50e2bc77acf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Palanquin-Thin.ttf $out/share/fonts/truetype/Palanquin-Thin.ttf
     install -Dm644 Palanquin-ExtraLight.ttf $out/share/fonts/truetype/Palanquin-ExtraLight.ttf
     install -Dm644 Palanquin-Light.ttf $out/share/fonts/truetype/Palanquin-Light.ttf
     install -Dm644 Palanquin-Regular.ttf $out/share/fonts/truetype/Palanquin-Regular.ttf
     install -Dm644 Palanquin-Medium.ttf $out/share/fonts/truetype/Palanquin-Medium.ttf
     install -Dm644 Palanquin-SemiBold.ttf $out/share/fonts/truetype/Palanquin-SemiBold.ttf
     install -Dm644 Palanquin-Bold.ttf $out/share/fonts/truetype/Palanquin-Bold.ttf
  '';

  meta = with lib; {
    description = "Palanquin";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
