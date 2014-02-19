function [ lpcc_coeff ] = process_file( sample_path )

% Load signal.
[signal, fs, x] = wavread(sample_path);

% Delete one of the stereo channel and transpose.
mono_signal = signal(:, 1);

% Process signal into frames.
framed_signal = frames(mono_signal, 128, 0, 5);

% Compute LPC coefficients.
lpc_coeff = lpc_(framed_signal, 14);

% Compute LPCC coefficients
lpcc_coeff = lpcc(lpc_coeff, 6);

end

