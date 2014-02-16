function [ models ] = learn_models(models_dir)
    % Compute word models for comparing.
    
    models_dir = dir([models_dir '/*.wav']);

    models = containers.Map();

    for model = 1:1:length(models_dir)
        FILENAME = models_dir(model).name(1:end-4);
        % disp(['Learning model: ' FILENAME])

        % Load signal.
        [signal, fs, x] = wavread(['models/' FILENAME]);

        % Delete one of the stereo channel and transpose.
        mono_signal = signal(:, 1);

        % Process signal into frames.
        framed_signal = frames(mono_signal, 512, 0);

        % Compute LPC coefficients.
        lpc_coeff = lpc_(framed_signal, 14);

        % Compute LPCC coefficients
        lpcc_coeff = lpcc(lpc_coeff, 6);

        models(FILENAME) = lpcc_coeff;
    end
end