function [result] = deffuzification (decisionList, model_output)
    
   [count ~] = size(decisionList);
   yDeffuz = zeros(count,1);
   
   pole = [model_output.evet , model_output.hayir];
   for i=1:count
     yDeffuz(i,1) = (pole * decisionList(i,:)') / sum(decisionList(i,:)); 
   end

   result = yDeffuz;
end