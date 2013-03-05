quarterGridNodes1D = 10; %length of one dimension of the quarter grid
fileName = 'nodes.v';
format long
fileID = fopen(fileName, 'wt'); 



fprintf(fileID, 'module nodes (restart, clk50, audio_out);\n');

fprintf(fileID, '\toutput wire signed [15:0] audio_out;\n');
fprintf(fileID, '\tinput wire clk50, restart;\n\n');


% for x = 0:quarterGridNodes1D-1
%     for y = 0:quarterGridNodes1D-1
% 
%         if(x == 0)
% 			left = strcat('value_' , int2str(x + 1) , '_' , int2str(y)); 
% 			right = strcat('value_' , int2str(x + 1) , '_' , int2str(y)); 
%         elseif (x == quarterGridNodes1D-1)
% 			left = strcat('value_' , int2str(x - 1) , '_' , int2str(y)); 
% 			right = '0'; 
%         else
% 			left = strcat('value_' , int2str(x - 1) , '_' , int2str(y));
% 			right = strcat('value_' , int2str(x + 1) , '_' , int2str(y));
%         end
% 		
%         if(y == 0)
% 			up = strcat('value_' , int2str(x) , '_' , int2str(y+1)); 
% 			down = strcat('value_' , int2str(x) , '_' , int2str(y+1));
%         elseif (y == quarterGridNodes1D-1)
% 			up = '0';
% 			down = strcat('value_' , int2str(x) , '_' , int2str(y-1)); 
%         else
% 			up = strcat('value_' , int2str(x) , '_' , int2str(y+1)); 
% 			down = strcat('value_' , int2str(x) , '_' , int2str(y-1)); 
%         end
% 		
% %         fprintf('module node_' + x + '_' + y+'(value);');
% 		fprintf(fileID, strcat('\treg signed[15:0] value_', int2str(x), '_', int2str(y), ';\n'));
%         fprintf(fileID, strcat('\treg signed[15:0] prev_', int2str(x), '_' , int2str(y), ';\n'));
%         fprintf(fileID, strcat('\treg signed[15:0] prev2_', int2str(x), '_' , int2str(y), ';\n'));
%         
%         fprintf(fileID, '\talways@(posedge clk50)\n'); %%%%%%%CHECK ON THE CLOCK SPEED
%         fprintf(fileID, '\tbegin\n');
%         
%         fprintf(fileID, strcat('\t\tvalue_', int2str(x), '_', int2str(y), ' = ((((', left, '+', right, '+', up, '+', down, '- (prev_', int2str(x), '_', int2str(y), '<<<2))>>>2) + (prev_', int2str(x), '_', int2str(y), '<<<1) - (prev2_', int2str(x), '_', int2str(y), '>>>4))<<<4);\n'));
%         
%         fprintf(fileID, strcat('\t\tprev2_', int2str(x), '_' , int2str(y),' = prev_', int2str(x), '_', int2str(y), ';\n'));
%         fprintf(fileID, strcat('\t\tprev_', int2str(x),'_' , int2str(y), ' = value_', int2str(x), '_', int2str(y),';\n'));
%         
%        
%         fprintf(fileID, '\tend\n\n');
%     
%     end
% end

fprintf(fileID, '\n\n');

v = normpdf([0 0; 0 1; 0 2; 0 3; 1 0; 1 1; 1 2; 1 3; 2 0; 2 1;2 2; 2 3; 3 0; 3 1; 3 2; 3 3 ],[0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0], [1 1; 1 1; 1 1; 1 1; 1 1; 1 1; 1 1; 1 1; 1 1; 1 1; 1 1; 1 1; 1 1; 1 1; 1 1; 1 1]);
for x = 0:quarterGridNodes1D-1
    for y = 0:quarterGridNodes1D-1
        if(x == 0)
			left = strcat('value_' , int2str(x + 1) , '_' , int2str(y)); 
			right = strcat('value_' , int2str(x + 1) , '_' , int2str(y)); 
        elseif (x == quarterGridNodes1D-1)
			left = strcat('value_' , int2str(x - 1) , '_' , int2str(y)); 
			right = '16''b0'; 
        else
			left = strcat('value_' , int2str(x - 1) , '_' , int2str(y));
			right = strcat('value_' , int2str(x + 1) , '_' , int2str(y));
        end
		
        if(y == 0)
			up = strcat('value_' , int2str(x) , '_' , int2str(y+1)); 
			down = strcat('value_' , int2str(x) , '_' , int2str(y+1));
        elseif (y == quarterGridNodes1D-1)
			up = '16''b0';
			down = strcat('value_' , int2str(x) , '_' , int2str(y-1)); 
        else
			up = strcat('value_' , int2str(x) , '_' , int2str(y+1)); 
			down = strcat('value_' , int2str(x) , '_' , int2str(y-1)); 
        end
        
        %fprintf(fileID, strcat('module node_', int2str(x), '_', int2str(y), '(value);\n'));
		fprintf(fileID, strcat('\treg signed[15:0] value_', int2str(x), '_', int2str(y), ';\n'));
        fprintf(fileID, strcat('\treg signed[15:0] prev_', int2str(x), '_' , int2str(y), ';\n'));
        fprintf(fileID, strcat('\treg signed[15:0] prev2_', int2str(x), '_' , int2str(y), ';\n'));

        %fprintf(fileID, '\talways@(negedge restart)\n');
        fprintf(fileID, '\talways@(posedge clk50)\n'); %%%%%%%CHECK ON THE CLOCK SPEED
        fprintf(fileID, '\tbegin\n');
        fprintf(fileID, '\t\tcase(restart)\n');
        fprintf(fileID, '\t\t\t1''b1 :\n');
        fprintf(fileID, '\t\t\tbegin\n');
        
        %On reset, we need to set everything back to zero except for an
        %initial gaussian distribution about the center node
        if(x<4) && (y<4)
            val = normpdf([x,y],0,1);
            num = val(1)*val(2);
            if num <.0001
                num = 0;
            end
            num = num*(2^15);
            numBin = dec2bin(round(num));
            fprintf(fileID, strcat('\t\t\t\tvalue_', int2str(x), '_', int2str(y), ' = 16''b0 ', numBin ,';\n'));
        else
            fprintf(fileID, strcat('\t\t\t\tvalue_', int2str(x), '_', int2str(y), ' = 0;\n'));
        end
        fprintf(fileID, strcat('\t\t\t\tprev2_', int2str(x), '_' , int2str(y), ' = 0;\n'));
        fprintf(fileID, strcat('\t\t\t\tprev_', int2str(x), '_' , int2str(y), ' = 0;\n'));
        
        
        fprintf(fileID, '\t\t\tend\n');
        fprintf(fileID, '\t\t\t1''b0:\n');
        fprintf(fileID, '\t\t\tbegin\n');
        
        % Normal Behavior Here
        
        
        
        fprintf(fileID, strcat('\t\t\t\tvalue_', int2str(x), '_', int2str(y), ' = '));
        fprintf(fileID, '(');
        for q = 1:4
            fprintf(fileID, strcat('(((', left, '+', right, '+', up, '+', down, '- (prev_', int2str(x), '_', int2str(y), '<<<2))>>>2) + (prev_', int2str(x), '_', int2str(y), '<<<1) - ('));
            for k=1:4
                fprintf(fileID, strcat('(prev2_', int2str(x), '_', int2str(y), '>>>', int2str(k), ')'));
                if (k<4)
                    fprintf(fileID, ' + ');
                end
            end
            fprintf(fileID, strcat(')>>>', int2str(q), ')'));
            if (q<4)
                fprintf(fileID, ' + \n');
            end
        end
        fprintf(fileID, ');\n');
        
        fprintf(fileID, strcat('\t\t\t\tprev2_', int2str(x), '_' , int2str(y),' = prev_', int2str(x), '_', int2str(y), ';\n'));
        fprintf(fileID, strcat('\t\t\t\tprev_', int2str(x),'_' , int2str(y), ' = value_', int2str(x), '_', int2str(y),';\n'));
        
        fprintf(fileID, '\t\t\tend\n');
        fprintf(fileID, '\t\tendcase\n');
        fprintf(fileID, '\tend\n\n');
        
    end
end
fprintf(fileID, '\tassign audio_out = value_0_0[15:0];\n');
fprintf(fileID,'endmodule\n');
fclose(fileID);

% module node(left, right, up, down, set, value);
% 
% 	output wire signed[15:0] value;
% 
% 	input wire signed[15:0] left;
% 	input wire signed[15:0] right;
% 	input wire signed[15:0] up;
% 	input wire signed[15:0] down;
% 	input wire signed[15:0] prev;
% 	input wire signed[15:0] prev2;
% 	
% 	reg[15:0] prev_reg;
% 	reg[15:0] prev2_reg;
% 	
% 
% 	
% 	always@(set)
% 	
% 	end
% 	
% 	prev = prev_reg;
% 	prev2 = prev2_reg;
% 	
% 	//Math Here
% 	assign value <= ((((left + right + up + down - (prev<<<2))>>>2) + (prev<<<1) - (prev2>>>4))<<<4);
% 	
% 	prev2_reg = prev;
% 	prev_reg = value;
% 	
% endmodule