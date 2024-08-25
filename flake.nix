{
  description = "Description for the project";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        # To import a flake module
        # 1. Add foo to inputs
        # 2. Add foo as a parameter to the outputs function
        # 3. Add here: foo.flakeModule

      ];
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        # Per-system attributes can be defined here. The self' and inputs'
        # module parameters provide easy access to attributes of the same
        # system.

        # Equivalent to  inputs'.nixpkgs.legacyPackages.hello;
	devShells.default = pkgs.mkShell {
	  packages = with pkgs; [
	    boost
	    cmake
            catch2
            glm

            #Xorg
       	    xorg.libXxf86vm
            xorg.libXi
            xorg.libX11
            xorg.libXrandr

            #Vulkan
            glfw
            shaderc
            vulkan-volk
            vulkan-headers
            vulkan-loader
            vulkan-validation-layers
            vulkan-tools
            shaderc
            renderdoc
            tracy
            vulkan-tools-lunarg
          ];
        };

      };
      flake = {
        # The usual flake attributes can be defined here, including system-
        # agnostic ones like nixosModule and system-enumerating ones, although
        # those are more easily expressed in perSystem.

      };
    };
}
