%% Especificações temporais
Fs = 8000;                   % amostras por segundo (Hz)
dt = 1/Fs;                   % tempo de uma amostra (s)
StopTime = 0.1;              % tempo de parada no eixo 'x' (o gráfico será plotado até este valor em 'x')
t = (0:dt:StopTime-dt)';     % vetor temporal (eixo 'x')

%% Senóide
Fc = 10;                     % Frequência do seno (Hz)
original = sin(2*pi*Fc*t);   % Calculando o seno na variável 'x'

%% Relações sinal-ruído (SNR)
snrBoa   = 100;
snrComum = 10;
snrRuim  = 2;

snrBoaDB   = 10 * log10(snrBoa  );
snrComumDB = 10 * log10(snrComum);
snrRuimDB  = 10 * log10(snrRuim );

%% Obtendo AWGN do Matlab
matlabAWGN = awgn(original, snrRuimDB, 'measured');

%% Plotando o seno no tempo
figure;
plot(t,original,t,matlabAWGN);
xlabel('Tempo (s)');
ylabel('Amplitude (V)');
title('Sinal no tempo');
zoom xon;