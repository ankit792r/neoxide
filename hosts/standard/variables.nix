{
  config,
  lib,
  ...
}: {
    config.var = {
        user = "ankit";
        home = "/home/ankit";


        git = {
            name = "ankit";
            email = "ankit@example.com";
        };
        autoUpgrade = false;
        autoGarbageCollector = true;
    };

    options = {
        var = lib.mkOption {
            type = lib.types.attrs;
            default = {};
        };
    };
}