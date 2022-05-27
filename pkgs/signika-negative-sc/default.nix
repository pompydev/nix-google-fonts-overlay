{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "signika-negative-sc-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/04f5ee5414a6b1242f2cbb1599a664dde9d464c4/ofl/signikanegativesc/SignikaNegativeSC-Light.ttf?raw=true";
      name = "SignikaNegativeSC-Light.ttf";
      sha256 = "971023e3bfefb00176ba9de8374fb9e70301353fe5ba740f4041e3544d97d689";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/04f5ee5414a6b1242f2cbb1599a664dde9d464c4/ofl/signikanegativesc/SignikaNegativeSC-Regular.ttf?raw=true";
      name = "SignikaNegativeSC-Regular.ttf";
      sha256 = "f6d21ecfe08f2ba59f819907191c8880ee1aea360cc9547ea9ccef8e907b437b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/04f5ee5414a6b1242f2cbb1599a664dde9d464c4/ofl/signikanegativesc/SignikaNegativeSC-SemiBold.ttf?raw=true";
      name = "SignikaNegativeSC-SemiBold.ttf";
      sha256 = "74a12828cd1c004940c57d66b51c285fe503dddb8e1a2e0e388508c7a0401e76";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/04f5ee5414a6b1242f2cbb1599a664dde9d464c4/ofl/signikanegativesc/SignikaNegativeSC-Bold.ttf?raw=true";
      name = "SignikaNegativeSC-Bold.ttf";
      sha256 = "40751aa92248cbb479ea85d7d706522256662c887d399bd0a87b020fa5887918";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SignikaNegativeSC-Light.ttf $out/share/fonts/truetype/SignikaNegativeSC-Light.ttf
     install -Dm644 SignikaNegativeSC-Regular.ttf $out/share/fonts/truetype/SignikaNegativeSC-Regular.ttf
     install -Dm644 SignikaNegativeSC-SemiBold.ttf $out/share/fonts/truetype/SignikaNegativeSC-SemiBold.ttf
     install -Dm644 SignikaNegativeSC-Bold.ttf $out/share/fonts/truetype/SignikaNegativeSC-Bold.ttf
  '';

  meta = with lib; {
    description = "Signika Negative SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
