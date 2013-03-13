quarterGridNodes1D = 8; 		%length of one dimension of the quarter grid
fileName = 'nodes.v';			%The Filename to save as
format long						%We've got some long numbers.
fileID = fopen(fileName, 'wt'); %Opens the verilog file for writing



fprintf(fileID, 'module nodes (restart, clk, audio_out, sw);\n');

fprintf(fileID, '\toutput wire signed [15:0] audio_out;\n');
fprintf(fileID, '\tinput clk, restart;\n');
fprintf(fileID, '\tinput [17:0] sw;\n');

fprintf(fileID, '\n\n');

%Norm PDF is used to generate simple gaussian distribution for the initial drum hit.
v = normpdf([0 0; 0 1; 0 2; 0 3; 1 0; 1 1; 1 2; 1 3; 2 0; 2 1;2 2; 2 3; 3 0; 3 1; 3 2; 3 3 ],[0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0; 0 0], [1 1; 1 1; 1 1; 1 1; 1 1; 1 1; 1 1; 1 1; 1 1; 1 1; 1 1; 1 1; 1 1; 1 1; 1 1; 1 1]);

%We generate node connectivity info for all the nodes, and apply appropriate edge conditions
for x = 0:quarterGridNodes1D-1
    for y = 0:quarterGridNodes1D-1
        
        fprintf(fileID, strcat('\twire signed[17:0] vwire_', int2str(x), '_', int2str(y), ';\n'));
        fprintf(fileID, strcat('\treg signed[17:0] vreg_', int2str(x), '_', int2str(y), ';\n'));
        
		%Deal with Edge Cases and center cases for X.  Note that 1 Quarter Symmetrry is being Used
        if(x == 0)
			left = strcat('vreg_' , int2str(x+1) , '_' , int2str(y)); 
			right = strcat('vreg_' , int2str(x+1) , '_' , int2str(y)); 
        elseif (x == quarterGridNodes1D-1) 
			left = strcat('vreg_' , int2str(x-1) , '_' , int2str(y)); 
			right = '18''b0'; 
        else
			left = strcat('vreg_' , int2str(x-1) , '_' , int2str(y));
			right = strcat('vreg_' , int2str(x+1) , '_' , int2str(y));
        end
		
		%Deal with Edge Cases and center cases for Y.  Note that 1 Quarter Symmetrry is being Used
        if(y == 0)
			up = strcat('vreg_' , int2str(x) , '_' , int2str(y+1)); 
			down = strcat('vreg_' , int2str(x) , '_' , int2str(y+1));
        elseif (y == quarterGridNodes1D-1)
			up = '18''b0';
			down = strcat('vreg_' , int2str(x) , '_' , int2str(y-1)); 
        else
			up = strcat('vreg_' , int2str(x) , '_' , int2str(y+1)); 
			down = strcat('vreg_' , int2str(x) , '_' , int2str(y-1)); 
        end
        
        value = strcat('vwire_', int2str(x) , '_' , int2str(y));
        
		%Prevent Ringing by setting values to zero when they get really small
        resetnum = '';
        if(x<4) && (y<4)
            val = normpdf([x,y],0,1);
            num = val(1)*val(2)*4;
            if num <.0001
                num = 0;
            end
            num = min(num, 1)*(2^16);
            resetnum = dec2bin(round(num), 16);
        end
        resetval = ['18''b00', resetnum];
        
		%Generate the Node Module
        fprintf(fileID, ['\tnode n', int2str(x), '_', int2str(y), '(.left(', left, '), .right(', right, '), .up(', up, '), .down(', down, '), .clk(clk), .reset(restart), .resetval(', resetval, '), .value(', value, '), .sw(sw));\n']);
    end
end

%Handle the Update
fprintf(fileID, '\talways @ (negedge clk)\n');
fprintf(fileID, '\tbegin\n');

for x = 0:quarterGridNodes1D-1
    for y = 0:quarterGridNodes1D-1
        fprintf(fileID, ['\t\tvreg_', int2str(x), '_', int2str(y), ' <= vwire_', int2str(x), '_', int2str(y), ';\n']);
    end
end

fprintf(fileID, '\tend\n');

%Set the center node output to the audio output
fprintf(fileID, '\n\tassign audio_out = vwire_0_0[17:2];\n');

fprintf(fileID, 'endmodule\n');