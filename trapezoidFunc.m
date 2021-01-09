function result = trapezoidFunc(x, a, b, c, d, type) 

 result = 0;
 
 if(strcmp(type,'normal'))
     if(x > c)
         result = (-(x-d))/(d-c); %  c<x<d
     elseif (x < b)
         result = (x-a)/(b-a); %   a<x<b
     else 
         result = 1;
     end
 elseif (strcmp(type,'left'))
     if(x > c)
         result = (-(x-d))/(d-c); %  c<x<d
     elseif (x >= a && x < c)
         result = 1;
     end
 elseif (strcmp(type,'right'))
     if (x < b)
         result = (x-a)/(b-a); %  a<x<b
     elseif(x >= b) 
         result = 1;
     end
     
 end
 
end