function [ minimal_distance ] = match( models, current_word_lpcc_coeff )
    % Find best match in model database for word.
    % Args: 
    % - models matrix as containers.Map
    % - LPCC coefficients matrix of word
    models_dtw = foreach(models, @(x)dtw(x, current_word_lpcc_coeff));
    keys_ = keys(models_dtw);
    values_ = cell2mat(values(models_dtw));

    [val, index] = min(values_);
    minimal_distance = keys_(index);
    foreach(models_dtw, @(value, key)fprintf('%s: %i\n',key,value), true);
end

