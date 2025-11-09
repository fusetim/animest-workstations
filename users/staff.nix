{lib, ...}:
{
    users.users.staff = {
        isNormalUser = true;
        home = "/home/staff";
        description = "Staff - Anim'Est 2025";
        extraGroups = [];
        openssh.authorizedKeys.keys = [];
    };
}