{ ... }:

{
  users.users.curt = {
    isNormalUser = true;
    description = "Curt";
    extraGroups = [ "wheel" ];
  };
}
