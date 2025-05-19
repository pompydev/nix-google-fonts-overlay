{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-old-south-arabian-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansoldsoutharabian/NotoSansOldSouthArabian-Regular.ttf?raw=true";
      name = "NotoSansOldSouthArabian-Regular.ttf";
      sha256 = "54df22db482aef96a0f4aa7eb9e0a7bc92f4af281dec93ca7d16d03a42ef20a5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOldSouthArabian-Regular.ttf $out/share/fonts/truetype/NotoSansOldSouthArabian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Old South Arabian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
