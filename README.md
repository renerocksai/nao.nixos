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

This will download the Robot Settings V.1.2.1 and run it via `steam-run`.

## Choregraphe

To start Choregraphe , run the following:

```console
cd Choregraphe
./run.sh
```

This will download Choregraphe V2.8.7.4 and run it via `steam-run`.
