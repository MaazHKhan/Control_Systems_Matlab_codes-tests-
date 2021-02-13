% Mat l ab Program <Exl 0_l . m>
% Thi s Matlab exerc i s e <Exl 0_l . m> performs s imulation of
% binary baseband polar transmi s s i on in AWGN channe l .
% The program generates polar baseband signa l s us ing 3 di f ferent
% pul s e shapes ( root - raised cos ine ( r= 0 . 5 ) , rectangular , hal f - s ine )
% and estimate the bit error rate ( BER ) at di f ferent Eb/N for display
clear ; 
clf ;
L=l000000 ; % Total data symbol s in experiment i s 1 mi l l i on
% To display the pul se shape , we oversample the signal
% by factor of f_ovsamp = 8
f_ovsamp = 8 ;
delay_rc= 3 ;
% Oversampl ing factor vs data rate
% Generat ing root -rai sed cos ine pul s eshape ( ro l l o f f factor 0 . 5 )


prcos = rcosflt ( [ 1 ] , 1 , f_ovsamp , ' sqrt ' , 0.5 , delay_rc ) ;
prcos=prcos ( l : end- f_ovsamp+ l ) ;
prcos=prcos / norm ( prcos ) ;
pcmatch=prcos ( end : - 1 : 1 ) ;
% Generat ing a rectangular pul se shape
prect=ones ( l , f_ovsamp ) ;
prect=prect / norm ( prect ) ;
prmatch=prect ( end : - 1 : 1 ) ;
% Generating a hal f - s ine pul s e shape
psine= sin ( [ O : f_ovsamp - l ] *pi / f_ovsamp ) ;
psine=psine /norm ( psine ) ;
psmatch=psine ( end : - 1 : 1 ) ;
% Generat ing random signal data for pol ar s i gnal i ng
s_data=2 * round ( rand ( L , l ) ) - l ;
% upsample to match the ' f i c t i t i ous oversampl ing rate '
% which i s f_ovsamp / T ( T= l i s the symbol duration )
s_up=upsample ( s_data , f_ovsamp ) ;
% I denti fy the deci s ion de lays due t o pul s e shaping
% and mat ched f i l ters
del ayrc=2 * delay_rc * f_ovsamp ;
del ayrt= f_ovsamp - 1 ;
del aysn= f_ovsamp - 1 ;
% Generate po l ar signal i ng of di f ferent pul s e - shaping
xrcos=conv ( s_up , prcos ) ;
xrec t=conv ( s_up , prec t ) ;
xsine=conv ( s_up , psine ) ;
t= ( l:200 ) / f_ovsamp ;
subplot(311)
figwavel =plot ( t , xrcos ( delayrc / 2 : delayrc / 2 + 199 ) ) ;
t i t l e ( ' ( a ) Root - rai s ed cos ine pul se . ' ) ;
set ( figwavel , ' Linewidth ' , 2 ) ;
subplot ( 312 )
figwave2 =plot ( t , xrect ( delayrt : delayrt+ l99 ) ) ;
t i t l e ( ' ( b ) Rec tangular pul se . ' )
set ( figwave2 , ' Linewidth ' , 2 ) ;
subplot ( 313 )
figwave3 =plot ( t , xsine ( delaysn : delaysn+ 199 ) ) ;
t i t l e ( ' ( c ) Hal f - s ine pul se . ' )
xlabel ( ' Number o f data symbol periods ' )
set ( figwave3 , ' Linewidth ' , 2 ) ;
% F ind the signal length
Lrcos = length ( xrcos ) ; Lrec t = l ength ( xrect ) ; Ls ine=l ength ( xsine ) ;
BER= [ ] ;
noi seq=randn ( Lrcos , 1 ) ;
% Generating the channel noi s e ( AWGN )
for i = l : 1 0 ,
    Eb2N ( i ) =i ; % ( Eb/N in dB )
    Eb2N_num= 10^( Eb2N ( i ) / 1 0 ) ; % Eb/ N in numeral
    Var_n=l / ( 2 * Eb2N_num ) ; % 1 / SNR i s the noise variance
    signois =sqrt ( Var_n ) ; % s t andard deviation
    awgnois = signois * noiseq ; % AWGN
    % Add noi s e to signa l s at the channel output
    yrcos=xrcos+awgno is ;
    
    
    yrect=xrect+awgno i s ( l : Lrec t ) ;
ysine=xsine+awgnoi s ( l : Lsine ) ;
l 0. 1 2 MATLAB Exercises 59 1
% Apply matched f i l ters f i r s t
z l =c onv ( yrcos , pcmatch ) ; c l ear awgnoi s , yrcos ;
z 2 =conv ( yrect , prmatch ) ; c l ear yrec t ;
z 3 =conv ( ys ine , psmatch ) ; c l ear ys ine ;
% Sampling the received s i gnal and acquire samples
z l = z l ( delayrc + l : f_ovsamp : end ) ;
z 2 = z 2 ( delayrt + l : f_ovsamp : end ) ;
z 3 = z 3 ( delaysn+ l : f_ovsamp : end ) ;
% Dec i si on based on the s i gn o f the samples
dec l = s i gn ( z l ( l : L ) ) ; dec2 = s ign ( z 2 ( 1 : L ) ) ; de c 3 = s i gn ( z 3 ( 1 : L ) ) ;
% Now compare agains t the original data to compute BER for
% the three pul ses
BER= [ BER ; sum ( abs ( s_data-dec l ) ) / ( 2 *L ) . . .
sum ( abs ( s_data-dec2 ) ) / ( 2 *L )
sum ( abs ( s_data-dec3 ) ) / ( 2 * L ) ] ;
Q ( i ) = 0 . 5 * erfc ( sqrt ( Eb2N_num ) ) ;
end