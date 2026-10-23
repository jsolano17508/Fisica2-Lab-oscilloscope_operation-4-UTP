
f = 120; % Frecuencia en Hz
w = 2 * pi * f; % Frecuencia angular en rad/s
C = 47e-6; % Capacitancia en Faradios
V_pico = 5; % Voltaje pico de la fuente (Asumido 5V para visualización)

% Vector de tiempo (3 periodos para visualizar correctamente)
t = linspace(0, 3/f, 1000);

% Señal de la fuente
V_fuente = V_pico * sin(w * t);

% Caso 1: R = 100 kOhm
R1 = 100e3;
Xc = 1 / (w * C);
Z1 = sqrt(R1^2 + Xc^2);
phi1 = atan(Xc / R1); % Desfase en radianes
V_R1 = (V_pico * R1 / Z1) * sin(w * t + phi1);

% Caso 2: R = 4.7 Ohm
R2 = 4.7;
Z2 = sqrt(R2^2 + Xc^2);
phi2 = atan(Xc / R2); % Desfase en radianes
V_R2 = (V_pico * R2 / Z2) * sin(w * t + phi2);

% --- Configuración de la Figura (Estilo Simscape Oscilloscope) ---
fig = figure('Name', 'Análisis de Desfase RC', 'NumberTitle', 'off', 'Color', '#1e1e1e', 'Position', [100, 100, 900, 700]);

% Colores de las señales (Estilo osciloscopio)
color_fuente = '#FFFF00'; % Amarillo (Ch1)
color_senal2 = '#00FFFF'; % Cian (Ch2) - Variable corregida sin 'ñ'

% Gráfica 1: Señal de la fuente
ax1 = subplot(3, 1, 1);
plot(t * 1000, V_fuente, 'Color', color_fuente, 'LineWidth', 1.5);
title('Señal de la Fuente Generadora', 'Color', 'w', 'FontSize', 11);
xlabel('Tiempo (ms)', 'Color', 'w');
ylabel('Voltaje (V)', 'Color', 'w');
grid on;
set(ax1, 'Color', 'k', 'XColor', 'w', 'YColor', 'w', 'GridColor', '#555555', 'GridAlpha', 0.7);

% Gráfica 2: Superposición con R = 100 kOhm
ax2 = subplot(3, 1, 2);
plot(t * 1000, V_fuente, 'Color', color_fuente, 'LineWidth', 1.5); hold on;
plot(t * 1000, V_R1, 'Color', color_senal2, 'LineWidth', 1.5, 'LineStyle', '--');
title('Superposición: Fuente vs Voltaje en R (100 k\Omega)', 'Color', 'w', 'FontSize', 11);
xlabel('Tiempo (ms)', 'Color', 'w');
ylabel('Voltaje (V)', 'Color', 'w');
legend({'V Fuente', 'V Resistencia (En fase)'}, 'TextColor', 'w', 'Color', 'none', 'EdgeColor', 'w', 'Location', 'northeast');
grid on;
set(ax2, 'Color', 'k', 'XColor', 'w', 'YColor', 'w', 'GridColor', '#555555', 'GridAlpha', 0.7);

% Gráfica 3: Superposición con R = 4.7 Ohm
ax3 = subplot(3, 1, 3);
plot(t * 1000, V_fuente, 'Color', color_fuente, 'LineWidth', 1.5); hold on;
plot(t * 1000, V_R2, 'Color', color_senal2, 'LineWidth', 1.5);
title('Superposición: Fuente vs Voltaje en R (4.7 \Omega)', 'Color', 'w', 'FontSize', 11);
xlabel('Tiempo (ms)', 'Color', 'w');
ylabel('Voltaje (V)', 'Color', 'w');
legend({'V Fuente', 'V Resistencia (Desfasada)'}, 'TextColor', 'w', 'Color', 'none', 'EdgeColor', 'w', 'Location', 'northeast');
grid on;
set(ax3, 'Color', 'k', 'XColor', 'w', 'YColor', 'w', 'GridColor', '#555555', 'GridAlpha', 0.7);

% Ajustar espacio entre subplots
sgtitle('Comportamiento Teórico del Circuito RC en Régimen AC Permanente', 'Color', 'w', 'FontSize', 14, 'FontWeight', 'bold');