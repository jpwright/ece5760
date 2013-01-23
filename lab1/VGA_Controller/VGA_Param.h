/****************************************************************
 * Skyler Schneider ss868                                       *
 * ECE 5760 Lab 1                                               *
 * 1-Dimensional Cellular Automaton                             *
 * Modified from ECE 5760 DE2 VGA Examples                      *
 ****************************************************************/

// Horizontal Parameter ( Pixel )
parameter H_SYNC_CYC   = 95;
parameter H_SYNC_BACK  = 65;
parameter H_SYNC_ACT   = 640; // 640 pixels of content
parameter H_SYNC_FRONT = 0;   // Transferred to back porch to
                              // center screen
parameter H_SYNC_MAX   = 799; // 800 effective pixels (cycles)

// Virtical Parameter ( Line )
parameter V_SYNC_CYC   = 2;
parameter V_SYNC_BACK  = 33;
parameter V_SYNC_ACT   = 480; // 480 lines of content
parameter V_SYNC_FRONT = 10;  // Transferred to back porch to
                              // center screen
parameter V_SYNC_MAX   = 524; // 525 effective lines

// Start Offset
parameter X_START      = H_SYNC_CYC + H_SYNC_BACK;
parameter Y_START      = V_SYNC_CYC + V_SYNC_BACK;
