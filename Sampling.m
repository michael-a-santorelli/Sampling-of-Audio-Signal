%% Sampling

%   set downsampling factor
N = 2;

%   obtain downsampled audio signal
[Original, Fs, DownSampled] = DownSample('test.wav', 'output.wav', N, 0);
%   reconstruct audio signal
Reconstructed(:,1) = Interpolation(DownSampled(:,1), N);
Reconstructed(:,2) = Interpolation(DownSampled(:,2), N);

%   obtain frequency, time-frequency, and power spectrums using
%   fft, spectrogram (STFT), and pspectrum for original signal
OriginalFreq = abs(fft(Original));
SpectrogramOriginal1 = spectrogram(Original(:,1));
SpectrogramOriginal2 = spectrogram(Original(:,2));
SpectrogramOriginal = abs([SpectrogramOriginal1 SpectrogramOriginal2]);
PowerSpectrumOriginal = pspectrum(Original);
%   obtain frequency, time-frequency, and power spectrums using
%   fft, spectrogram (STFT), and pspectrum for downsampled signal
DownSampledFreq = abs(fft(DownSampled));
SpectrogramDownSampled1 = spectrogram(DownSampled(:,1));
SpectrogramDownSampled2 = spectrogram(DownSampled(:,2));
SpectrogramDownSampled = abs([SpectrogramDownSampled1 SpectrogramDownSampled2]);
PowerSpectrumDownSampled = pspectrum(DownSampled);
%   obtain frequency, time-frequency, and power spectrums using
%   fft, spectrogram (STFT), and pspectrum for reconstructed signal
ReconstructedFreq = abs(fft(Reconstructed));
SpectrogramReconstructed1 = spectrogram(Reconstructed(:,1));
SpectrogramReconstructed2 = spectrogram(Reconstructed(:,2));
SpectrogramReconstructed = abs([SpectrogramReconstructed1 SpectrogramReconstructed2]);
PowerSpectrumReconstructed = pspectrum(Reconstructed);

%   plot fft spectrums - original vs. downsampled
subplot(2,1,1)
hold on
plot(OriginalFreq)
plot(DownSampledFreq)
title('Frequency Spectrum - Orignal vs. DownSampled', 'FontWeight', 'Normal')
xlabel('Frequency')
ylabel('Magnitude')
legend('Original Audio Signal Channel 1', 'Original Audio Signal Channel 2', 'DownSampled Audio Signal Channel 1', 'DownSampled Audio Signal Channel 2')
hold off
%   plot fft spectrums - original vs. reconstructed
subplot(2,1,2)
hold on
plot(OriginalFreq)
plot(ReconstructedFreq)
title('Frequency Spectrum - Orignal vs. Reconstructed', 'FontWeight', 'Normal')
xlabel('Frequency')
ylabel('Magnitude')
legend('Original Audio Signal Channel 1', 'Original Audio Signal Channel 2', 'Reconstructed Audio Signal Channel 1', 'Reconstructed Audio Signal Channel 2')
hold off
%   surface plot STFT of original audio signal
figure
surf(SpectrogramOriginal)
title('STFT of Original Audio Signal', 'FontWeight', 'Normal')
xlabel('Time')
ylabel('Frequency')
zlabel('Magnitude')
%   surface plot STFT of downsampled audio signal
figure
surf(SpectrogramDownSampled)
title('STFT of DownSampled Audio Signal', 'FontWeight', 'Normal')
xlabel('Time')
ylabel('Frequency')
zlabel('Magnitude')
%   surface plot STFT of reconstructed audio signal
figure
surf(SpectrogramReconstructed)
title('STFT of Reconstructed Audio Signal', 'FontWeight', 'Normal')
xlabel('Time')
ylabel('Frequency')
zlabel('Magnitude')
%   plot power spectrums - original vs. downsampled
figure
subplot(2,1,1)
hold on
plot(PowerSpectrumOriginal)
plot(PowerSpectrumDownSampled)
title('Power Spectrum - Orignal vs. DownSampled', 'FontWeight', 'Normal')
xlabel('Frequency')
ylabel('Magnitude')
axis([0 1500 0 3.0*10^-3])
legend('Original Audio Signal Channel 1', 'Original Audio Signal Channel 2', 'DownSampled Audio Signal Channel 1', 'DownSampled Audio Signal Channel 2')
hold off
%   plot power spectrums - original vs. reconstructed
subplot(2,1,2)
hold on
plot(PowerSpectrumOriginal)
plot(PowerSpectrumReconstructed)
title('Power Spectrum - Orignal vs. Reconstructed', 'FontWeight', 'Normal')
axis([0 2500 0 6*10^-4])
xlabel('Frequency')
ylabel('Magnitude')
axis([0 1500 0 3.0*10^-3])
legend('Original Audio Signal Channel 1', 'Original Audio Signal Channel 2', 'Reconstructed Audio Signal Channel 1', 'Reconstructed Audio Signal Channel 2')
hold off

% play audio of original/downsampled/reconstructed signal
% sound(Original, Fs)
% sound(DownSampled, Fs/N)
% sound(Reconstructed, Fs)
