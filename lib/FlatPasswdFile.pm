package FlatPasswdFile;
use strict;
require Exporter;
our @ISA     = qw(Exporter);
my  @EXPORT  = qw(check);

sub check{
	my %args = @_;
        $/ = "\n";
        open my $pw_fh, "<$args{'FILE'}" or die "$args{'FILE'}: $!\n";
        while (<$pw_fh>){
                chomp;
                my @felder = split /:/;
                my $user   = $felder[0];
                my $pass   = $felder[1];
                if ($user eq $args{'USER'}){
                        if ($pass eq (crypt($args{'PASS'}, $pass))){
                                return 1;
                        }else{
                                return 0;
                        }
                }
        }
        return 0;
}
1;
