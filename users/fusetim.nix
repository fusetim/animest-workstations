{lib, ...}:
{
    users.users.fusetim = {
        isNormalUser = true;
        home = "/home/fusetim";
        description = "FuseTim (Respo Infra 2024 & 2025)";
        extraGroups = [ "wheel" "docker" ];
        openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGmo3+JoTRn4BihMEamsAz1o1wGMjb5htqjjLbQEINs8 fusetim@nemesis"
            "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAHlHDAqVEE9DUbn+/KfsEaXxijd/PpGbkB5FIx8MxXK+h+7NaQCv1nmD4OC81sb7Bz2Tue7kkCNF6lJbwLwU8M88QCjFXk8j8qp0ahw/KArJYEPf8L7UrGrSuLyaZlvXeIDfuePXx/JImLe3vrs1hl8wOX3PiMHWtGTBvD7JiKcpSGvqQ== fusetim@hermaphrodite"
        ];
    };
}