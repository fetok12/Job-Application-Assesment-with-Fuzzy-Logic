%Data Setleri (First Column is competence test and the second column is personality test)
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



[model_competence, model_personality, output_model, rules_model] = model();

%fuzzification process
% Data Set1 Fuzzification
 [outputfuzzificationCompetence, outputfuzzificationPersonality] = fuzzification(model_competence,model_personality,data_1(:,1),data_1(:,2));


%inference
[outputInference] = inference(outputfuzzificationCompetence, outputfuzzificationPersonality, rules_model);

%defuzzification
[outputDefuzzification]= deffuzification(outputInference, output_model);

%result processing
Rejected = outputDefuzzification < 60; % Sonuc 60 tan kucukse Aplikasyon Ret
Accepted = outputDefuzzification > 60; %Sonuc 60 tan buyukse Aplikasyon Kabul


kabullistesi = find(Accepted==1);
retListesi = find(Rejected==1);
disp('Is Basvurusu Kabul Edilenler ' );
disp(kabullistesi');
disp('Is Basvurusu Reddedilenler ' );
disp(retListesi');


disp('Yetkinlik BULANIKLASTIRMA SONUCU' );
disp(outputfuzzificationCompetence);
disp('KISILIK BULANIKLASTIRMA SONUCU' );
disp(outputfuzzificationPersonality);
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

