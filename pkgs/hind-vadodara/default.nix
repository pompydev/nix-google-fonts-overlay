{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hind-vadodara-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hindvadodara/HindVadodara-Light.ttf?raw=true";
      name = "HindVadodara-Light.ttf";
      sha256 = "4f2854bb53222eb53574711eaa675b55b513fdf68ee938dbe6b80389a1632e36";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hindvadodara/HindVadodara-Regular.ttf?raw=true";
      name = "HindVadodara-Regular.ttf";
      sha256 = "064d35104e20e5508f2ed40d0634e30fb5f990aa011d884e0b4541c0fb9d881d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hindvadodara/HindVadodara-Medium.ttf?raw=true";
      name = "HindVadodara-Medium.ttf";
      sha256 = "56da99a97ead900a1c4e260724637fcd8b20e8d7acfeb7045a246c8217f34bc1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hindvadodara/HindVadodara-SemiBold.ttf?raw=true";
      name = "HindVadodara-SemiBold.ttf";
      sha256 = "f7c4250f6721f57ecc465ae4f0271518dd6e2fab01d673ece7acef8fd4a71fff";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hindvadodara/HindVadodara-Bold.ttf?raw=true";
      name = "HindVadodara-Bold.ttf";
      sha256 = "756fbdd4d4cbed464b148eda63b7008e4f2e06d8aa140d2b594402ee70aeba8c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HindVadodara-Light.ttf $out/share/fonts/truetype/HindVadodara-Light.ttf
     install -Dm644 HindVadodara-Regular.ttf $out/share/fonts/truetype/HindVadodara-Regular.ttf
     install -Dm644 HindVadodara-Medium.ttf $out/share/fonts/truetype/HindVadodara-Medium.ttf
     install -Dm644 HindVadodara-SemiBold.ttf $out/share/fonts/truetype/HindVadodara-SemiBold.ttf
     install -Dm644 HindVadodara-Bold.ttf $out/share/fonts/truetype/HindVadodara-Bold.ttf
  '';

  meta = with lib; {
    description = "Hind Vadodara";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
