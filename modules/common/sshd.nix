{ pkgs, ... }:
{
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ "curt" ];
      MaxAuthTries = 3;
    };
  };
  # Add the authorized keys for my user
  users.users."curt".openssh.authorizedKeys.keys = [
	"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCrs8lEzua2pcnV1lmNyHrFMIGoE7qPAcDN4iQAbWbBNZh2Mx3WCjINlNQOt4IKdPtDqKf35ooTDZmDOqLliowAlSf24LTZZZFZR0C+ToK/M2m5dUCYxH9cMgJCHutCywAN/VHWzkXA+Ey+CmZeFqdos13iHPDTyMVJiYb5+tBP4H4jq6UrynDKfEi/D513NM9fau83CQMYxNpDrZclrDtqiESTWhTyjdPnxvsBFafc9sRN8NnV+ExisJMXVyNfhn1G9vOXnR1ryKEpB0WzXxIHl9L8BHSilqfqzJ7ZGuxF3QHtJJuG25MfdakEiysXGEkn0o4tQ/d7fAfPym7JEm5YnJyog0oO+IKYKAbmA/7f40jsPtGQRVyRrRGgMtIi9zyBx9Ia/xp3zBNyeZsPUWZBNPU0M/5+/17+MgG3iQgtln1yx4RsfGVvU/cQjRTvton7vWFe1v9RhFkyRWLTo79R7AVGtumwUFLi0lk3YwMAsEpHA4H9p5LMPCCPrNgGgUyBDWYNwg04CFJA+pZhGmuAESfICkXQdacN66mTGMj1qMNVfPjtCWrdXBd3kSbQC2no1bqeBNzyfeppX7hq/WsSRUa0C4X9GeMQ/L6fL+pAZ3OB3JjZEdjp6mbwWCFk93q4OuFxwTUtSAg/Sdtt1ZSpD6Ms+0/g3X9Y4no1be9kQQ=="
	"ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBNyBOQEJnxOGxxWYQtxY4R3g9LaWpsSD+7uwA9dczprsfiFL+zi9ypnjtxv5tjWAaJ+cXmrJGK93Vp6HY1svt5w= phone-id"
  ];

}
