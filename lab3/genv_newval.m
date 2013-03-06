fileName = 'nodes_old.v';
format long
fileID = fopen(fileName, 'wt'); 

fprintf(fileID, 'newval = ');
%fprintf(fileID, '(');
for q = 1:6
    fprintf(fileID, strcat('((((left+right+up+down - (prev<<<2))>>>2) + (prev<<<1) - '));
    for k=1:6
        fprintf(fileID, strcat('(prev2>>>', int2str(k), ')'));
        if (k<6)
            fprintf(fileID, ' + ');
        end
    end
    fprintf(fileID, strcat(')>>>', int2str(q), ')'));
    if (q<6)
        fprintf(fileID, ' + \n');
    end
end
fprintf(fileID, ';\n');