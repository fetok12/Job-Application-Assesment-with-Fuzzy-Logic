function [model_input1, model_input2, model_output, model_rules] = model()
% Girisler, Girislerin Uyelik Fonksiyonlarini Kurallar Ve Girdi Duzeyleri

% Yetkinlik
yetkinlik.cokdusuk= [ 0 , 0 , 30 , 35];  %Trapezoid [ a, b , c , d]
yetkinlik.dusuk      = [ 30 , 35 , 45 ];      %trimf [a ,b ,c]
yetkinlik.orta      = [ 35 , 45 , 75];      %Trapezoid [a ,b ,c]
yetkinlik.yuksek      = [ 60 , 70 , 90];       %trimf [a ,b ,c]
yetkinlik.cokyuksek= [ 75, 80, 100, 100 ]; %Trapezoid [ a, b , c , d]

% Kisilik
kisilik.dusuk    = [ 0 , 0 , 20 , 30];  %Trapezoid [ a, b , c , d]
kisilik.orta    = [ 20 , 45 , 70];      %trimf [a ,b ,c]
kisilik.yuksek   = [ 60 , 80 , 100 , 100];%Trapezoid [a ,b ,c, d]

% Sugeno modeli ile Cikti Araliklari
kabul.evet = 80;
kabul.hayir = 0;

% Kurallar

kural = [
  0 0 0 0 1 ;  
  0 0 0 1 1 ;
  1 1 1 1 1 ;
];

model_input1 = yetkinlik;
model_input2 = kisilik;
model_output = kabul;
model_rules = kural;

% Üyelik fonksiyonu modelini 2D bir grafikte görselleştir
YetkinlikGraph = 0:0.01:100;
KisilikGraph = 0:0.01:100;

level1tes = trapmf(YetkinlikGraph,yetkinlik.cokdusuk);
level2tes = trimf(YetkinlikGraph,yetkinlik.dusuk);
level3tes = trimf(YetkinlikGraph,yetkinlik.orta);
level4tes = trimf(YetkinlikGraph,yetkinlik.yuksek);
level5tes = trapmf(YetkinlikGraph,yetkinlik.cokyuksek);

level1kep = trapmf(KisilikGraph,kisilik.dusuk);
level2kep = trimf(KisilikGraph,kisilik.orta);
level3kep = trapmf(KisilikGraph,kisilik.yuksek);


subplot(1,2,1)
plot(YetkinlikGraph,level1tes,'linewidth',1);
hold on 
plot(YetkinlikGraph,level2tes,'linewidth',1);
plot(YetkinlikGraph,level3tes,'linewidth',1);
plot(YetkinlikGraph,level4tes,'linewidth',1);
plot(YetkinlikGraph,level5tes,'linewidth',1);
title('Yetkinlik');

subplot(1,2,2)
plot(KisilikGraph,level1kep,'linewidth',1);
hold on
plot(KisilikGraph,level2kep,'linewidth',1);
plot(KisilikGraph,level3kep,'linewidth',1);
title('Kişilik');

end