//removed from project, not using at least yet
//from another (unreleased) tweak I made
//Copyright 2017 Brian Nooning aka i0s_tweak3r

#import “myRands.h”
@implementation UIColor (myRands)
+(UIColor *) blueRand {
int b= 255- (arc4random_uniform(80));
int g = 25+arc4random_uniform(160);
int r = arc4random_uniform(50);
return [UIColor colorWithRed: (r/255.0) green: (g/255.0) blue: (b/255.0) alpha:1.0 ];
}

+(UIColor *) redRand {
int b = 180 - (arc4random_uniform(150));
int g = 90 - arc4random_uniform(75);
int r = 255- arc4random_uniform(55);
return [UIColor colorWithRed: (r/255.0) green: (g/255.0) blue: (b/255.0) alpha:1.0 ];
}

+(UIColor *) greenRand {
int b = 180 - arc4random_uniform(175);
int g = 255 - (arc4random_uniform(65));
int r = arc4random_uniform(105);
return [UIColor colorWithRed: (r/255.0) green: (g/255.0) blue: (b/255.0) alpha:1.0 ];
}
+(UIColor *) myRand1 {

int total= (r1+b1+g1)/2;
int i=0;
while(i<10) {
if(total < 255)
{
r1 = arc4random_uniform(255);
 g1 = arc4random_uniform(255);
b1 = arc4random_uniform(255);
total= (r1+b1+g1)/2;
}
i++;
}
UIColor *random1 =  [UIColor colorWithRed:(r1/255.0) 
green:(g1/255.0) blue:(b1/255.0) alpha: 1 ];

return random1;
}
+(UIColor *) myRand2 {
*****/
/* Color category to make semi-bright, vibrant random colors 

static int r2 = arc4random_uniform(255);
static int g2 = arc4random_uniform(255);
static int b2 = arc4random_uniform(255);

int total2= (r2+g2+b2)/2;
int whiInt2=0;
while(whiInt2<10){
if(total2<255)
   loop to ensure sum of any 2 random colors equals 255, the max for any one color 
{
r2 = arc4random_uniform(255);
 g2 = arc4random_uniform(255);
b2 = arc4random_uniform(255);
total2= (r2+b2+g2)/2;
}
whiInt2++;
}
return [UIColor colorWithRed:(r2/255.0) green:(g2/255.0)  blue: (b2/255.0) alpha:1.0];
}

+(UIColor *)oRand {

  UIColor category to make random oranges and yellows with a hint of green, and not be too dark if BG color is dark */
/******
int r= 255 - arc4random_uniform(68);
int g= 255 - arc4random_uniform(68);
int b= arc4random_uniform(25);
return [UIColor colorWithRed:(r/255.0) green:(g/255.0)  blue: (b/255.0) alpha:1.0];
}
@end

*****/