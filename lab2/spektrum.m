%Spektrum.M
%
%Darstellung des Amplitudenspektrums
%
function spektrum=spektrum(x,fT);
%
%x ist ein Zeitsignal
%fT ist die Abtastfrequenz
%
D=size(x);
if D(1) ~= 1 & D(2) ~= 1, return, end;
xm=x;
if D(2) == 1, xm=xm.'; end;
N=length(xm);
k=0:N-1;
%
%Fast Fourier Transform (Darstellung 0 <= f < fT)
%
f=(fT/N)*k;
 spec=fft(xm,N);spec=spec/N;
figure;
stem(f,abs(spec));
title('Frequenzspektrum','Fontsize',14),
ylabel('Betrag','Fontsize',14),
xlabel('f/Hz  \rightarrow','Fontsize',14)
%
%Fast Fourier Transform (Darstellung -fT/2 <= f <= fT/2)
%
if mod(N,2) == 1,
   % N ist ungerade 
   spec_neu=[spec(1,((N+1)/2+1):N) spec(1,1:(N+1)/2)];
   k=(-(N+1)/2+1):(N-1)/2;
else
   % N ist gerade
   sh=spec(N/2+1)/2;
   spec_neu=[sh spec(1,(N/2+2):N) spec(1,1:N/2) sh];
   k=(-N/2):N/2;
end;
f=(fT/N)*k;
figure;
stem(f,abs(spec_neu));
title('zweiseitiges Amplitudenspektrum','Fontsize',14),
ylabel('Betrag','Fontsize',14),
xlabel('f/Hz  \rightarrow','Fontsize',14)
%
%Fast Fourier Transform (Darstellung 0 <= f <= fT/2)
%
if mod(N,2) == 1,
   % N ist ungerade 
   spec_neu=[spec(1) 2*spec(1,2:(N+1)/2)];
   k=0:(N-1)/2;
else
   % N ist gerade
   spec_neu=[spec(1) 2*spec(1,2:N/2) spec(N/2+1)];
   k=0:N/2;
end;
f=(fT/N)*k;
figure;
stem(f,abs(spec_neu));
title('einseitiges Amplitudenspektrum','Fontsize',14),
ylabel('Betrag','Fontsize',14),
xlabel('f/Hz  \rightarrow','Fontsize',14)
%zoom on
%

