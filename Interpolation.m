function [ Reconstructed ] = Interpolation(y, N)
% This function takes a downsampled signal, y, as well as its downsampling
% factor, N, and reconstructs the signal using MATLAB's built-in interpolation
% function.
%
% This function returns the reconstructed signal to the function caller.

Reconstructed = interp(y, N);   % reconstruct signal using interpolation

end
