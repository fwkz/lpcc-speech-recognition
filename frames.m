function [data] = frames(signal, frame_length, offset, silence_treshold)
    % Divide signal into frames

    % declare variables
    data = [];
    r_offset = offset;
    l_offset = frame_length - r_offset;

    % checking if r_offset > frame_length
    if r_offset >= frame_length
        throw(MException('MATLAB:ValueError', 'Offset value should be greater than frame length!'));
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
        
        if sum(frame.^2) > silence_treshold
            data = [data frame];
        end
        
        start_point = start_point + l_offset;
        end_point = end_point + l_offset;
    end
end