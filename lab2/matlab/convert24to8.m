function [out] = convert24to8(R, G, B)
	% Converts a 24-bit image (via R, G, and B channels) to a single 8-bit image
    out = R;
    [h,w] = size(R);
    for x = 1:h
        for y = 1:w
            rval = round(R(x,y) * (7/255));
            gval = round(G(x,y) * (7/255));
            bval = round(B(x,y) * (3/255));
            outval = [dec2bin(rval, 3), dec2bin(gval, 3), dec2bin(bval, 2)];
            out(x,y) = bin2dec(outval);
        end
    end
end
            
    