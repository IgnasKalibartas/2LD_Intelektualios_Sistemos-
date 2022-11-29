clear all
clc

% 1) Sugeneruojamos pradines reiksmes. Apskaiciuojamas tinklo atsakas. 
x = 0.1:1/22:1;
y = (1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x)/2;

% 2) Sugeneruojamos pradiniai svoriai

w1_1 = randn(1);
w2_1 = randn(1);
w3_1 = randn(1);
w4_1 = randn(1);

b1_1 = randn(1);
b2_1 = randn(1);
b3_1 = randn(1);
b4_1 = randn(1);

v1_1 = x(1) * w1_1 + b1_1;
v2_1 = x(1) * w2_1 + b2_1;
v3_1 = x(1) * w3_1 + b3_1;
v4_1 = x(1) * w4_1 + b4_1;

% sigmoidine aktyvavimo f-ja
y1_1 = 1 / (1 + exp(-v1_1)); 
y2_1 = 1 / (1 + exp(-v2_1));
y3_1 = 1 / (1 + exp(-v3_1));
y4_1 = 1 / (1 + exp(-v4_1));

% pasleptasis sluoksnis
w1_2 = randn(1);
w2_2 = randn(1);
w3_2 = randn(1);
w4_2 = randn(1);

b1_2 = randn(1);
b2_2 = randn(1);
b3_2 = randn(1);
b4_2 = randn(1);

v1_1 = y1_1 * w1_2 + b1_2;
v2_1 = y2_1 * w2_2 + b2_2;
v3_1 = y3_1 * w3_2 + b3_2;
v4_1 = y4_1 * w4_2 + b4_2;





