clc;
clear;
close all;

% Declare variables.
lpc_coeff = [];
FILENAME = 'mama.wav';

% Load signal.
[signal, fs, x] = wavread(['samples/' FILENAME]);

% Delete one of the stereo channel and transpose.
mono_signal = signal(:, 1);

% Process signal into frames.
framed_signal = frames(mono_signal, 512, 0);

for column_number = 1:1:size(framed_signal, 2)
    lpc_coeff = [lpc_coeff lpc(framed_signal(:, column_number), 18)'];
end