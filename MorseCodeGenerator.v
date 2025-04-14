module mcg(clkin,rst,start,inp,dout,clk);
input clkin;
input rst;
input  [7:0]inp;
input start;
output reg dout;

reg[12:0]din;




always @*
begin
    case(inp)
    "a":din = 13'b0101110000000;
    "b":din = 13'b0111010101000;
    "c":din = 13'b0111010111010;
    "d":din = 13'b0111010100000;
    "e":din = 13'b0100000000000;    
    "f":din = 13'b0101011101000;
    "g":din = 13'b0111011101000;
    "h":din = 13'b0101010100000;
    "i":din = 13'b0101000000000;
    "j":din = 13'b1011101110111;
    "k":din = 13'b0111010111000;
    "l":din = 13'b0101110101000;
    "m":din = 13'b0111011100000;
    "n":din = 13'b0111010000000;
    "o":din = 13'b0111011101110;
    "p":din = 13'b0101110111010;
    "q":din = 13'b1110111010111;
    "r":din = 13'b0101110100000;
    "s":din = 13'b0101010000000;
    "t":din = 13'b0111000000000;
    "u":din = 13'b0101011100000;
    "v":din = 13'b0101010111000;
    "w":din = 13'b0101110111000;
    "x":din = 13'b0111010101110;
    "y":din = 13'b1110101110111;
    "z":din = 13'b0111011101010;
    default :din=13'b0000000000000;
    endcase
end

reg [3:0] cnt;
    always @(posedge clk or posedge rst)
    begin
        if(rst) cnt<=0;
        else
        if(cnt==0) cnt<= start ? 1 : 0;
        else  cnt<= (cnt==13) ? 0:(cnt+1);
    end
always @*
        begin
        case(cnt)
        1:dout=din[12];
        2:dout=din[11];
        3:dout=din[10];
        4:dout=din[9];
        5:dout=din[8];
        6:dout=din[7];
        7:dout=din[6];
        8:dout=din[5];
        9:dout=din[4];
        10:dout=din[3];
        11:dout=din[2];
        12:dout=din[1];
        13:dout=din[0];
        default:dout=1'b0;
        endcase
    end
reg [24:0] counter;
output reg clk;
initial begin
    counter = 0;
    clk = 0;
end
always @(posedge clkin) begin
    if (counter == 0) begin
        counter <= 4999999;
        clk <= ~clk;
    end else begin
        counter <= counter -1;
    end
end
endmodule