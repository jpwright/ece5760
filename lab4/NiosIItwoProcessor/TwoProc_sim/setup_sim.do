    set sopc "c:/altera/quartus60/sopc_builder"
    set sopc_perl "c:/altera/quartus60//bin/perl561"
    echo "Sopc_Builder Directory: $sopc";

# ModelSimPE and OEM have different requirements
# regarding how they load their test bench.
# We account for that 
if { [ vsimAuth ] == "ALTERA" } {
 alias _init_setup {} } else {
 alias _init_setup {
                       vmap lpm_ver       work
                       vmap altera        work
                       vmap altera_mf_ver work
                       vmap sgate_ver     work
                       } } 


# ModelSimPE and OEM have different requirements
# regarding how they simulate their test bench.
# We account for that here
if { [ vsimAuth ] == "ALTERA" } {
 alias _vsim {vsim -t ps +nowarnTFMPC  -L lpm_ver -L sgate_ver test_bench }  } else {
 alias _vsim {vsim -t ps +nowarnTFMPC test_bench }  } 

alias test_contents_files {if {[ file exists "contents_file_warning.txt" ]} { set ch [open "contents_file_warning.txt" r];  while { 1 } { if ([eof $ch]) {break}; gets $ch line; puts $line; }; close $ch; } }
alias s "vlib work;
_init_setup
 
 
vlog +incdir+.. ../TwoProc.v;
_vsim;
do virtuals.do
; test_contents_files"
alias r "exec $sopc_perl/bin/perl -I $sopc/bin/perl_lib -I $sopc/bin $sopc/bin/run_command_in_unix_like_shell.pl $sopc { cd ../;  ./TwoProc_generation_script  } "
alias c "echo {Regenerating memory contents.
 (This may take a moment)...}; restart -f; exec $sopc_perl/bin/perl -I $sopc/bin/perl_lib -I $sopc/bin $sopc/bin/run_command_in_unix_like_shell.pl $sopc { cd ../;  ./TwoProc_generation_script  }  --software_only=1"
alias w "do wave_presets.do"
alias l "do list_presets.do"
alias h "
echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
echo @@
echo @@        setup_sim.do
echo @@
echo @@   Defined aliases:
echo @@
echo @@   s  -- Load all design (HDL) files.
echo @@           re-vlog/re-vcom and re-vsim the design.
echo @@
echo @@   c  -- Re-compile memory contents.
echo @@          Builds C- and assembly-language programs
echo @@          (and associated simulation data-files
echo @@          such as UART simulation strings) for
echo @@          refreshing memory contents.
echo @@          Does NOT re-generate hardware (HDL) files
echo @@          ONLY WORKS WITH LEGACY SDK (Not the Nios IDE)
echo @@
echo @@   w  -- Sets-up waveforms for this design
echo @@          Each SOPC-Builder component may have
echo @@          signals 'marked' for display during
echo @@          simulation.  This command opens a wave-
echo @@          window containing all such signals.
echo @@
echo @@   l  -- Sets-up list waveforms for this design
echo @@          Each SOPC-Builder component may have
echo @@          signals 'marked' for listing during
echo @@          simulation.  This command opens a list-
echo @@          window containing all such signals.
echo @@
echo @@   h  -- print this message 
echo @@
echo @@"

h
