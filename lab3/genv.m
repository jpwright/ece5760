quarterGridNodes1D = 10; %length of one dimension of the quarter grid
fileName = 'nodes.v';

fileID = fopen(fileName, 'w'); 

for x = 0:quarterGridNodes1D-1
    for y = 0:quarterGridNodes1D-1

        if(x == 0)
			left = strcat('value_' , int2str(x + 1) , '_' , int2str(y)); 
			right = strcat('value_' , int2str(x + 1) , '_' , int2str(y)); 
        elseif (x == quarterGridNodes1D-1)
			left = strcat('value_' , int2str(x - 1) , '_' , int2str(y)); 
			right = '0'; 
        else
			left = strcat('value_' , int2str(x - 1) , '_' , int2str(y));
			right = strcat('value_' , int2str(x + 1) , '_' , int2str(y));
        end
		
        if(y == 0)
			up = strcat('value_' , int2str(x) , '_' , int2str(y+1)); 
			down = strcat('value_' , int2str(x) , '_' , int2str(y+1));
        elseif (y == quarterGridNodes1D-1)
			up = 0;
			down = strcat('value_' , int2str(x) , '_' , int2str(y-1)); 
        else
			up = strcat('value_' , int2str(x) , '_' , int2str(y+1)); 
			down = strcat('value_' , int2str(x) , '_' , int2str(y-1)); 
        end
		
%         fprintf('module node_' + x + '_' + y+'(value);');
		fprintf(fileID, strcat('\treg signed[15:0] value_', int2str(x), '_', int2str(y), ';\n'));
        fprintf(fileID, strcat('\treg signed[15:0] prev_', int2str(x), '_' , int2str(y), ';\n'));
        fprintf(fileID, strcat('\treg signed[15:0] prev2_', int2str(x), '_' , int2str(y), ';\n'));
        
        fprintf(fileID, '\talways@(posedge clk50)\n'); %%%%%%%CHECK ON THE CLOCK SPEED
        fprintf(fileID, '\tbegin\n');
        
        fprintf(fileID, strcat('\t\tvalue_', int2str(x), '_', int2str(y), ' = ((((', left, '+', right, '+', up, '+', down, '- (prev_', int2str(x), '_', int2str(y), '<<<2))>>>2) + (prev_', int2str(x), '_', int2str(y), '<<<1) - (prev2_', int2str(x), '_', int2str(y), '>>>4))<<<4);\n'));
        
        fprintf(fileID, strcat('\t\tprev2_', int2str(x), '_' , int2str(y),' = prev_', int2str(x), '_', int2str(y), '\n'));
        fprintf(fileID, strcat('\t\tprev_', int2str(x),'_' , int2str(y), ' = value_', int2str(x), '_', int2str(y),';\n'));
        
       
        fprintf(fileID, '\tend\n');
    
    end
end

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