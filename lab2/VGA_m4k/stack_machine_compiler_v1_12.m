
%===============================================
% Bruce Land -- Cornell University -- Oct 2010
%modified Sept 2011
%===============================================

% 1.1 version can accept numbers in the code up to +/-131071
% 1_11 version can accept numbers in the constant block up to  +/-131071
%   and generates compact code for numbers with <12 bits.
% 1_12 version has 8 temp locations addr 4 to 11 
%===============================================
clear all
clc

%query for *.cmp file
[fname,fpath] = uigetfile('*.cmp') ;
%fpath='C:\Users\bruce\Documents\576\TINYCPU\';
%fname='test1.cmp';
%fname = 'serial_gethex_puthex.cmp';
fid = fopen ([fpath,fname]);

% intermediate file
fid_temp = fopen ([fpath,'temp.asm'], 'w');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Pass 1:
% find macros and store them
%   macro_name, arg_count, line_count, text cell array
macro_def_count = 0;
%macro_instance_count = 0;
in_macro = 0 ;  % tells scanner we are in body of macro
macro = [];

while feof(fid) == 0            %are we done reading the file yet?
    txtline = fgetl(fid);        %get one line
    
    % trim off semicolons and comments
    % If  line starts with ';' get next line
    semicolPos = strfind(txtline, ';');
    if (~isempty(semicolPos))
        if (semicolPos(1)>1)
            txtline = txtline(1:semicolPos(1)-1) ;
        else
            continue % whole line is a comment -- get next line
        end
    end
    
    % get first token of the line
    % and trim blank lines
    [token,rtxt] = strtok(txtline) ;
    if (isempty(token))
        continue % line was blank
    end
    
    % check for macro first line
    if (strcmp(token, 'inline'))
        macro_def_count = macro_def_count + 1;
        
        % look for a name
        [token,rtxt] = strtok(rtxt) ;
        if (isempty(token))
            error('Inline function must be named')
        else
            macro(macro_def_count).name = token ;
        end
        
        in_macro = 1; % flag to mark macro storage
        line_count = 0; % number of current lines in macro definition
        continue % don't write out any macro lines
    end % macro first line detect
    
    % store body of macro (if any)
    if in_macro==1
        if ~strcmp(token, 'endinline')
            line_count = line_count + 1;
            macro(macro_def_count).line{line_count} = txtline ;
        else % macro is done
            in_macro = 0 ;
            macro(macro_def_count).line_count = line_count ;
        end
        continue % don't write out any macro lines
    end
    
    % write out file with NO macro definitions and
    % with macro instances replaced
    %scan input token for  macro instances
	% insert comment line
	% insert macro lines
	% insert comment line 
    while ~isempty(token)
	    if ~isempty(macro)
			match = 0;
			for i=1:length(macro)
				if strcmp(macro(i).name, token) % find a match
					match = 1;
					fprintf(fid_temp, '\n; inline %s\n', macro(i).name);
					for j=1:macro(i).line_count
						fprintf(fid_temp, '%s\n', macro(i).line{j});
					end
					fprintf(fid_temp, '; end inline %s\n', macro(i).name);
				end
			end % token match scan
			if match == 0
				fprintf(fid_temp, ' %s', token);
			end
		else
			fprintf(fid_temp, ' %s', token);
	    end % ~isempty(macro)
		[token,rtxt] = strtok(rtxt) ;  % get next token in line
    end % while ~isempty(token)
    fprintf(fid_temp, '\n')  ;
end %  while feof(fid) == 0

fclose(fid_temp);
fclose(fid);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% intermediate file
fid = fopen ([fpath,'temp.asm']);

% Pass 2:
%get intermediate file and convert to mif
% init state state==1 implies define; ==2 implies data; ==3 implies code
state = 0;
% init data count
nData = 0;
% init code count
nCodeLine = 0;
% init symbol table index
nTableIndex = 0;
% init structured if/then/else/endif nesting
if_level = 0 ;
% init structured while/do/endwhile
while_level = 0 ;
% sequential unique label for all structures
label_number = 0 ;

% Can be set to 16 or 18 depending on the width of memory implemented
N_BITS = 18 ;
N_WORDS = 4096 ;
%current location for storing variables:
addrData = N_WORDS-16 ; %leave 16 words for PC stack at top-memory
stk_ptr_addr = N_WORDS-15 ;
stk_ptr_value = N_WORDS-1; % stack grows DOWN
do_init = 1;

% init assembler opcode string/value pairs
% third field:
% 0=no arg; 1=12-bit-pos-int; 2=12-bit-int; 3=3-bit-int
opcode{1,1} = 'pushi';  opcode{1,2} ='1000'; opcode{1,3} =2;
opcode{2,1} = 'push';   opcode{2,2} ='2000'; opcode{2,3} =1;
opcode{3,1} = 'pop';    opcode{3,2} ='3000'; opcode{3,3} =1;
opcode{4,1} = 'jmp';    opcode{4,2} ='4000'; opcode{4,3} =1;
opcode{5,1} = 'jz';     opcode{5,2} ='5000'; opcode{5,3} =1;
opcode{6,1} = 'jnz';    opcode{6,2} ='6000'; opcode{6,3} =1;
opcode{7,1} = 'ld';     opcode{7,2} ='7000'; opcode{7,3} =0;
opcode{8,1} = 'st';     opcode{8,2} ='8000'; opcode{8,3} =0;
opcode{9,1} = 'pushpc'; opcode{9,2} ='9000'; opcode{9,3} =0;
opcode{10,1} = 'poppc'; opcode{10,2}='9001'; opcode{10,3} =0;
opcode{11,1} = 'in';    opcode{11,2}='d000'; opcode{11,3} =3;
opcode{12,1} = 'out';   opcode{12,2}='e000'; opcode{12,3} =3;
opcode{13,1} = 'add';   opcode{13,2}='f000'; opcode{13,3} =0;
opcode{14,1} = 'sub';   opcode{14,2}='f001'; opcode{14,3} =0;
opcode{15,1} = 'mul';   opcode{15,2}='f002'; opcode{15,3} =0;
opcode{16,1} = 'shl';   opcode{16,2}='f003'; opcode{16,3} =0;
opcode{17,1} = 'shr';   opcode{17,2}='f004'; opcode{17,3} =0;
opcode{18,1} = 'band';  opcode{18,2}='f005'; opcode{18,3} =0;
opcode{19,1} = 'bor';   opcode{19,2}='f006'; opcode{19,3} =0;
opcode{20,1} = 'bxor';  opcode{20,2}='f007'; opcode{20,3} =0;
opcode{21,1} = 'and';   opcode{21,2}='f008'; opcode{21,3} =0;
opcode{22,1} = 'or';    opcode{22,2}='f009'; opcode{22,3} =0;
opcode{23,1} = 'eq';    opcode{23,2}='f00a'; opcode{23,3} =0;
opcode{24,1} = 'ne';    opcode{24,2}='f00b'; opcode{24,3} =0;
opcode{25,1} = 'ge';    opcode{25,2}='f00c'; opcode{25,3} =0;
opcode{26,1} = 'le';    opcode{26,2}='f00d'; opcode{26,3} =0;
opcode{27,1} = 'gt';    opcode{27,2}='f00e'; opcode{27,3} =0;
opcode{28,1} = 'lt';    opcode{28,2}='f00f'; opcode{28,3} =0;
opcode{29,1} = 'neg';   opcode{29,2}='f010'; opcode{29,3} =0;
opcode{30,1} = 'bnot';  opcode{30,2}='f011'; opcode{30,3} =0;
opcode{31,1} = 'not';   opcode{31,2}='f012'; opcode{31,3} =0;
opcode{32,1} = 'nop';   opcode{32,2}='0000'; opcode{32,3} =0;
opcode{33,1} = 'dup';   opcode{33,2}='f013'; opcode{33,3} =0;
opcode{34,1} = 'drop';  opcode{34,2}='f017'; opcode{34,3} =0;
opcode{35,1} = 'over';   opcode{35,2}='f01f'; opcode{35,3} =0;
opcode{36,1} = 'dnext';  opcode{36,2}='f01b'; opcode{36,3} =0;

nOpcode = length(opcode) ;
%===============================================
% store all symbol/value pairs in one table
% called symbolTable
%
% Tokenize the input file:
% skip blank lines, ignore comments
% build tables of definitions, data, code
while feof(fid) == 0            %are we done reading the file yet?
    txtline = fgetl(fid);        %get one line
    
    % trim off semicolons and comments
    % If  line starts with ';' get next line
    semicolPos = strfind(txtline, ';');
    if (~isempty(semicolPos))
        if (semicolPos(1)>1)
            txtline = txtline(1:semicolPos(1)-1) ;
        else
            continue % whole line is a comment -- get next line
        end
    end
    
    % get first token of the line,  look for state changes
    % and trim blank lines
    [token,rtxt] = strtok(txtline) ;
    if (strcmp(token, 'constant'))
        state = 1;
        continue % get the next line
    elseif (strcmp(token, 'variable'))
        state = 2;
        continue % get the next line
    elseif (strcmp(token, 'program'))
        state = 3;
        continue % get the next line
    elseif (strcmp(token, 'function'))
        state = 4;
        continue % get the next line
    elseif (isempty(token))
        continue % line was blank
    end
    
    %'define' state machine: build a table of definitions:
    % name,value,const=1
    if (state==1)
        nTableIndex = nTableIndex + 1;
        symbolTable{nTableIndex,1} = token ;
        symbolTable{nTableIndex,3} = 1 ;
        token = strtok(rtxt);
        if ~isempty(token)
            symbolTable{nTableIndex,2} = str2num(token) ; % value
        else
            error('Definitions require a value')
        end
    end
    
    %'variable' state machine: build a table of data name,location,var=2
    if (state==2)
        nTableIndex = nTableIndex + 1;
        symbolTable{nTableIndex,1} = token ; % mem location name
        symbolTable{nTableIndex,3} = 2 ; % a var
        [token,rtxt] = strtok(rtxt) ;  % get count
        if ~isempty(token)
            addrData = addrData - str2num(token) ; % update location
            symbolTable{nTableIndex,2} = addrData ; % mem location
        else
            %error('Data declaration requires a count')
			addrData = addrData - 1 ; % update location
			symbolTable{nTableIndex,2} = addrData ; % mem location
        end
    end
    
    % function entry points
    if (state==4)
        nTableIndex = nTableIndex + 1;
        symbolTable{nTableIndex,1} = token ; % mem location name
        symbolTable{nTableIndex,3} = 3 ; % a label
    end
    
    %'code' state machine:  build a table of lines of code
    % builds a table of labels, opcodes, and addresses
    if (state==3)
        %initializaiton
        if do_init
            % init return stack pointer
            nCodeLine = nCodeLine + 1;
            CodeLine{nCodeLine,1} = 'pushi'; %
            CodeLine{nCodeLine,2} = num2str(stk_ptr_addr); %
            nCodeLine = nCodeLine + 1;
            CodeLine{nCodeLine,1} = 'pushi'; %
            CodeLine{nCodeLine,2} = num2str(stk_ptr_value); %
            nCodeLine = nCodeLine + 1;
            CodeLine{nCodeLine,1} = 'st'; %
            CodeLine{nCodeLine,2} = []; %
			nCodeLine = nCodeLine + 1;
            CodeLine{nCodeLine,1} = 'jmp'; %
            CodeLine{nCodeLine,2} = 'main'; %
            % loc 4 to 11 for asm temp
            nCodeLine = nCodeLine + 1;
            CodeLine{nCodeLine,1} = 'nop'; %
            CodeLine{nCodeLine,2} = []; %
            nCodeLine = nCodeLine + 1;
            CodeLine{nCodeLine,1} = 'nop'; %
            CodeLine{nCodeLine,2} = []; %
            nCodeLine = nCodeLine + 1;
            CodeLine{nCodeLine,1} = 'nop'; %
            CodeLine{nCodeLine,2} = []; %
            nCodeLine = nCodeLine + 1;
            CodeLine{nCodeLine,1} = 'nop'; %
            CodeLine{nCodeLine,2} = []; %
            
             nCodeLine = nCodeLine + 1;
            CodeLine{nCodeLine,1} = 'nop'; %
            CodeLine{nCodeLine,2} = []; %
            nCodeLine = nCodeLine + 1;
            CodeLine{nCodeLine,1} = 'nop'; %
            CodeLine{nCodeLine,2} = []; %
            nCodeLine = nCodeLine + 1;
            CodeLine{nCodeLine,1} = 'nop'; %
            CodeLine{nCodeLine,2} = []; %
            nCodeLine = nCodeLine + 1;
            CodeLine{nCodeLine,1} = 'nop'; %
            CodeLine{nCodeLine,2} = []; %
            
			nTableIndex = nTableIndex + 1;
			symbolTable{nTableIndex,1} = 'main' ; % main location name
			symbolTable{nTableIndex,3} = 3 ; % a label
            % don't do it again
            do_init = 0;
        end
        
        while ~isempty(token)
            token_recognized = 0;
            
            % quoted string
            if strcmp(token(1), '"')
                str = token(2:end);
                for i=length(str):-1:1
                   nCodeLine = nCodeLine + 1;
                   CodeLine{nCodeLine,1} = 'pushi' ; 
                   CodeLine{nCodeLine,2} = num2str(str(i)+0) ;
                end
                nCodeLine = nCodeLine + 1;
                CodeLine{nCodeLine,1} = 'pushi' ; 
                CodeLine{nCodeLine,2} = num2str(length(str)) ;
                token_recognized = 1;
                [token,rtxt] = strtok(rtxt) ;  % get next token
                continue
            end
            
            % === handle IF structure ===
            % if `if: inc if_level
            % if `then: insert jz--- instruction (modify CodeLine)
            % if `else: insert jmp--- instruction
            %           insert label:nop and fix jz--- instruction
            % if `endif: insert label:nop
            %           if no 'else' fix jz--- instruction
            %           if 'else' fix jmp--- instruction
            %           dec if_level
            if strcmp(token, 'if')
                if_level = if_level + 1;
                if_check(if_level) = 0; % checks for 'then'
                token_recognized = 1;
                [token,rtxt] = strtok(rtxt) ;  % get next token
                continue
            end
            
            if strcmp(token, 'then')
                nCodeLine = nCodeLine + 1;
                % if_table_Index = if_table_Index + 1;
                if_table{if_level} = nCodeLine ;
                token_recognized = 1;
                CodeLine{nCodeLine,1} = 'jz'; % to be filled in at 'else' or 'endif'
                if_check(if_level) = 1;
				[token,rtxt] = strtok(rtxt) ;  % get next token
                continue
            end
            
            if strcmp(token, 'else')
                nCodeLine = nCodeLine + 1;
                CodeLine{nCodeLine,1} = 'jmp'; % to be filled in at 'endif'
                nCodeLine = nCodeLine + 1;
                CodeLine{nCodeLine,1} = 'nop'; % label target for jz in 'then'
                % so hack symbol table
                nTableIndex = nTableIndex + 1;
                label_number = label_number + 1 ;
                symbolTable{nTableIndex,1} = ['L',num2str(label_number,3)] ; % code location name
                symbolTable{nTableIndex,2} = nCodeLine ; % code location
                CodeLine{nCodeLine,3} =  ['L',num2str(label_number,3),':'] ; %store for comment generation
                % and modify 'then' instruction 'jz'
                CodeLine{if_table{if_level},2} = ['L',num2str(label_number,3)];
                % change if_table to point to 'jmp' in 'else'
                if_table{if_level} = nCodeLine - 1 ;
                token_recognized = 1;
				[token,rtxt] = strtok(rtxt) ;  % get next token
                continue
            end
            
            if strcmp(token, 'endif')
                if if_check(if_level)
                    if_check(if_level) = 0;
                else
                    error('Missing THEN')
                end
                nCodeLine = nCodeLine + 1;
                CodeLine{nCodeLine,1} = 'nop'; % label target for jz in 'then'
                % so hack symbol table
                nTableIndex = nTableIndex + 1;
                label_number = label_number + 1 ;
                symbolTable{nTableIndex,1} = ['L',num2str(label_number,3)] ; % code location name
                symbolTable{nTableIndex,2} = nCodeLine ; % code location
                CodeLine{nCodeLine,3} =  ['L',num2str(label_number,3),':'] ; %store for comment generation
                % and modify 'then' instruction 'jz'
                CodeLine{if_table{if_level},2} = ['L',num2str(label_number,3)];
                if_level = if_level - 1 ;
                token_recognized = 1;
				[token,rtxt] = strtok(rtxt) ;  % get next token
                continue
            end
            
            % === handle WHILE structure ===
            % if `while: increment level
            %               insert label:nop, record label1
            % if `do: insert jz---, record address to insert label2
            % if `endwhile: fill in jz with label2
            %               insert jmp label1;
            %               insert label2: nop
            %               decrement level
            
            if strcmp(token, 'while')
                while_level = while_level + 1 ;
                 while_check(while_level) = 0;
                nCodeLine = nCodeLine + 1;
                CodeLine{nCodeLine,1} = 'nop'; % label target for jmp in 'endwhile'
                % so hack symbol table
                nTableIndex = nTableIndex + 1;
                label_number = label_number + 1 ;
                symbolTable{nTableIndex,1} = ['L',num2str(label_number,3)] ; % code location name
                while_table_label{while_level} = ['L',num2str(label_number,3)] ; % code location name
                symbolTable{nTableIndex,2} = nCodeLine ; % code location
                CodeLine{nCodeLine,3} =  ['L',num2str(label_number,3),':'] ; %store for comment ge
				token_recognized = 1;
                [token,rtxt] = strtok(rtxt) ;  % get next token
                continue
            end
            
            if strcmp(token, 'do')
                while_check(while_level) = 1;
                nCodeLine = nCodeLine + 1;
                while_table_jz{while_level} = nCodeLine ;
                %while_table_jz{while_level}
                CodeLine{nCodeLine,1} = 'jz'; % to be filled in at 'endwhile'
                token_recognized = 1;
				[token,rtxt] = strtok(rtxt) ;  % get next token
                continue
            end
            
            if strcmp(token, 'endwhile')
                if while_check(while_level)
                    while_check(while_level) = 0;
                else
                    error('Missing DO')
                end
                nCodeLine = nCodeLine + 1;
                CodeLine{nCodeLine,1} = 'jmp'; % back to 'while'
                CodeLine{nCodeLine,2} = while_table_label{while_level} ; %label generated in 'while'
                nCodeLine = nCodeLine + 1;
                CodeLine{nCodeLine,1} = 'nop'; % target for 'jz' in 'do'
                % so hack symbol table
                nTableIndex = nTableIndex + 1;
                label_number = label_number + 1 ;
                symbolTable{nTableIndex,1} = ['L',num2str(label_number,3)] ; % code location name
                symbolTable{nTableIndex,2} = nCodeLine ; % code location
                CodeLine{nCodeLine,3} =  ['L',num2str(label_number,3),':'] ; %store for comment gen
                % fix jz from 'do'
               % while_table_jz{while_level}
                %['L',num2str(label_number,3)]
                CodeLine{while_table_jz{while_level},2} = ['L',num2str(label_number,3)] ; %current label
                while_level = while_level - 1 ;
                token_recognized = 1;
				[token,rtxt] = strtok(rtxt) ;  % get next token
                continue
            end
            
            if strcmp(token, 'return')
                %update stack pointer
                nCodeLine = nCodeLine + 1;
                CodeLine{nCodeLine,1} = 'push';
                CodeLine{nCodeLine,2} = num2str(stk_ptr_addr) ;
                nCodeLine = nCodeLine + 1;
                CodeLine{nCodeLine,1} = 'ld'; % tos has PC
                CodeLine{nCodeLine,2} = [] ;
                nCodeLine = nCodeLine + 1;
                CodeLine{nCodeLine,1} = 'push';
                CodeLine{nCodeLine,2} = num2str(stk_ptr_addr) ;
                nCodeLine = nCodeLine + 1;
                CodeLine{nCodeLine,1} = 'pushi';
                CodeLine{nCodeLine,2} = '1' ;
                nCodeLine = nCodeLine + 1;
                CodeLine{nCodeLine,1} = 'add';
                CodeLine{nCodeLine,2} = [] ;
                nCodeLine = nCodeLine + 1;
                CodeLine{nCodeLine,1} = 'pop';
                CodeLine{nCodeLine,2} = num2str(stk_ptr_addr) ;
                nCodeLine = nCodeLine + 1;
                CodeLine{nCodeLine,1} = 'pushi';
                CodeLine{nCodeLine,2} = '2' ;
                nCodeLine = nCodeLine + 1;
                CodeLine{nCodeLine,1} = 'add';
                CodeLine{nCodeLine,2} = [] ;
                nCodeLine = nCodeLine + 1;
                CodeLine{nCodeLine,1} = 'poppc';
                CodeLine{nCodeLine,2} = [] ;
                token_recognized = 1;
				[token,rtxt] = strtok(rtxt) ;  % get next token
                continue
            end
            % === handle `calc directive ===
            % Const name loads value
            % Var name loads value
            % Var name[index] loads array value
            % statement may end in '= var_name' to store a value
            % Any opcode beginnning with 'f' can appear
            % get tokens until end of line
            %   is it in the symbol table? const=1, var=2, label=3
            %   yes: is it a constant?
            %       yes: gen code to pushi constant
            %       no: is it a var?
            %           yes: gen code for scalar var
            %           no: error('no labels allowed in calc')
            %   no: does it contain a '['
            %           yes:  parse var and index; gen code for array var
            %   no: is it a number
            %           yes: gen code for pushi
            %   no: is it an f-type opcode?
            %       yes: generate code
            %       no: is it an '='?
            %           yes: get next token and write store code
            %               possible error ('missing store location')
            %            no: error('undefined symbol in calc')
            
            
            %search symbol table
            sym_value = nan ;
			sym_type = nan ;
            for j=1:nTableIndex
                if (strcmp(token, symbolTable{j,1}))
                    sym_value = symbolTable{j,1} ;
                    sym_value_actual = symbolTable{j,2} ;
                    sym_type = symbolTable{j,3} ;
                end
            end
            %search opcode table
            instOpcode = nan ;
            for  j=1:nOpcode
                if  strcmp(opcode{j,1}, token)
                    instOpcode = opcode{j, 2} ; %hexidecimal string
                    opcode_index = j ;
                end
            end
            
            if ~isnan(sym_value) % is it in the table
                if sym_type == 1 % is it a const?
                    if sym_value_actual>-2047 & sym_value_actual<2047
                        nCodeLine = nCodeLine + 1;
                        CodeLine{nCodeLine,1} = 'pushi';
                        CodeLine{nCodeLine,2} = sym_value ;
                    else
                        if sym_value_actual<0
                            ttoken = -sym_value_actual ;
                        else
                            ttoken = sym_value_actual;
                        end
                        nCodeLine = nCodeLine + 1;
                        CodeLine{nCodeLine,1} = 'pushi';
                        CodeLine{nCodeLine,2} = num2str(fix((ttoken)/128)) ; %to be divided by 2^7
                        nCodeLine = nCodeLine + 1;
                        CodeLine{nCodeLine,1} = 'pushi';
                        CodeLine{nCodeLine,2} = '7' ;
                        nCodeLine = nCodeLine + 1;
                        CodeLine{nCodeLine,1} = 'shl';
                        CodeLine{nCodeLine,2} = [] ;
                        nCodeLine = nCodeLine + 1;
                        CodeLine{nCodeLine,1} = 'pushi';
                        CodeLine{nCodeLine,2} = num2str(mod(fix((ttoken)),128));
                        nCodeLine = nCodeLine + 1;
                        CodeLine{nCodeLine,1} = 'bor';
                        CodeLine{nCodeLine,2} = [] ;
                        if sym_value_actual<0
                            nCodeLine = nCodeLine + 1;
                            CodeLine{nCodeLine,1} = 'neg';
                            CodeLine{nCodeLine,2} = [];
                        end         
                    end
                    token_recognized = 1;
                    
                elseif sym_type == 2 % is it a var
                    % push var
                    nCodeLine = nCodeLine + 1;
                    CodeLine{nCodeLine,1} = 'push';
                    CodeLine{nCodeLine,2} = sym_value ;
                    token_recognized = 1;
                    
                elseif sym_type == 3 % a label implies a subroutine link!
				
                    %update stack pointer and store PC
                    nCodeLine = nCodeLine + 1;
                    CodeLine{nCodeLine,1} = 'push';
                    CodeLine{nCodeLine,2} = num2str(stk_ptr_addr) ;
                    nCodeLine = nCodeLine + 1;
                    CodeLine{nCodeLine,1} = 'pushi';
                    CodeLine{nCodeLine,2} = '1' ;
                    nCodeLine = nCodeLine + 1;
                    CodeLine{nCodeLine,1} = 'sub';
                    CodeLine{nCodeLine,2} = [] ;
                    nCodeLine = nCodeLine + 1;
                    CodeLine{nCodeLine,1} = 'dup';
                    CodeLine{nCodeLine,2} = [] ;
                    nCodeLine = nCodeLine + 1;
                    CodeLine{nCodeLine,1} = 'pop';
                    CodeLine{nCodeLine,2} = num2str(stk_ptr_addr) ;
                    nCodeLine = nCodeLine + 1;
                    CodeLine{nCodeLine,1} = 'pushpc';
                    CodeLine{nCodeLine,2} = [] ;
                    nCodeLine = nCodeLine + 1;
                    CodeLine{nCodeLine,1} = 'st';
                    CodeLine{nCodeLine,2} = [] ;
                    nCodeLine = nCodeLine + 1;
                    CodeLine{nCodeLine,1} = 'jmp';
                    CodeLine{nCodeLine,2} = sym_value ;
                    token_recognized = 1;
                end
                
                % not in symbol table -- does it contain "[" or "="
                %parse var[var] or =var or =var[var]
            elseif ~isempty(strfind(token,'[')) | ~isempty(strfind(token,'='))
                
                %get equal token
                eq_flag = 0;
                if ~isempty(strfind(token,'='))
                    eq_flag = 1;
                    token = token(2:end); % strip = sign
                end
                
                %get variable tokens
                bracket_flag = 0 ;
                if ~isempty(strfind(token,'['))
                    t1 = token(1:strfind(token,'[')-1);
                    t2 = token(strfind(token,'[')+1:end-1);
                    bracket_flag = 1;
                else % must be = sign only
                    t1 = token ;
                    t2 = [];
                end
                
                if eq_flag %test for store
                    %gen store code
                    if bracket_flag
                        nCodeLine = nCodeLine + 1;
                        CodeLine{nCodeLine,1} = 'pushi'; % do the store
                        CodeLine{nCodeLine,2} = t1 ;
                        nCodeLine = nCodeLine + 1;
                        CodeLine{nCodeLine,1} = 'push'; %index offset
                        CodeLine{nCodeLine,2} = t2 ;
                        nCodeLine = nCodeLine + 1;
                        CodeLine{nCodeLine,1} = 'add'; %leave addr on stack
                        CodeLine{nCodeLine,2} = [] ;
                        nCodeLine = nCodeLine + 1;
                        CodeLine{nCodeLine,1} = 'over'; %value to top-stack
                        CodeLine{nCodeLine,2} = [] ;
                        nCodeLine = nCodeLine + 1;
                        CodeLine{nCodeLine,1} = 'st'; %do the store
                        CodeLine{nCodeLine,2} = [] ;
                        nCodeLine = nCodeLine + 1;
                        CodeLine{nCodeLine,1} = 'drop'; %value copy
                        CodeLine{nCodeLine,2} = [] ;
                        token_recognized = 1;
                    else % no bracket, so simple store
                        nCodeLine = nCodeLine + 1;
                        CodeLine{nCodeLine,1} = 'pop'; % store value
                        CodeLine{nCodeLine,2} = t1 ;
                        token_recognized = 1;
                    end
                else %must be a load request AND there must be a bracket
                    % OR a 'in' OR an 'out' command
                    %gen load code
                    if strcmp(t1,'in')
                        nCodeLine = nCodeLine + 1;
                        CodeLine{nCodeLine,1} = 'in'; %
                        CodeLine{nCodeLine,2} = t2 ;
                        token_recognized = 1;
                    elseif strcmp(t1,'out')
                        nCodeLine = nCodeLine + 1;
                        CodeLine{nCodeLine,1} = 'out'; %
                        CodeLine{nCodeLine,2} = t2 ;
                        token_recognized = 1;
                    else %load request
                        nCodeLine = nCodeLine + 1;
                        CodeLine{nCodeLine,1} = 'pushi'; %base address
                        CodeLine{nCodeLine,2} = t1 ;
                        nCodeLine = nCodeLine + 1;
                        CodeLine{nCodeLine,1} = 'push'; %index offset
                        CodeLine{nCodeLine,2} = t2 ;
                        nCodeLine = nCodeLine + 1;
                        CodeLine{nCodeLine,1} = 'add'; % make address
                        CodeLine{nCodeLine,2} = [] ;
                        nCodeLine = nCodeLine + 1;
                        CodeLine{nCodeLine,1} = 'ld'; %leave value on stack
                        CodeLine{nCodeLine,2} = [] ;
                        token_recognized = 1;
                    end
                end
            
            % is it a number?
            elseif isstrprop(token(1),'digit') | strcmp(token(1),'-') %a number?isstrprop
                %short (<12 bit) numbers use a compact code
                if (str2num(token)>-2047) & (str2num(token)<2047)
                    nCodeLine = nCodeLine + 1;
                    CodeLine{nCodeLine,1} = 'pushi';
                    CodeLine{nCodeLine,2} = token ;
                    % == mods for 18-bit numbers ===
                    %strip the minus sign (if any)
                else
                    if strcmp(token(1),'-')
                        ttoken = token(2:end);
                    else
                        ttoken = token;
                    end
                    nCodeLine = nCodeLine + 1;
                    CodeLine{nCodeLine,1} = 'pushi';
                    CodeLine{nCodeLine,2} = num2str(fix(str2num(ttoken)/128)) ; %to be divided by 2^7
                    nCodeLine = nCodeLine + 1;
                    CodeLine{nCodeLine,1} = 'pushi';
                    CodeLine{nCodeLine,2} = '7' ;
                    nCodeLine = nCodeLine + 1;
                    CodeLine{nCodeLine,1} = 'shl';
                    CodeLine{nCodeLine,2} = [] ;
                    nCodeLine = nCodeLine + 1;
                    CodeLine{nCodeLine,1} = 'pushi';
                    CodeLine{nCodeLine,2} = num2str(mod(fix(str2num(ttoken)),128));
                    nCodeLine = nCodeLine + 1;
                    CodeLine{nCodeLine,1} = 'bor';
                    CodeLine{nCodeLine,2} = [] ;
                    if strcmp(token(1),'-')
                        nCodeLine = nCodeLine + 1;
                        CodeLine{nCodeLine,1} = 'neg';
                        CodeLine{nCodeLine,2} = [];
                    end
                end
                token_recognized = 1;
                
            elseif ~isnan(instOpcode) & strcmp(instOpcode(1),'f') % f-type opcode?
                nCodeLine = nCodeLine + 1;
                CodeLine{nCodeLine,1} = opcode{opcode_index,1} ;
                CodeLine{nCodeLine,2} = [];  
                token_recognized = 1;
             
			elseif ~isempty(strfind(token,'.')) %assembly code
				t1 = token(1:strfind(token,'.')-1);
                t2 = token(strfind(token,'.')+1:end);
				nCodeLine = nCodeLine + 1;
                CodeLine{nCodeLine,1} = t1; % form asm command
                CodeLine{nCodeLine,2} = t2 ;
                token_recognized = 1;
			
			elseif ~isempty(strfind(token, ':'))  %is it a label?
                % if so, it should be in the symbol table
                t1 = token(1:end-1);
                sym_loc = nan ;
                for j=1:nTableIndex
                    if (strcmp(t1, symbolTable{j,1}))
                        sym_loc = j ;
                    end
                end
                if ~isnan(sym_loc)
                    symbolTable{sym_loc,2} = nCodeLine ; % code location
                    CodeLine{nCodeLine+1,3} = token ; %store for comment generation
                    token_recognized = 1;
                else
                    error(['Undefined label...', token])
                end
            end
            
            if token_recognized == 0
                error(['Unrecognized token...',token ])
            end
            [token,rtxt] = strtok(rtxt) ;  % get next token
        end % while ~isempty(token)
    end % end of 'code' state machine
end % while feof(fid) == 0 


if while_level>0
    error('Improper while_statement nesting ... missing endwhile?')
end
if if_level>0
    error('Improper if_statement nesting ... missing endif?')
end

fclose(fid); % done reading asm file

%===============================================
%start generating mif file (object code generation)
fid = fopen([fpath,fname(1:end-4),'.mif'], 'w') ;
fprintf(fid, '%s\n', 'DEPTH = 4096;') ;
fprintf(fid, '%s%2i%s\n', 'WIDTH = ',N_BITS,';');
fprintf(fid, '%s\n', '  ');
fprintf(fid, '%s\n', 'ADDRESS_RADIX = HEX;');
fprintf(fid, '%s\n', 'DATA_RADIX = HEX;');
fprintf(fid, '%s\n', '   ');
fprintf(fid, '%s\n', 'CONTENT');
fprintf(fid, '%s\n', 'BEGIN');
fprintf(fid, '%s\t:\t%s\n', '[000..FFF]', '0000;');

% generate code section in mif format
for i=1:nCodeLine
    hexaddr = i - 1; %zero based addresses for code
    %opcode table lookup: find the hex opcode which matches the
    % current line's string opcode
    instOpcode = nan ;
    for  j=1:nOpcode
        if  (strcmp(opcode{j,1}, CodeLine{i,1}))
            instOpcode = opcode{j, 2} ; %hexidecimal string
            opcode_index = j;
        end
    end
    if (isnan(instOpcode))
        error(['Bad opcode ', CodeLine{i,1},' in code line:', num2str(i)])
    end
    % convert argument symbol into a number instAddr
    % if a number, use it
    % otherwise  use symbol table values
    inst_arg = nan ;
    % check to see if argument exists
    if (~isnan(CodeLine{i,2}))
        % check for numeric  isstrprop('str', 'category')
        if isstrprop(CodeLine{i,2}(1),'digit') | strcmp(CodeLine{i,2}(1),'-')
            inst_arg = str2num(CodeLine{i,2}) ;
        else
            % symbol search
            for j=1:nTableIndex %search symbol table
                if (strcmp(CodeLine{i,2}, symbolTable{j,1}))
                    inst_arg = symbolTable{j,2} ;
                end
            end
            if isnan(inst_arg)
                error(['Undefined symbol in code line:', num2str(i)...
                    ,' ',CodeLine{i,3},' ',CodeLine{i,1},' ',CodeLine{i,2}])
            end
        end %end addr search
    end
    
    %detect undefined address and build the hex instruction
    if (isnan(inst_arg))
        inst = instOpcode;
    else
        if inst_arg>=0
            inst = [instOpcode(1),dec2hex(inst_arg,3)];
        else
            inst = [instOpcode(1),dec2hex(bitcmp(-inst_arg,12)+1,3)];
        end
    end
    
    %do some argument checks
    if isnan(inst_arg) & opcode{opcode_index, 3}>0
        error(['Need argument in code line:', num2str(i)...
            ,' ',CodeLine{i,3},' ',CodeLine{i,1}])
    end
    
    % only pushi can have a negative argument
    if inst_arg<0 & opcode{opcode_index, 3}~=2
        error(['Argument must be positive in code line:', num2str(i),...
            ' ',CodeLine{i,3},CodeLine{i,1},' ', CodeLine{i,2}])
    end
    
    if ~isnan(inst_arg) & opcode{opcode_index, 3}==0
        error(['No Argument allowed in code line:', num2str(i) ...
            ,' ',CodeLine{i,3},CodeLine{i,1},' ',CodeLine{i,2}])
    end
    
    if ~isnan(inst_arg) & opcode{opcode_index, 3}==3 & inst_arg>7
        error(['I/O address too big in code line:', num2str(i) ...
            ,' ',CodeLine{i,3},CodeLine{i,1},' ',CodeLine{i,2}])
    end
    
    % emit the code
    fprintf(fid, '%03x\t:\t%s;\t%% %s %s %s %% \n', ...
        hexaddr, inst, CodeLine{i,3}, CodeLine{i,1}, CodeLine{i,2}) ;
    fprintf(1,'%03x\t:\t%s;\t%% %s %s %s %% \n', ...
        hexaddr, inst,  CodeLine{i,3}, CodeLine{i,1}, CodeLine{i,2}) ;
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

