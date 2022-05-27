{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "almarai-${version}";
  version = "2022-05-23-195233";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5f7be97e7ecb8a05dc3e9b24abe84dcd282d1d64/ofl/almarai/Almarai-Light.ttf?raw=true";
      name = "Almarai-Light.ttf";
      sha256 = "a57bca270340202a28899f7488ee76ed9b93115b89d7a81db92d68e29993da5a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5f7be97e7ecb8a05dc3e9b24abe84dcd282d1d64/ofl/almarai/Almarai-Regular.ttf?raw=true";
      name = "Almarai-Regular.ttf";
      sha256 = "5b5cad33c8e5922083728d271cdcda91f96ba291f1307eccc4f4ef732dc19622";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5f7be97e7ecb8a05dc3e9b24abe84dcd282d1d64/ofl/almarai/Almarai-Bold.ttf?raw=true";
      name = "Almarai-Bold.ttf";
      sha256 = "06401391b5b39fbcf2bc0c6a6e03faf992435e7b011183a1861737e913af8613";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5f7be97e7ecb8a05dc3e9b24abe84dcd282d1d64/ofl/almarai/Almarai-ExtraBold.ttf?raw=true";
      name = "Almarai-ExtraBold.ttf";
      sha256 = "9f8f72f1cb06db787a5b32e314a109267e53c505c9f9ab0dad5aa8ff8b219a07";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Almarai-Light.ttf $out/share/fonts/truetype/Almarai-Light.ttf
     install -Dm644 Almarai-Regular.ttf $out/share/fonts/truetype/Almarai-Regular.ttf
     install -Dm644 Almarai-Bold.ttf $out/share/fonts/truetype/Almarai-Bold.ttf
     install -Dm644 Almarai-ExtraBold.ttf $out/share/fonts/truetype/Almarai-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Almarai";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
