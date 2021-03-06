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

snrDB = snrRuimDB;

%% Obtendo AWGN do Matlab
%matlabAWGN = awgn(original, snrDB, 'measured');

%% Importando código fornecido nos slides

% Gamma - representa a relação SNR
% Aqui está implementada a conversão (dB → escalar) por questões de
% flexibilidade. Caso a SNR já esteja na forma escalar, basta ignorar esta
% etapa de cálculo e fazer "gamma = SNR;"
gamma = 10 ^ (snrDB / 10);

% Cálculo da potência média do sinal (P)
p = sum(original .^ 2) / length(original);

% Cálculo da densidade espectral do ruído (N0)
n0 = (p / gamma);

% Gerando o sinal de ruído (AWGN)
% randn(n) - retorna uma matriz nxn de números aleatórios distribuídos
% normalmente
ruido = sqrt(n0 / 2) * randn(size(original));

% Por fim, o sinal recebido é a soma do sinal original com o ruído
recebido = original + ruido;

%% Plotando os sinais
plot(t, original, t, recebido);
xlabel('Tempo (s)');
ylabel('Amplitude (V)');
title('Sinal no tempo');
legend('Sinal original','Sinal corrompido pelo AWGN');
zoom xon;