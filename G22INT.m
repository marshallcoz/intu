clear all;
figure;
N=256;
NFREC=N/2;
NCAS=6;
scale=5;
offset=1;

g= load('G22INT.RES');
ReG22=g(:, 2);
ImG22=g(:, 3);
AbsG22=g(:,4);
ReG22NUM=g(:, 5);
ImG22NUM=g(:, 6);
AbsG22NUM=g(:,7);

for j=1:NCAS;
    fi=NFREC*(j-1)+1;
    ff=NFREC*j;    
    plot(g(fi:ff,1), ReG22(fi:ff)*scale+offset*j, 'b');
    hold on;
    plot(g(fi:ff,1), ImG22(fi:ff)*scale+offset*j, '--r');
    hold on;
    plot(g(fi:ff,1), AbsG22(fi:ff)*scale+offset*j, 'r', 'Linewidth', 2);
    hold on;
%%%% Caso Numerico
    plot(g(fi:ff,1), ReG22NUM(fi:ff)*scale+offset*j, 'g');
    hold on;
    plot(g(fi:ff,1), ImG22NUM(fi:ff)*scale+offset*j, '--c');
    hold on;
    plot(g(fi:ff,1), AbsG22NUM(fi:ff)*scale+offset*j, '--k', 'Linewidth', 2);
    hold on;
end
xlabel ('Frequency [Hz]')

figure; 
f=load('SININT.RES');
escala=200;
offset=1;
for j=1:NCAS;
    ti=N*(j-1)+1;
    tf=N*j;    
    plot(f(ti:tf,1), f(ti:tf,2)*escala+offset*j,'b', 'Linewidth', 2);
    hold on;
    plot(f(ti:tf,1), f(ti:tf,3)*escala+offset*j,'r', 'Linewidth', 2);
    hold on;
end
xlabel ('Time [s]')
grid on;