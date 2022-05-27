{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-myanmar-ui-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmyanmarui/NotoSansMyanmarUI-Thin.ttf?raw=true";
      name = "NotoSansMyanmarUI-Thin.ttf";
      sha256 = "5344707d46667ff3fcf6cdc4b4cee17e3486c0843dd2669679ca62161a29930c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmyanmarui/NotoSansMyanmarUI-ExtraLight.ttf?raw=true";
      name = "NotoSansMyanmarUI-ExtraLight.ttf";
      sha256 = "4a04adf1888c1c794ee20708481306d26feb5d1a1ebbaf9a5c3a315043c0b675";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmyanmarui/NotoSansMyanmarUI-Light.ttf?raw=true";
      name = "NotoSansMyanmarUI-Light.ttf";
      sha256 = "2ac4403523ac2942fa39595755a56f9fa365bad3cc43d45fd7fd7b6203481139";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmyanmarui/NotoSansMyanmarUI-Regular.ttf?raw=true";
      name = "NotoSansMyanmarUI-Regular.ttf";
      sha256 = "af6ba8f406f6fe8e326b78860279bf2d9a132f80b739b5e1a8c1b209f6fa1303";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmyanmarui/NotoSansMyanmarUI-Medium.ttf?raw=true";
      name = "NotoSansMyanmarUI-Medium.ttf";
      sha256 = "29c79391ba8471135248450b8f7aab602f941dac43dc2ca900af177f01a99fc3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmyanmarui/NotoSansMyanmarUI-SemiBold.ttf?raw=true";
      name = "NotoSansMyanmarUI-SemiBold.ttf";
      sha256 = "8f297a11ab44fc9592a6b66f6c6dbad4a168e0761ed3b8a6ec0f1d55ca817a15";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmyanmarui/NotoSansMyanmarUI-Bold.ttf?raw=true";
      name = "NotoSansMyanmarUI-Bold.ttf";
      sha256 = "5c5f1efee3d4a877e3c32d0236e9187ac949de919c47bf6f0cfd2f6cc2771443";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmyanmarui/NotoSansMyanmarUI-ExtraBold.ttf?raw=true";
      name = "NotoSansMyanmarUI-ExtraBold.ttf";
      sha256 = "e3bf2ce32d45931f6d9b7fb1ef92eb77ec3df1effd7ba1396e7a27332ec1651e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmyanmarui/NotoSansMyanmarUI-Black.ttf?raw=true";
      name = "NotoSansMyanmarUI-Black.ttf";
      sha256 = "fc35b096efe860a64dde30d15d0049e21a1c9ecd8f2c7da71950544040e9ae7f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMyanmarUI-Thin.ttf $out/share/fonts/truetype/NotoSansMyanmarUI-Thin.ttf
     install -Dm644 NotoSansMyanmarUI-ExtraLight.ttf $out/share/fonts/truetype/NotoSansMyanmarUI-ExtraLight.ttf
     install -Dm644 NotoSansMyanmarUI-Light.ttf $out/share/fonts/truetype/NotoSansMyanmarUI-Light.ttf
     install -Dm644 NotoSansMyanmarUI-Regular.ttf $out/share/fonts/truetype/NotoSansMyanmarUI-Regular.ttf
     install -Dm644 NotoSansMyanmarUI-Medium.ttf $out/share/fonts/truetype/NotoSansMyanmarUI-Medium.ttf
     install -Dm644 NotoSansMyanmarUI-SemiBold.ttf $out/share/fonts/truetype/NotoSansMyanmarUI-SemiBold.ttf
     install -Dm644 NotoSansMyanmarUI-Bold.ttf $out/share/fonts/truetype/NotoSansMyanmarUI-Bold.ttf
     install -Dm644 NotoSansMyanmarUI-ExtraBold.ttf $out/share/fonts/truetype/NotoSansMyanmarUI-ExtraBold.ttf
     install -Dm644 NotoSansMyanmarUI-Black.ttf $out/share/fonts/truetype/NotoSansMyanmarUI-Black.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Myanmar UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
