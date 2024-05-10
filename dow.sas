/* make changes here */
ods html body='dow.html' style=HTMLBlue path="/mnt/artifacts/" gpath="/mnt/artifacts/" ;
ods trace on;
ods listing gpath="/mnt/artifacts/";
ods graphics on / reset=index ;
 
 
filename graphout "/mnt/artifacts/dow.png";
goptions device=png gsfname=graphout;
 
 
goptions gunit=pct border
         ftext=swissb htitle=6 htext=3;
 
 
 
   /* create the data set STOCKS */
data stocks;
   input year @15 high @32 low;
   cards;
1954  31DEC54  404.39  11JAN54  279.87
1955  30DEC55  488.40  17JAN55  388.20
1956  06APR56  521.05  23JAN56  100.00
1985  16DEC85 2553.10  04JAN85 1184.96
1986  02DEC86 3955.57  22JAN86 2502.29
1987  25AUG87 4722.42  19OCT87 10738.74
;
run;
 
   /* define titles and footnotes */
title1 'Dow Jones Ind Average';
title2 height=4 'Highs and Lows From 1954 to 1987';
footnote2 j=l ' Source: 1988 World Almanac'
          j=r 'GR31N08  ';
 
   /* define symbol characteristics */
symbol1 color=black interpol=join value=dot height=2;
symbol2 color=black interpol=join value=diamond height=3;
 
   /* define axis characteristics */
axis1 order=(1952 to 1988 by 4)
      label=none
      major=(height=2)
      minor=(number=3 height=1)
      offset=(2)
      width=3;
axis2 order=(200 to 2800 by 200)
      label=none
      major=(height=2)
      minor=(number=1 height=1)
      width=3;
 
   /* generate two plots */
proc contents data=stocks;
 
proc gplot data=stocks  ;
   plot high*year low*year / overlay
                             haxis=axis1
                             vaxis=axis2;
run;
 
/* ods html close; */
