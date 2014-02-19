clc;
clear;
close all;

% Learning models. Returns containers.Map
models = learn_models('models');

% Declare variables.
PATH = 'samples/kontrabas9.wav';

lpcc_coeff = process_file(PATH);

best_match = match(models, lpcc_coeff)