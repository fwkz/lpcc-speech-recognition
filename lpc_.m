function [ lpc_coeff ] = lpc_( framed_signal, prediction_order )
    % Compute LPC coefficients.
    lpc_coeff = [];
    for column_number = 1:1:size(framed_signal, 2)
        lpc_coeff = [lpc_coeff lpc(framed_signal(:, column_number), prediction_order)'];
    end
end