clc;
clear;
close all;

% declare variables
data = [];
lpc_coeff = [];
frame_length = 512; 
r_offset = 0;
l_offset = frame_length - r_offset;

% checking if r_offset > frame_length
if r_offset >= frame_length
    throw(MException('MATLAB:ValueError', 'Offset value should be greater than frame length!'));
end

filename = 'mama.wav';

% load signal
[signal, fs, x] = wavread(['samples/' filename]);

% delete one of the stereo channel and transpose
try
    signal(:, 2) = [];
catch err
    %pass
end

% calculate number of frames
frames = floor(length(signal) / l_offset);
 
% coords of matrix slice
start_point = 1;
end_point = frame_length;

% main computing loop
for column_number = 1:1:frames
    try
        frame = signal(start_point:end_point);
    catch err
        break
    end
    
    % computing frames matrix
    data = [data frame];
    
    %lpc coefficients
    lpc_coeff(:, column_number) = lpc(frame, 18)';
    
    start_point = start_point + l_offset;
    end_point = end_point + l_offset;
end