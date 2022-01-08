# NAO Robot on NixOS

## NixOS Prerequisites

In your `configuration.nix`, prepare for the Furhat SDK:

```nix
{
  # ...

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # ...

    # NAO
    steam-run

    # ...

  ];

}
```

## Robot Settings

To enter the RobotSettings tool, run the following:

```console
cd RobotSettings
./run.sh
```

## Choreographe

... to be done
