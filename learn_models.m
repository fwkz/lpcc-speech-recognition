function [ models ] = learn_models(models_path)
    % Compute word models for comparing.
    models_dir = dir([models_path '/*.wav']);

    models = containers.Map();

    for model = 1:1:length(models_dir)
        FILENAME = models_dir(model).name;%(1:end-4)
        % disp(['Learning model: ' FILENAME])
        
        lpcc_coeff = process_file([models_path '/' FILENAME]);

        models(FILENAME(1:end-4)) = lpcc_coeff;
    end
end