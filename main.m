% simple stock simulator using financial data from yahoo finance
% we use the same SDE as used in the Black-Scholes model to simulate
% prices

% first import data from your yahoo finance .csv file

trials = 12;

S = fliplr(transpose(Close));

time = size(S);

time = time(2);

E = mean(S);

temp = zeros(time,1);

% this finds the variance of the stock

for j = 1 : time;
    temp(j) = (S(j)-E)^2;
end;

var = mean(temp);

% volatility is calculated using variance

vol = sqrt(var)/E;

% lograte calculation

rate = zeros(time,0);

for j = 1 : time-1;
    rate(j) = S(j+1)/S(j);
end;

lograte = log(mean(rate));

% this part solves the SDE: dX_t = a X_t dt + b X_t dW_t

X0 = S(time);
t0 = time;
T = 4500-t0;
N = 4500-t0;

a = lograte;
b = vol/sqrt(365);

t = linspace(t0,t0+T,N);
X = zeros(1,N);
dt = t(2)-t(1);

plot(linspace(1,time,time),S);
hold on;

for j = 1 : trials
    dW = sqrt(dt)*randn([1 N]);
    X(1) = X0;
    for i = 1 : N-1;
        X(i+1) = X(i)+a*X(i)*dt+b*X(i)*dW(i);
    end;
    plot(t,X);
    hold on;
end;


title('Share price over time');
xlabel('Time in days');
ylabel('Price in dollars');
hold on;