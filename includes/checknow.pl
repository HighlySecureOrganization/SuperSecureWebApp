use Net::SMTP;
use File::stat;
use Net::OpenSSH;
use Time::localtime;

my $ssh;
my @hosts=("Th3CTA001-PRI","Th3CTA001-HA","Th3CTA001-DR","Th3CTA002-PRI","Th3CTA002-HA","Th3CTA002-DR","Th3CTA003-PRI","Th3CTA003-HA","Th3CTA003-DR","Th3CTA004-PRI","Th3CTA004-HA","Th3CTA004-DR","Th3CTA005-PRI","Th3CTA005-HA1","Th3CTA005-HA2","Th3CTA005-HA3","Th3CTA005-DR1","Th3CTA005-DR2","Th3CTA006-PRI","Th3CTA006-HA1","Th3CTA005-DR1");
my $sender = "dl-storagereportsnalerts\@0daygod.xyz";
my $subject;
my @recipientList = ("storageadmins@0daygod.xyz");

my $smtp;
my $realbody;
my $status ="";
my $health = "OK";
my $user = "root";
my $password = "K\@Ng@r00s$";
$smtp = Net::SMTP->new("170.116.145.3"); 