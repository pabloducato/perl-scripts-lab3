@logins = ("root", "bin", "daemon", "adm", "lp", "sync", "shutdown", "halt", "mail", "news", "uucp",
"operator", "games", "ftp", "http", "stats", "nobody", "stud");
@passwd = ();
$userID = 1000;
foreach $user (@logins) {
    $id = "$userID";
    push(@passwd, ($user.':'.'x:'.$id.':'.$id.':'."root/root:/bin/sh\n"));
    $userID = $userID + 1;
}
print "@passwd\n";