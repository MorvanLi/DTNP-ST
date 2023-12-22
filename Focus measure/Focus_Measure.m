function Mp = Focus_Measure(I)
    xj = padarray(I,[1 1],'symmetric');
    EOL = conv2(xj,[1  4  1;4 -20 4;1  4  1]./6,'valid');
    Mp = EOL.*EOL;
 
end
