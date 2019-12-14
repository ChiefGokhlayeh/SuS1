%FR_gui.M
%
function FR_gui()
%
%close all;
FR_gui=figure;
%
set(FR_gui,'Visible','off',...
   'Position',[100 150 700 500]);
set(FR_gui,'NumberTitle','off');
set(FR_gui,'MenuBar','none');
%Farbe der GUI festlegen
set(FR_gui,'Color',[0.1 0.9 0.1]);
%Titel der GUI festlegen
set(FR_gui,'Name','endliche Fourier-Reihe');


% String für Pop-Up-Menü
str={'Null','linear','Zufall 1','Zufall 2','parabolisch','konstant pi',...
    'konstant pi/2','konstant pi/4','aus Workspace'};

%Entwerfen der Komponenten
%Knöpfe
Breite_K=120;Breite_E=200;
Erstellen_S=uicontrol('Style','pushbutton',...
   'String','Erstellen',...
   'Fontsize',10,...
   'Position',[200 120 Breite_E 25],...
   'Callback',{@Erstellen_S_Callback});
%
Position_1=500; 
Beenden=uicontrol('Style','pushbutton',...
   'String','Beenden',...
   'Fontsize',10,...
   'Position',[Position_1 120 Breite_K 25],...
   'Callback',{@Beenden_Callback});
%
Amplituden=uicontrol('Style','pushbutton',...
   'String','Amplituden',...
   'Fontsize',10,...
   'Position',[Position_1 400 Breite_K 25],...
   'Callback',{@Amplituden_Callback});

Phasen=uicontrol('Style','pushbutton',...
   'String','Phasen',...
   'Fontsize',10,...
   'Position',[Position_1 370 Breite_K 25],...
   'Callback',{@Phasen_Callback});

Sound=uicontrol('Style','pushbutton',...
   'String','Sound',...
   'Fontsize',10,...
   'Position',[Position_1 340 Breite_K 25],...
   'Callback',{@Sound_Callback});
Zeitverlauf=uicontrol('Style','pushbutton',...
   'String','Zeitverlauf',...
   'Fontsize',10,...
   'Position',[Position_1 310 Breite_K 25],...
   'Callback',{@Zeitverlauf_Callback});
Spektrum=uicontrol('Style','pushbutton',...
   'String','Spektrum',...
   'Fontsize',10,...
   'Position',[Position_1 280 Breite_K 25],...
   'Callback',{@Spektrum_Callback});
Spektrogramm=uicontrol('Style','pushbutton',...
   'String','Spektrogramm',...
   'Fontsize',10,...
   'Position',[Position_1 250 Breite_K 25],...
   'Callback',{@Spektrogramm_Callback});
Wav_speichern=uicontrol('Style','pushbutton',...
   'String','Wav_speichern',...
   'Fontsize',10,...
   'Position',[Position_1 220 Breite_K 25],...
   'Callback',{@Wav_speichern_Callback});
Signalpegel=uicontrol('Style','pushbutton',...
   'String','Signalpegel',...
   'Fontsize',10,...
   'Position',[Position_1 190 Breite_K 25],...
   'Callback',{@Signalpegel_Callback});

%
%Pop-Up-Menü
 Popup=uicontrol('Style','popupmenu',...
    'String',str,...
    'Fontsize',10,...
    'Position',[200 250 Breite_E 25],...
    'Callback',{@Popup_Callback});
%


%Eingabefeld
Edit_Name=uicontrol('Style','edit',...
   'String','Signal',...
   'Fontsize',10,...
   'Position',[200 400 Breite_E 25]);
Edit_Abtastfrequenz=uicontrol('Style','edit',...
   'String','48000',...
   'Fontsize',10,...
   'Position',[200 370 Breite_E 25]);
Edit_f0=uicontrol('Style','edit',...
   'String','500',...
   'Fontsize',10,...
   'Position',[200 340 Breite_E 25]);
Edit_Dauer=uicontrol('Style','edit',...
   'String','5',...
   'Fontsize',10,...
   'Position',[200 310 Breite_E 25]);
Edit_Amplituden=uicontrol('Style','edit',...
   'String','-(0:10)/10+1',...
   'Fontsize',10,...
   'Position',[200 280 Breite_E 25]);




%Textfelder
Breite_Text=150;
Text_S=uicontrol('Style','text',...
   'String','Fourier-Reihe erstellen',...
   'HorizontalAlignment','left',...
   'Fontsize',15,...
   'Position',[30 460 200 25]);
Text_Name=uicontrol('Style','text',...
   'String','Name',...
   'HorizontalAlignment','left',...
   'Fontsize',10,...
   'Position',[30 400 Breite_Text 20]);
Text_Abtastfrequenz=uicontrol('Style','text',...
   'String','Abtastfrequenz fT in Hz',...
   'HorizontalAlignment','left',...
   'Fontsize',10,...
   'Position',[30 370 Breite_Text 20]);
Text_f0=uicontrol('Style','text',...
   'String','Grundfrequenz f0 in Hz',...
   'HorizontalAlignment','left',...
   'Fontsize',10,...
   'Position',[30 340 Breite_Text 20]);
Text_Dauer=uicontrol('Style','text',...
   'String','Dauer in s',...
   'HorizontalAlignment','left',...
   'Fontsize',10,...
   'Position',[30 310 Breite_Text 20]);
%
Text_Amplituden=uicontrol('Style','text',...
   'String','Amplituden (Formel)',...
   'HorizontalAlignment','left',...
   'Fontsize',10,...
   'Position',[30 280 Breite_Text 20]);
%
Text_Phase=uicontrol('Style','text',...
   'String','Phase',...
   'HorizontalAlignment','left',...
   'Fontsize',10,...
   'Position',[30 250 Breite_Text 20]);


%Farben festlegen
% set([Popup, Edit1],'Backgroundcolor',[1 0.7 0.25]);
 set([Text_S, Text_Name, Text_Abtastfrequenz, Text_f0],'Backgroundcolor',[0.1 0.9 0.1]);
 set([Text_Dauer, Text_Amplituden, Text_Phase],'Backgroundcolor',[0.1 0.9 0.1]);
 set([Erstellen_S, Beenden],'Backgroundcolor',[1 0.5 0.1]);
 set([Amplituden, Phasen, Sound, Zeitverlauf, Spektrum],'Backgroundcolor',[1 0.5 0.1]);
 set([Spektrogramm, Wav_speichern, Signalpegel],'Backgroundcolor',[1 0.5 0.1]);

%pause
%GUI soll mittig erscheinen
movegui(FR_gui,'center');
%Sichtbarmachen der GUI
set(FR_gui,'Visible','on');
%

function Popup_Callback(wahl,~)
    auswahl=get(wahl,'Value');
    assignin('base','auswahl',auswahl);
end

 function Erstellen_S_Callback(~,~)


             Name=get(Edit_Name,'String');
             if isvarname(Name)==0
                 set(Edit_Name,'String','Signal');
                 errordlg('Kein gültiger String');
             elseif isvarname(Name);
                 assignin('base','Name',Name);
             end
%
             fT=str2double(get(Edit_Abtastfrequenz,'String'));
             if isnan(fT)
                 set(Edit_Abtastfrequenz,'String','8000')
                 errordlg('Die Abtastfrequenz fT muss eine Zahl sein');
             elseif isnan(fT)==0
                 assignin('base','fT',fT);
             end
%
             f0=str2double(get(Edit_f0,'String'));
             if isnan(f0)
                 set(Edit_f0,'String','500')
                 errordlg('Die Grundfrequenz f0 muss eine Zahl sein');
             elseif isnan(f0)==0
                 assignin('base','f0',f0);
             end
%
%
             Dauer=str2double(get(Edit_Dauer,'String'));
             if isnan(Dauer)
                 set(Edit_Dauer,'String','5')
                 errordlg('Die Dauer muss eine Zahl sein');
             elseif isnan(Dauer)==0
                 assignin('base','Dauer',Dauer);
             end              
%
             Formel=(get(Edit_Amplituden,'String'));
             sndach=eval(Formel);
             Anzahl=round(abs(Dauer*fT));
             x=zeros(1,length(Anzahl));
             k=0:(Anzahl-1);
             N=length(sndach);
             
             auswahl=evalin('base','auswahl');
             switch auswahl
                 case 1
                   %Phase Null
                   phi=zeros(1,N);
                 case 2
                   %lineare Phase
                   phi=(1:N)*2*pi/(N+1);
                 case 3
                   %Zufall 1
                   randn('state',0);
                   phi=randn(1,N);
                 case 4
                   %Zufall 2
                   phi=randn(1,N);
                 case 5
                   %parabolisch
                   phi=pi*((1:N).^2-1)/N;
                 case 6
                   %konstant pi
                   phi=pi*ones(1,N);
                 case 7
                   %konstant pi/2
                   phi=(pi/2)*ones(1,N);
                 case 8
                   %konstant pi/4
                   phi=(pi/4)*ones(1,N);
                 case 9
                   %aus Workspace
                   phi=evalin('base','phi');
              end
             
             assignin('base','phi',phi);
             
            for n=1:N, x=x+sndach(n)*cos(2*pi*k*n*f0/fT+phi(n)); end
                 
            assignin('base','x',x);

 end


function Amplituden_Callback(~,~)
     Formel=(get(Edit_Amplituden,'String'));
     sndach=eval(Formel);  
     figure
     stem(1:length(sndach),sndach)
    title('Amplitudenwerte','Fontsize',14);
    xlabel('n \rightarrow','Fontsize',14);
end


function Phasen_Callback(~,~)
    
     phi=evalin('base','phi');
     figure
     stem(1:length(phi),phi)
    title('Phasenwerte im Bogenmaß','Fontsize',14);
    xlabel('n \rightarrow','Fontsize',14);
end

function Sound_Callback(~,~)
    fT=evalin('base','fT');
    x=evalin('base','x');
    %soundsc(x,fT);

    %Soundausgabe
    % Die Standardausgabe mit dem Befehl 'soundsc' funktioniert nicht
    % auf den Rechnern im Labor. Deshalb ist der Befehl 'soundsc' ersetzt
    % durch die nachfolgende Befehlsfolge
    x=x/max(abs(x)*1.001);
    sound(x,fT)

end

function Zeitverlauf_Callback(~,~)
    fT=evalin('base','fT');
    x=evalin('base','x');
    figure
    plot((0:199)/fT,x(1:200));
    title('Zeitverlauf','Fontsize',14);
    xlabel('t/s \rightarrow','Fontsize',14);
end

function Spektrum_Callback(~,~)
    fT=evalin('base','fT');
    x=evalin('base','x');
    spektrum(x(1:2^13),fT);
%    spektrum(x(1:12000),fT);
end

function Spektrogramm_Callback(~,~)
    fT=evalin('base','fT');
    x=evalin('base','x');
    figure
    specgram(x,round(0.02*fT),fT);
end

function Wav_speichern_Callback(~,~)
    Name=evalin('base','Name');
    fT=evalin('base','fT');
    x=evalin('base','x');
    %Skalieren
    xs=x/(max(abs(x))*1.0001);
    wavwrite(xs,fT,Name);
end


function Signalpegel_Callback(~,~)
    fT=evalin('base','fT');
    x=evalin('base','x');
    %Skalieren
    xs=x/(max(abs(x))*1.0001);
    F=figure;set(F,'Color','w');
    set(gca,'XColor','w'),set(gca,'YColor','w')
    %Signalleistung im Zeitbereich
    Signalleistung=sum(x.^2)/length(x);
    Par1=['Signalleistung = ',num2str(Signalleistung),' (Rechnung im Zeitbereich)'];
    text(-0.1,0.9,Par1,'fontsize',15);
    %Signalleistung im Frequenzbereich
    Formel=(get(Edit_Amplituden,'String')); sndach=eval(Formel);
    Par2=['Signalleistung = ',num2str(sum(sndach.^2)/2),' (Rechnung im Frequenzbereich)'];
    text(-0.1,0.7,Par2,'fontsize',15);
    %Signalpegel
    Pegel=10*log10(2*Signalleistung);
    %if Pegel < 10^-10, Pegel=0; end
    Par3=['Signalpegel = ',num2str(Pegel),' dB'];
    text(-0.1,0.5,Par3,'fontsize',15);
    %Betragsmaximum
    Betragsmaximum=max(abs(x));
    Par4=['Betragsmaximum = ',num2str(Betragsmaximum),' (= ',num2str(10*log10(Betragsmaximum)),' dB)'];
    text(-0.1,0.3,Par4,'fontsize',15);
    %Signalpegel nach Normierung
    Bq=Betragsmaximum^2;Pegel=10*log10(2*Signalleistung/Bq);
    %if abs(Pegel) < 10^-10, Pegel=0; end
    Par5=['Signalpegel = ',num2str(Pegel),' dB  (nach Normierung)'];
    text(-0.1,0.1,Par5,'fontsize',15);

    
end






function Beenden_Callback(~,~)
    close(gcf);
    close all
end

end %Ende FR_gui
