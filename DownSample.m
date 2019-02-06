function [ y, Fs, DownSampled ] = DownSample(inFile, outFile, N, pf)

[y, Fs] = audioread(inFile);       %read audiofile
% separate input into its 2 channels
y1 = y(:, 1);
y2 = y(:, 2);

if(pf == 0)     % if pf flag is 0 do not use pre-filter
    DownSampled = downsample(y, N);     
else        % if pf flag is 1 not use pre-filter
    DownSampled(:,1) = decimate(y1, N);
    DownSampled(:,2) = decimate(y2, N);
end

%   play downsampled audio
% sound(DownSampled, Fs/N)
%   save downsampled audio to file
% audiowrite(outFile, DownSampled, Fs/N)

end

