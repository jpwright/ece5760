	

left = .5;
right = .5;
up = .5;
down = .5;
prev = 1;
prev2 =1;

v = [];
for i=1:100
newval = (((left+right+up+down - (prev + prev + prev + prev))/2^3) + (prev + prev) - prev2 + (prev2/2^8)) - 	((((left+right+up+down - (prev + prev + prev + prev))/2^3) + (prev + prev) - prev2 + (prev2/2^8))/2^8)
v = [v newval];
prev2 = prev;
prev = newval;
end

plot (1:length(v), v)