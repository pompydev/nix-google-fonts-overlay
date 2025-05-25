{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-old-south-arabian-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansoldsoutharabian/NotoSansOldSouthArabian-Regular.ttf?raw=true";
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
