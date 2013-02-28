% Finite difference drum/chime 
% Bruce Land, Cornell University, May 2008
% second order scheme from
% http://arxiv.org/PS_cache/physics/pdf/0009/0009068v2.pdf, 
% page 14, eqn 2.18

clear all

%sound quality
%changing the strike location  and output location(s) also changes the quality
% n   rho   eta   alpha boundaryGain sound
% 12  0.5   1e-4  1.0   0            chime
% 12  0.5   2e-3  1.0   0            tin can
% 12  0.5   2e-3  1.0   0.5          tin can
% 6   0.5   2e-4  1.0   0.75         bell
% 16  0.25  5e-4  0.1   0.0          drum
% 16  0.05  2e-4  0.1   0.0          bass drum

%square membrane frequency ratios
f = [1, 1.58, 2, 2.24, 2.55, 2.92, 3, 3.16, 3.54, 3.6, 3.8, 4, 4.12, 4.3, 4.47, 4.5, 4.74, 5];
f0 = 0.161 ;

%linear dimension of membrane -- bigger is lower pitch
n = 10 ;
u = zeros(n,n); %time t
u1 = zeros(n,n); %time t-1
u2 = zeros(n,n); %time t-2
uHit = zeros(n,n); %input strike

% 0 < rho < 0.5 -- lower rho => lower pitch
% rho = (vel*dt/dx)^2
rho = 0.295 ;
% eta = damping*dt/2
% higher damping => shorter sound
eta = 0.0002 ;
% boundary condition -1.0<gain<1.0
% 1.0 is completely free edge
% 0.0 is clamped edge
boundaryGain = 0 ;

%time
Fs = 8000 ;
time = 0.0:1/Fs:5.0;
%output sound
aud = zeros(size(time)) ;

%sets the amplitude of the stick strike 
ampIn = .3; 
%sets the position of the stick strike: 0<pos<n
x_mid = n/2;
y_mid = n/2;
%sets width of the gaussian strike input -- see figure 1
alpha = .1 ;
%compute the gaussian strike amplitude
for i=2:n-1
    for j=2:n-1
        uHit(i,j) = ampIn*exp(-alpha*(((i-1)-x_mid)^2+((j-1)-y_mid)^2));
    end
end
%enforce boundary conditions
uHit(1,:) = boundaryGain * uHit(2,:);
uHit(n,:) = boundaryGain * uHit(n-1,:);
uHit(:,1) = boundaryGain * uHit(:,2);
uHit(:,n) = boundaryGain * uHit(:,n-1);

figure(1);clf;
mh = mesh(uHit);
title('initial displacement')
set(gca, 'zlim', [-0.5,0.5])

%index for storing audio output
tindex = 1;

for t=time
    
    %animate drum -- very SLOW
     set(mh, 'zdata', u)
     drawnow
    
    % use the central sample for output
    % any other sample or sum is also valid to try
    sampleLoc = fix(n/4);
    aud(tindex) = u(sampleLoc,sampleLoc); ; %sum(sum(u))/(n^2); %
    
    %vectorized update of positions, except for boundaries
    u(2:n-1,2:n-1) = 1/(1+eta) * (...
              rho * (u1(3:n,2:n-1)+u1(1:n-2,2:n-1)+u1(2:n-1,3:n)+u1(2:n-1,1:n-2)-4*u1(2:n-1,2:n-1)) ...
              + 2 * u1(2:n-1,2:n-1) ...
              - (1-eta) * (u2(2:n-1,2:n-1)) ...
              ) ;
    
    %enforce boundary conditions
    u(1,:) = boundaryGain * u(2,:);
    u(n,:) = boundaryGain * u(n-1,:);
    u(:,1) = boundaryGain * u(:,2);
    u(:,n) = boundaryGain * u(:,n-1);
    %u(4,4) = 0;
    
    %enforce boundary conditions
%     u(1,:) = boundaryGain * (u(2,:)+u1(2,:));
%     u(n,:) = boundaryGain * (u(n-1,:)+u1(n-1,:));
%     u(:,1) = boundaryGain * (u(:,2)+u1(:,2)) ;
%     u(:,n) = boundaryGain * (u(:,n-1)+u1(:,n-1));
    
    %update history 
    u2 = u1;
    u1 = u;
    
    %apply drum strikes at three times
    if t==0 | t==1.0 | t==2.0
        u1 = u1 + uHit;
    end
    
    tindex = tindex + 1;    
end

% get the spectrum
figure(2); clf;
Hs=spectrum.welch('Hamming',1024,50);
psd(Hs,aud,'Fs',Fs)
for i=1:length(f)
    line([f(i)*f0 f(i)*f0], [-20 -200], 'color','r');
end
title('Free edge plate spectrum')
set(gca,'xlim',[0 2])

%play the sound
sound(aud,Fs)

%end
%============================================================