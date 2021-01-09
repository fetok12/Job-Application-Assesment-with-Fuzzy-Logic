%Data Setleri (Ilk Sutun Yetkinlik Ikinci Sutun Kisilik Testidir)
data_1 = [
    61      37.5;
    71      58.3;
    64      35.8;
    60      51.7;
    73.5	75;
    82.5	15;
    61      37.5;
    52.5	54.2;
    57.5	79.2;
    72.5	56.7;
    73.5	75;
    50.5	70.8;
    62.5	58.3;
    62.5	60;
    68      20.8;
    38      82.5;
    81      61.7;
    72      67.5;
];


%model fonksiyonu ile Tum Girisleri, Girislerin Uyelik Fonksiyonlarini ve
%kurallari belirle
[model_yetkinlik, model_kisilik, output_model, rules_model] = model();

%fuzzification sureci
% Data Set1 Fuzzification
 [outputfuzzificationYetkinlik, outputfuzzificationKislik] = fuzzification(model_yetkinlik,model_kisilik,data_1(:,1),data_1(:,2));


%inference
[outputInference] = inference(outputfuzzificationYetkinlik, outputfuzzificationKislik, rules_model);

%defuzzification
[outputDefuzzification]= deffuzification(outputInference, output_model);

%result processing
Ret = outputDefuzzification < 60; % Sonuc 60 tan kucukse Aplikasyon Ret
Kabul = outputDefuzzification > 60; %Sonuc 60 tan buyukse Aplikasyon Kabul


kabullistesi = find(Kabul==1);
retListesi = find(Ret==1);
disp('Is Basvurusu Kabul Edilenler ' );
disp(kabullistesi');
disp('Is Basvurusu Reddedilenler ' );
disp(retListesi');


disp('Yetkinlik BULANIKLASTIRMA SONUCU' );
disp(outputfuzzificationYetkinlik);
disp('KISILIK BULANIKLASTIRMA SONUCU' );
disp(outputfuzzificationKislik);
disp('CIKARIM SONUCU')
disp(outputInference);
display('DURULASTIRMA SONUCU');
display(outputDefuzzification);
% İş Adayları
% 1-)     61      37.5;
% 2-)     71      58.3;
% 3-)     64      35.8;
% 4-)     60      51.7;
% 5-)     73.5	  75;
% 6-)     82.5	  15;
% 7-)     61      37.5;
% 8-)     52.5	  54.2;
% 9-)     57.5	  79.2;
% 10-)    72.5	  56.7;
% 11-)    73.5	  75;
% 12-)    50.5	  70.8;
% 13-)    62.5	  58.3;
% 14-)    62.5	  60;
% 15-)    68      20.8;
% 16-)    38      82.5;
% 17-)    81      61.7;
% 18-)    72      67.5;

