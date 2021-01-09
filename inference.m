function [result] = inference(resultFuzzification1, resultFuzzification2, rules)
    % Sugeno inference işlemi fonksiyonu
    % 1. bulaniklastirma sonucu ile 2. bulaniklastirma sonucunun cikarim
    % islemi
  

    transposeResultFuzzification1 = resultFuzzification1';
    transposeResultFuzzification2 = resultFuzzification2';
    
    indexNonZeroResultFuzzification1 = [];
    indexNonZeroResulFuzzification2 = [];
    
    % This looping is to get the index of each non-zero value and
    % position
    for j=1:length(resultFuzzification1) 
        %Fuzzification1
        idxeachCol = find(transposeResultFuzzification1(:,j));  %find non zero index of each column
        [~,~,value] = find(transposeResultFuzzification1(:,j)); %get the value by returning the third column (value) of the find () function
        indexNonZeroResultFuzzification1 = [indexNonZeroResultFuzzification1 ; {idxeachCol value}  ];
        
        %Fuzzification2
        idxeachCol = find(transposeResultFuzzification2(:,j));  %find non zero index of each column
        [~,~,value] = find(transposeResultFuzzification2(:,j)); %get the value by returning the third column (value) of the find () function
        indexNonZeroResulFuzzification2 = [indexNonZeroResulFuzzification2 ; {idxeachCol value} ];
    end
   
   
    listDecisionValues = zeros(30,2);
    for i=1:length(resultFuzzification1)
 
        extractValueFF1 = [indexNonZeroResultFuzzification1{i,2}];
        extractValueFF2 = [indexNonZeroResulFuzzification2{i,2}];

        extractPositionFF1 = [indexNonZeroResultFuzzification1{i,1}];
        extractPositionFF2 = [indexNonZeroResulFuzzification2{i,1}];

        [Value1Count,  ~]= size(extractValueFF1);
        [Value2Count,  ~]= size(extractValueFF2);

        tempInference = [];
        listPosition = [];
        ruleDecitionValue = [];
        % Check out all the linguistic possibilities
        
        if(Value1Count == 1 && Value2Count == 2)
            % list inference
            tempInference = [tempInference; extractValueFF1(1),extractValueFF2(1)];
            tempInference = [tempInference; extractValueFF1(1),extractValueFF2(2)];

            % list of rule positions
            listPosition = [listPosition; extractPositionFF1(1),extractPositionFF2(1)];
            listPosition = [listPosition; extractPositionFF1(1), extractPositionFF2(2)];

            % mark the position in the rule
            ruleDecitionValue = [ruleDecitionValue; rules(listPosition(1,2),listPosition(1,1))];
            ruleDecitionValue = [ruleDecitionValue; rules(listPosition(2,2),listPosition(2,1))];

        elseif (Value1Count == 2 && Value2Count == 1)
             % list inference
            tempInference = [tempInference; extractValueFF1(1),extractValueFF2(1)];
            tempInference = [tempInference; extractValueFF1(2),extractValueFF2(1)];

            % list of rule positions
            listPosition = [listPosition; extractPositionFF1(1),extractPositionFF2(1)];
            listPosition = [listPosition; extractPositionFF1(2), extractPositionFF2(1)];

            % mark the position in the rule
            ruleDecitionValue = [ruleDecitionValue; rules(listPosition(1,2),listPosition(1,1))];
            ruleDecitionValue = [ruleDecitionValue; rules(listPosition(2,2),listPosition(2,1))];

        elseif (Value1Count == 1 && Value2Count == 1)
             % list inference
            tempInference = [tempInference; extractValueFF1(1),extractValueFF2(1)];

            % list of rule positions
            listPosition = [listPosition; extractPositionFF1(1),extractPositionFF2(1)];

            % mark the position in the rule
            ruleDecitionValue = [ruleDecitionValue; rules(listPosition(1,2),listPosition(1,1))];       
        elseif (Value1Count == 2 && Value2Count == 2)
              % list inference
            tempInference = [tempInference; extractValueFF1(1),extractValueFF2(1)];
            tempInference = [tempInference; extractValueFF1(1),extractValueFF2(2)];
            tempInference = [tempInference; extractValueFF1(2),extractValueFF2(1)];
            tempInference = [tempInference; extractValueFF1(2),extractValueFF2(2)];

            % list of rule positions
            listPosition = [listPosition; extractPositionFF1(1),extractPositionFF2(1)];
            listPosition = [listPosition; extractPositionFF1(1), extractPositionFF2(2)];
            listPosition = [listPosition; extractPositionFF1(2),extractPositionFF2(1)];
            listPosition = [listPosition; extractPositionFF1(2), extractPositionFF2(2)];

            % mark the position in the rule
            ruleDecitionValue = [ruleDecitionValue; rules(listPosition(1,2),listPosition(1,1))]; 
            ruleDecitionValue = [ruleDecitionValue; rules(listPosition(2,2),listPosition(2,1))];
            ruleDecitionValue = [ruleDecitionValue; rules(listPosition(3,2),listPosition(3,1))];
            ruleDecitionValue = [ruleDecitionValue; rules(listPosition(4,2),listPosition(4,1))];
        end
        combinedResults = [];
        combinedResults = [tempInference,ruleDecitionValue];

        [rows ~] = size(combinedResults);
        no = zeros(4,1);
        yes = zeros(4,1);
        % do grouping and find the smallest value
        for j = 1:rows
            if (combinedResults(j,3) == 0)
                no(j,:) =  min(combinedResults(j,1:2));
            elseif (combinedResults(j,3) ==1)
                yes(j,:) =  min(combinedResults(j,1:2));
            end
        end

        %find the maximum of each label and return
        DecisionValueNo = max(no);
        DecisionValueYes = max(yes);
        listDecisionValues(i,:) = [DecisionValueYes, DecisionValueNo];
    end
    result = listDecisionValues;
end