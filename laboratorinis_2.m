clear all
clc

% 1) Sugeneruojamos pradines reiksmes. Apskaiciuojamas tinklo atsakas. 
x = 0.1:1/22:1;
y = (1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x)/2;
plot (x,y);
% 2) Sugeneruojamos pradiniai svoriai

% ========== Pirmas sluoksnis ==========
w1_1 = randn(1);
w2_1 = randn(1);
w3_1 = randn(1);
w4_1 = randn(1);

b1_1 = randn(1);
b2_1 = randn(1);
b3_1 = randn(1);
b4_1 = randn(1);
% ======================================

% ========== Pasleptasis antras sluoksnis ==========
w1_2 = randn(1);
w2_2 = randn(1);
w3_2 = randn(1);
w4_2 = randn(1);

b1_2 = randn(1); %viena baze, nes vienas isejimas pagal salyga
% ==================================================
mok_zing = 0.15
for indx = 1:10000
    for n = 1:20
        % ========== Pirmas sluoksnis ==========
        v1_1 = x(n) * w1_1 + b1_1;
        v2_1 = x(n) * w2_1 + b2_1;
        v3_1 = x(n) * w3_1 + b3_1;
        v4_1 = x(n) * w4_1 + b4_1;
        
        % sigmoidine aktyvavimo f-ja
        y1_1 = 1 / (1 + exp(-v1_1)); 
        y2_1 = 1 / (1 + exp(-v2_1));
        y3_1 = 1 / (1 + exp(-v3_1));
        y4_1 = 1 / (1 + exp(-v4_1));
        
        
        % ========== Pasleptasis antras sluoksnis ==========
        
        % pasverta suma isejimo sluoksnyje
        v1_2 = (y1_1 * w1_2 + b1_2) + (y2_1 * w2_2) + (y3_1 * w3_2) + (y4_1 * w4_2);
        
        % skaiciuojame isejima. Aktyvavimo f-ja yra tiesine
        y_apsk = v1_2;
        
        % apskaiciuojame klaida
        e = y(n) - y_apsk;
    
        % apskaiciuojame rysiu svorius. w = w + mok_zing * delta * input.
        delta_out = e;
        
        %delta yra isvestine aktyvavimo f-jos dauginta is aktyvavimo sigmoidines f-jos
        %isvestines
        delta_1 = y1_1 * (1-y1_1) * (delta_out*w1_2);
        delta_2 = y2_1 * (1-y2_1) * (delta_out*w2_2);
        delta_3 = y3_1 * (1-y3_1) * (delta_out*w3_2);
        delta_4 = y4_1 * (1-y4_1) * (delta_out*w4_2);
        b1_2 = b1_2 + mok_zing * delta_out;
    
        % atnaujinti svorius isejimo sluoksnyje
        w1_2 = w1_2 * mok_zing * delta_out * y1_1;
        w2_2 = w2_2 * mok_zing * delta_out * y2_1;
        w3_2 = w3_2 * mok_zing * delta_out * y3_1;
        w4_2 = w4_2 * mok_zing * delta_out * y4_1;
    
        % atnaujinti svorius pasleptajame sluoksnyje
        w1_1 = w1_1 * mok_zing * delta_1 * x(n);
        w2_1 = w2_1 * mok_zing * delta_2 * x(n);
        w3_1 = w3_1 * mok_zing * delta_3 * x(n);
        w4_1 = w4_1 * mok_zing * delta_4 * x(n);
    
        b1_1 = b1_1 + mok_zing * delta_1;
        b2_1 = b2_1 + mok_zing * delta_2;
        b3_1 = b3_1 + mok_zing * delta_3;
        b4_1 = b4_1 + mok_zing * delta_4;
    
    end
end

for i = 1:20
    v1_1 = x(n) * w1_1 + b1_1;
    v2_1 = x(n) * w2_1 + b2_1;
    v3_1 = x(n) * w3_1 + b3_1;
    v4_1 = x(n) * w4_1 + b4_1;
    
    
    y1_1 = 1 / (1 + exp(-v1_1)); 
    y2_1 = 1 / (1 + exp(-v2_1));
    y3_1 = 1 / (1 + exp(-v3_1));
    y4_1 = 1 / (1 + exp(-v4_1));
    
    v1_2 = (y1_1 * w1_2 + b1_2) + (y2_1 * w2_2) + (y3_1 * w3_2) + (y4_1 * w4_2);
    
    y_apsk = v1_2;
    
    e = y(n) - y_apsk;
end