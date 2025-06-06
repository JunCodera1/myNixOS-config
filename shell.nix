{pkgs, ...}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    javaPackages.openjfx21
    libglibutil
    xorg.libXxf86vm
    glibc
    glib
    gsettings-desktop-schemas
    (pkgs.jdk21.override {enableJavaFX = true;})
  ];
  GSETTINGS_SCHEMA_DIR = "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
}
