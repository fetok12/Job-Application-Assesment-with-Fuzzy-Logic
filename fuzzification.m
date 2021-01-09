function [result1 , result2] = fuzzification(model1, model2, deger1, deger2)
     % fuzzifikasyon fonksiyonu
     % model1 yetkinlik testidir
     % model2 kişiliktir testidir
     % deger1, yetkinlik testinin [0..100] arasindaki degeridir.
     % deger2, kişilik testinin  [0..100] arasindaki degeridir.
    

    columnCount = length(deger1);
    labelModel1 = zeros(columnCount,5); %Yetkinlik Sutunu Oldugu Icin 5 Degere ayiriyoruz
    labelModel2 = zeros(columnCount,3); %Kisilik Sutunu Oldugu Icin 3 Degere ayiriyoruz
    
    % Yetkinlik Sutunundaki Degerlerin Bulaniklastirilmasi
    for i=1:columnCount
        if (min(model1.cokdusuk) <= deger1(i) && deger1(i) <= max(model1.cokdusuk))
            labelModel1(i,1) = trapezoidFunc(deger1(i),model1.cokdusuk(1,1),model1.cokdusuk(1,2),model1.cokdusuk(1,3),model1.cokdusuk(1,4),'left');
        end
        if (min(model1.dusuk) <= deger1(i) && deger1(i) <= max(model1.dusuk))
            labelModel1(i,2) = triangleFunc(deger1(i),model1.dusuk(1,1),model1.dusuk(1,2),model1.dusuk(1,3));
        end
        if (min(model1.orta) <= deger1(i) && deger1(i) <= max(model1.orta))
            labelModel1(i,3) = triangleFunc(deger1(i),model1.orta(1,1),model1.orta(1,2),model1.orta(1,3));
        end
        if (min(model1.yuksek) <= deger1(i) && deger1(i) <= max(model1.yuksek))
            labelModel1(i,4) = triangleFunc(deger1(i),model1.yuksek(1,1),model1.yuksek(1,2),model1.yuksek(1,3));
        end
        if (min(model1.cokyuksek) <= deger1(i) && deger1(i) <= max(model1.cokyuksek))
            labelModel1(i,5) = trapezoidFunc(deger1(i),model1.cokyuksek(1,1),model1.cokyuksek(1,2),model1.cokyuksek(1,3),model1.cokyuksek(1,4),'right');
        end
    end
    
    % Kisilik Sutunundaki Degerlerin Bulaniklastirilmasi
    for i=1:columnCount
        if (min(model2.dusuk)<= deger2(i) && deger2(i) <= max(model2.dusuk))
            labelModel2(i,1) = trapezoidFunc(deger2(i),model2.dusuk(1,1),model2.dusuk(1,2),model2.dusuk(1,3),model2.dusuk(1,4),'left');
        end
        if (min(model2.orta)<= deger2(i) && deger2(i) <= max(model2.orta))
            labelModel2(i,2) = triangleFunc(deger2(i),model2.orta(1,1),model2.orta(1,2),model2.orta(1,3));
        end
        if (min(model2.yuksek)<= deger2(i) && deger2(i) <= max(model2.yuksek))
            labelModel2(i,3) = trapezoidFunc(deger2(i),model2.yuksek(1,1),model2.yuksek(1,2),model2.yuksek(1,3),model2.yuksek(1,4),'right');
        end
    end
    
    result1 = labelModel1;
    result2 = labelModel2;
    
end






% function [result1 , result2] = fuzzification(model1, model2, deger1, deger2)   
% 
%     columnCount = length(deger1);
%     labelModel1 = zeros(columnCount,5); 
%     labelModel2 = zeros(columnCount,3); 
%     

%     for i=1:columnCount
%         if (min(model1.cokdusuk) <= deger1(i) && deger1(i) <= max(model1.cokdusuk))
%             labelModel1(i,1) = trapmf(deger1(i),[model1.cokdusuk(1,1),model1.cokdusuk(1,2),model1.cokdusuk(1,3),model1.cokdusuk(1,4)]);
%         end
%         if (min(model1.dusuk) <= deger1(i) && deger1(i) <= max(model1.dusuk))
%             labelModel1(i,2) = trimf(deger1(i),[model1.dusuk(1,1),model1.dusuk(1,2),model1.dusuk(1,3)]);
%         end
%         if (min(model1.orta) <= deger1(i) && deger1(i) <= max(model1.orta))
%             labelModel1(i,3) = trimf(deger1(i),[model1.orta(1,1),model1.orta(1,2),model1.orta(1,3)]);
%         end
%         if (min(model1.yuksek) <= deger1(i) && deger1(i) <= max(model1.yuksek))
%             labelModel1(i,4) = trimf(deger1(i),[model1.yuksek(1,1),model1.yuksek(1,2),model1.yuksek(1,3)]);
%         end
%         if (min(model1.cokyuksek) <= deger1(i) && deger1(i) <= max(model1.cokyuksek))
%             labelModel1(i,5) = trapmf(deger1(i),[model1.cokyuksek(1,1),model1.cokyuksek(1,2),model1.cokyuksek(1,3),model1.cokyuksek(1,4)]);
%         end
%     end
%     

%     for i=1:columnCount
%         if (min(model2.dusuk)<= deger2(i) && deger2(i) <= max(model2.dusuk))
%             labelModel2(i,1) = trapmf(deger2(i),[model2.dusuk(1,1),model2.dusuk(1,2),model2.dusuk(1,3),model2.dusuk(1,4)]);
%         end
%         if (min(model2.orta)<= deger2(i) && deger2(i) <= max(model2.orta))
%             labelModel2(i,2) = trimf(deger2(i),[model2.orta(1,1),model2.orta(1,2),model2.orta(1,3)]);
%         end
%         if (min(model2.yuksek)<= deger2(i) && deger2(i) <= max(model2.yuksek))
%             labelModel2(i,3) = trapmf(deger2(i),[model2.yuksek(1,1),model2.yuksek(1,2),model2.yuksek(1,3),model2.yuksek(1,4)]);
%         end
%     end
%     
%     result1 = labelModel1;
%     result2 = labelModel2;
%     
% end