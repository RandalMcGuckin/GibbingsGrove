#!/usr/local/bin/perl -w
# 314969.6411, 235527.2317, 0.0000
# 315575.1240, 234870.3966, 0.0000
{
	# to list all the lines between the above two points
	# typical line:
	# 308324.77735138 231273.05912018 64.12000275 255 255 255 0
	
	my $line;
	my $x;
	my $y;
	my $z;
	# my $icou;
	
	# points stored as (min, max)
	my @pt=(314969.6411, 235527.2317, 0.0000);
	my @pb=(315575.1240, 234870.3966, 0.0000);
	my @x;
	my @y;
	if($pt[0]<$pb[0])
	{
		$x[0]=$pt[0];
		$x[1]=$pb[0];
	}
	else
	{
		$x[0]=$pb[0];
		$x[1]=$pt[0];
	}
	if($pt[1]<$pb[1])
	{
		$y[0]=$pt[1];
		$y[1]=$pb[1];
	}
	else
	{
		$y[0]=$pb[1];
		$y[1]=$pt[1];
	}
	# print "x:$x[0]\t$x[1]\ny:$y[0]\t$y[1]\n";
	
	# open input and output files
	my $file=q/C:\Data\Projects\xyz\Dublin-all.xyz/;
	my $filout=q/>C:\Data\Projects\xyz\MMJ.xyz/;
	
	open (XYZ,$file) || die "Unable to find $file";
	open (OUT,$filout) || die "Unable to find $filout";
	
	# $icou=0;
	while(($line=<XYZ>))
	{
		chop($line);
		my @pts=split " ",$line;
		my $siz=@pts;
		if($siz > 3)
		{
			if($pts[0]>=$x[0] and $pts[0]<=$x[1])
			{
				if($pts[1]>=$y[0] and $pts[1]<=$y[1])
				{
					print OUT "$line\n";
					# print "$icou: $line\n";
					# $icou++;
				}
			}
		}
	}
END:
	close(XYZ);
	close(OUT);
	print "\n\n";
	for(my $i=0;$i<3;$i++)
	{
		print("$pt[$i]\t$pb[$i]\n");
	}
}