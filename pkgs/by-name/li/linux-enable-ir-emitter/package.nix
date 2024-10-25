{ stdenv
, lib
, pkgs
, fetchFromGitHub
,
}:

stdenv.mkDerivation rec {
  pname = "linux-enable-ir-emitter";
  version = "6.0.6";

  nativeBuildInputs = with pkgs; [
    meson
    ninja
    cmake
    pkg-config
    opencv4
    gtk3
    yaml-cpp
    argparse
    spdlog
  ];

  src = fetchFromGitHub {
    owner = "EmixamPP";
    repo = "${pname}";
    rev = "${version}";
    sha256 = "sha256-zQRIHPcinJsCfy55sVPJT4NM2PS93zBfuRsEhNqA+rc=";
  };

  meta = with lib; {
    description = "Provides support for infrared cameras that are not directly enabled out-of-the box.";
    homepage = "https://github.com/EmixamPP/linux-enable-ir-emitter";
    license = licenses.mit;
    maintainers = with maintainers; [ shift ];
    mainProgram = "linux-enable-ir-emitter";
    platforms = pltforms.linux;
  };
}
