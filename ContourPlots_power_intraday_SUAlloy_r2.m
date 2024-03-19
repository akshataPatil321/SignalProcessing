clc 
clear all
close all
%Version	Antenna	Time[GPS Week Secs]	CenterFreq[Hz]	BinSize[KHz]	AvePeriod[S]	2048 avg. points dB w/center Freq at point 1024 (with 2048 optional points afterwards)
% pathName = 'C:\Users\Akshata\Desktop\Research\2023\April29\';
pathName = [pwd '\2023\April28\'];

% % declare constants
DeclareSignalInfoParserConstants;
%%
% T04 dates of interest to download
stations = cell(1, 78);
% stash = [2, 3, 4, 6, 17, 32, 51, 55, 59, 63, 68, 71, 73];
%%
stash = 2;
for i = 1:length(stash)
    j = stash(i);
    stationsID{i} = sprintf("%02d", j);
    fname_temp{i} = ['IN' num2str(stationsID{i}) '-2023-04-28-E6'];
    % fname_temp{i} = ['Singapore-' num2str(stationsID{i})];
end
%%
for idate = 1:length(stash)  
      date_name = fname_temp{idate};      
    try
        eval(['load ' pathName date_name '.txt']);
        newfname = strrep(date_name,'-','_');
        eval(['date_name_mat = ' newfname ';']);
        eval(['clear ' newfname]); 
%         if idate == 1
            InitSignalInfoStruc_params;
%         end
    catch err_msg
        disp(err_msg);
        eval(['!rename ' date_name '.txt ' date_name '_err.txt'])
        eval('!move IN*.txt \2023\April29\SUAlloyFFTdata\txtFiles\')
        continue
    end
  % Reshape data into 3-D matrix and store info in a structure
    for cF_idx = 1:num_centerFreqs
      % reorg 2-D matrix into 3-D (CenterFrequency X Time X FFT bin)  
        ReshapeAndIndexDataBycenterFreq;
      % Compute Mean and Stddev power Info
        ComputeSignalInfoStatistics;
      % get freq axes
        GetXYAxesForPlots
      % plot power colormap results (time vs freq)
        GenerateAndSaveSignalInfoPlots;
    end
   % save data structure and move to folders
   % SaveAndStoreDataAndPlots;

end
return