function result = triangleFunc(x, a, b, c) 

 if(x < b)
     result = (x-a)/(b-a);   % a<x<=b
 else
     result = (-(x-c))/(c-b);    % b<x<c
 end

end