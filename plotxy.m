data = readmatrix('curve_data.txt');

% Separate columns into x and y
x = data(:, 1);
y = data(:, 2);

% Plot the curve
figure;
plot(x, y, '-o', 'LineWidth', 2);

