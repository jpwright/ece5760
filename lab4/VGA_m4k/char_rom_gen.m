
clear all

%query for rom *.txt file
[fname,fpath] = uigetfile('*.txt') ;
fid = fopen ([fpath,fname]);
count = 1 ;
while feof(fid) == 0            %are we done reading the file yet?
    txtline = fgetl(fid);
    token = strtok(txtline);
    if ~isempty(token) & token(1) == '"'
        romline{count} = token(2:9);
        count = count + 1 ;
    end
end

%===============================================
%start generating mif file (object code generation)
fid = fopen([fpath,fname(1:end-4),'.mif'], 'w') ;
fprintf(fid, '%s\n', 'DEPTH = 2048;') ;
fprintf(fid, '%s%2i%s\n', 'WIDTH = 8;');
fprintf(fid, '%s\n', '  ');
fprintf(fid, '%s\n', 'ADDRESS_RADIX = HEX;');
fprintf(fid, '%s\n', 'DATA_RADIX = BIN;');
fprintf(fid, '%s\n', '   ');
fprintf(fid, '%s\n', 'CONTENT');
fprintf(fid, '%s\n', 'BEGIN');
fprintf(fid, '%s\t:\t%s\n', '[000..7FF]', '0000;');

% generate code section in mif format
for i=1:length(romline)
    hexaddr = i - 1; %zero based addresses for mif
    % emit the table
    fprintf(fid, '%03x\t:\t%s;\n', hexaddr, romline{i}) ;
    fprintf(1,'%03x\t:\t%s;\n', hexaddr, romline{i}) ;
end %code lines

fprintf(fid,  '%s\n', 'END ;	');

fclose(fid);

% Altera MIF format example
% DEPTH = 256;	% Memory depth and width are required	%
% WIDTH = 16;		% Enter a decimal number	%
%
% ADDRESS_RADIX = HEX;	% Address and value radixes are optional	%
% DATA_RADIX = HEX;		% Enter BIN, DEC, HEX, or OCT; unless 	%
% 						% otherwise specified, radixes = HEX	%
% -- Specify values for addresses, which can be single address or range
% -- program adds one to a counter, MEM(12), every time A overflows to neg value
% CONTENT
% 	BEGIN
% [00..FF]	:	0000;	% Range--Every address from 00 to FF = 0000 (Default)	%
% 	00		:	0210;	% LOAD A with MEM(10) -- clear A%
% 	01		:	0011;	% ADD MEM(11) to A  -- increment A%
% 	02		:	0404;	% JNEG to 04  -- skip next instruction if A is negative%
% 	03		:	0301;	% JMP to 01  -- increment A if it is still positive%
% 	04		:   0212;	% LOAD A from MEM(12)  -- get output counter%
% 	05		:	0011;	% ADD MEM(11) to A  -- incrment output counter%
% 	06		:	0500;	% OUTPUT A %
% 	07		:	0112;	% STORE A to MEM(12)  -- save it%
% 	08		:	0300;	% JUMP to 00 (loop forever)  -- reset A %
% 	10		:	0000;	% initial A Value %
% 	11		:	0001;	% increment for A and output value %
% 	12		:	0000;	% output value %
% 	END ;

