/****************************************************************
 * Skyler Schneider ss868                                       *
 * ECE 5760 Lab 1                                               *
 * 1-Dimensional Cellular Automaton                             *
 * Modified from ECE 5760 DE2 VGA Examples                      *
 ****************************************************************/

module VGA_Controller( // Host Side
    iCursor_RGB_EN,
    iCursor_X,
    iCursor_Y,
    iCursor_R,
    iCursor_G,
    iCursor_B,
    iRed,
    iGreen,
    iBlue,
    oAddress,
    oCoord_X,
    oCoord_Y,
    // VGA Side
    oVGA_R,
    oVGA_G,
    oVGA_B,
    oVGA_H_SYNC,
    oVGA_V_SYNC,
    oVGA_SYNC,
    oVGA_BLANK,
    oVGA_CLOCK,
    // Control Signal
    iCLK,
    iRST_N
);
    
    `include "VGA_Param.h"
    
    // Host Side
    output reg [19:0]  oAddress;
    output reg [9:0]   oCoord_X;
    output reg [9:0]   oCoord_Y;
    input      [3:0]   iCursor_RGB_EN;
    input      [9:0]   iCursor_X;
    input      [9:0]   iCursor_Y;
    input      [9:0]   iCursor_R;
    input      [9:0]   iCursor_G;
    input      [9:0]   iCursor_B;
    input      [9:0]   iRed;
    input      [9:0]   iGreen;
    input      [9:0]   iBlue;
    // VGA Side
    output reg [9:0]   oVGA_R;
    output reg [9:0]   oVGA_G;
    output reg [9:0]   oVGA_B;
    output reg         oVGA_H_SYNC;
    output reg         oVGA_V_SYNC;
    output             oVGA_SYNC;
    output             oVGA_BLANK;
    output             oVGA_CLOCK;
    // Control Signal
    input              iCLK;
    input              iRST_N;
    
    // Internal Registers and Wires
    reg        [9:0]   H_Cont;
    reg        [9:0]   V_Cont;
    reg        [9:0]   Cur_Color_R;
    reg        [9:0]   Cur_Color_G;
    reg        [9:0]   Cur_Color_B;
    wire               mCursor_EN;
    wire               mRed_EN;
    wire               mGreen_EN;
    wire               mBlue_EN;

    assign oVGA_BLANK = oVGA_H_SYNC & oVGA_V_SYNC;
    assign oVGA_SYNC  = 1'b0;
    assign oVGA_CLOCK = iCLK;
    assign mCursor_EN = iCursor_RGB_EN[3];
    assign mRed_EN    = iCursor_RGB_EN[2];
    assign mGreen_EN  = iCursor_RGB_EN[1];
    assign mBlue_EN   = iCursor_RGB_EN[0];
    
    always @(*) begin
        if(H_Cont >= X_START && H_Cont < X_START + H_SYNC_ACT &&
           V_Cont >= Y_START && V_Cont < Y_START + V_SYNC_ACT ) begin
            oVGA_R = mRed_EN   ? Cur_Color_R : 10'b0;
            oVGA_G = mGreen_EN ? Cur_Color_G : 10'b0;
            oVGA_B = mBlue_EN  ? Cur_Color_B : 10'b0;
        end
        else begin
            oVGA_R = 0;
            oVGA_G = 0;
            oVGA_B = 0;
        end
    end
    
    // Pixel LUT Address Generator
    always @(posedge iCLK or negedge iRST_N) begin
        if(!iRST_N) begin
            oCoord_X <= 0;
            oCoord_Y <= 0;
            oAddress <= 0;
        end
        else begin
            if((H_Cont+2) >= X_START && (H_Cont+2) < X_START + H_SYNC_ACT &&
               V_Cont     >= Y_START && V_Cont     < Y_START + V_SYNC_ACT ) begin
                oCoord_X <= (H_Cont+2) - X_START;
                oCoord_Y <= V_Cont - Y_START;
                oAddress <= (V_Cont - Y_START)*H_SYNC_ACT + ((H_Cont+2) - X_START);
            end
        end
    end
    
    // Cursor Generator
    always @(posedge iCLK or negedge iRST_N) begin
        if(!iRST_N) begin
            Cur_Color_R <= 0;
            Cur_Color_G <= 0;
            Cur_Color_B <= 0;
        end
        else begin
            if(H_Cont >= X_START && H_Cont < X_START + H_SYNC_ACT &&
               V_Cont >= Y_START && V_Cont < Y_START + V_SYNC_ACT ) begin
                if( mCursor_EN && (
                    (H_Cont == X_START + iCursor_X) ||
                    (H_Cont == X_START + iCursor_X + 1) ||
                    (H_Cont == X_START + iCursor_X - 1) ||
                    (V_Cont == Y_START + iCursor_Y) ||
                    (V_Cont == Y_START + iCursor_Y + 1) ||
                    (V_Cont == Y_START + iCursor_Y - 1)
                )) begin
                    Cur_Color_R <= iCursor_R;
                    Cur_Color_G <= iCursor_G;
                    Cur_Color_B <= iCursor_B;
                end
                else begin
                    Cur_Color_R <= iRed;
                    Cur_Color_G <= iGreen;
                    Cur_Color_B <= iBlue;
                end
            end
            else begin
                Cur_Color_R <= iRed;
                Cur_Color_G <= iGreen;
                Cur_Color_B <= iBlue;
            end
        end
    end
    
    // H_Sync Generator, Ref. 25.175 MHz Clock
    always @(posedge iCLK or negedge iRST_N) begin
        if(!iRST_N) begin
            H_Cont      <= 0;
            oVGA_H_SYNC <= 0;
        end
        else begin
            // H_Sync Counter and Generator
            if( H_Cont < H_SYNC_MAX ) begin
                if(H_Cont == (H_SYNC_CYC-1)) begin
                    oVGA_H_SYNC <= 1;
                end
                H_Cont <= H_Cont + 10'b1;
            end
            else begin
                H_Cont <= 0;
                oVGA_H_SYNC <= 0;
            end
        end
    end
    
    // V_Sync Generator, Ref. H_Sync
    always @(posedge iCLK or negedge iRST_N) begin
        if(!iRST_N) begin
            V_Cont      <= 0;
            oVGA_V_SYNC <= 0;
        end
        else begin
            // When H_Sync Re-start
            if(H_Cont == H_SYNC_MAX) begin
                // V_Sync Counter and Generator
                if( V_Cont < V_SYNC_MAX ) begin
                    if(V_Cont == (V_SYNC_CYC-1)) begin
                        oVGA_V_SYNC <= 1;
                    end
                    V_Cont <= V_Cont + 10'b1;
                end
                else begin
                    V_Cont <= 0;
                    oVGA_V_SYNC <= 0;
                end
            end
        end
    end
    
endmodule
