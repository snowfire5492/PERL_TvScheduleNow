#!/usr/bin/perl
#
####################################################################
#
#  Write a script to see whats on channel 2.1, 4.1, and 7.1 right now
#
####################################################################
# Code

while (<STDIN>){
	
	@html = split /\s+/, "$_"; 
	$whole = join ('', @html );
	if( $whole =~ /KCBSHD()/m ){
	
		$channelTwoOne = <STDIN>;
		if(  $channelTwoOne =~ /<b>2.1<()/m ){
			$junk = <STDIN>;		# using this to 
just look down a couple lines. im not very good with perl yet so i had 
to use this technique
			$junk = <STDIN>;
			$junk = <STDIN>;
			$next = <STDIN>;
			if( $next =~ /Started"()/m ){
				@TwoPointOne = $next =~ 
/nbsp;(.*)/<\/b>/m;
				$ChannelTwo = "2.1 - " . join (', ', 
@TwoPointOne ) . "\n";	
		
			}else {
				@TwoPointOne = $next =~ 
/title">(.*)<\/b>/m;	
				$ChannelTwo = "2.1 - " . join (', ' , 
@TwoPointOne ) . "\n";
			}
		}
	}
	if( $whole =~ /KNBCHD()/m ){
		$channelFourOne = <STDIN>;
		if( $channelFourOne =~ /<b>4.1<()/m){
			$junk = <STDIN>;
			$junk = <STDIN>;
			$junk = <STDIN>;
			$next = <STDIN>;

			 if( $next =~ /Started"()/m ){
                                @FourPointOne = $next =~ 
/nbsp;(.*)/<\/b>/m;
                                $ChannelFour = "4.1 - " . join (', ', 
@FourPointOne ) . "\n";

                        }else {
                                @FourPointOne = $next =~ 
/title">(.*)<\/b>/m;
                                $ChannelFour = "4.1 - " . join (', ' , 
@FourPointOne ) . "\n";
                        }
		}
	}
	if( $whole =~ /KABCHD()/m ){
		$channelSevenOne = <STDIN>;
		if( $channelSevenOne =~ /<b>7.1<()/m){
			$junk = <STDIN>;
			$junk = <STDIN>;
			$junk = <STDIN>;
			$next = <STDIN>;
			
			 if( $next =~ /Started"()/m ){
                                @SevenPointOne = $next =~ 
/nbsp;(.*)/<\/b>/m;
                                $ChannelSeven = "7.1 - " . join (', ', 
@SevenPointOne ) . "\n";

                        }else {
                                @SevenPointOne = $next =~ 
/title">(.*)<\/b>/m;
                                $ChannelSeven = "7.1 - " . join (', ' , 
@SevenPointOne ) . "\n";
                        }
		}
	}
}	

print "$ChannelTwo";
print "$ChannelFour";
print "$ChannelSeven";



