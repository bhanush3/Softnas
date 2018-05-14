<# Custom Script for Windows #>

$vaname = $args[0]
$volname = $args[1]
net use M: \\$vaname\$volname /Persistent:Yes