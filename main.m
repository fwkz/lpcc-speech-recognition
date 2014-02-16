clc;
clear;
close all;

% Learning models. Returns containers.Map
models = learn_models('samples');


% Declare variables.
FILENAME = 'mama.wav';

% Load signal.
[signal, fs, x] = wavread(FILENAME);

% Delete one of the stereo channel and transpose.
mono_signal = signal(:, 1);

% Process signal into frames.
framed_signal = frames(mono_signal, 512, 0);

% Compute LPC coefficients.
lpc_coeff = lpc_(framed_signal, 13);

% Compute LPCC coefficients
lpcc_coeff = lpcc(lpc_coeff, framed_signal);

best_match = match(models, lpcc_coeff)