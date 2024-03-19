centerFreqs_Hz_all = unique(date_name_mat(:,CENTER_FREQ_HZ_COL));
num_centerFreqs = length(centerFreqs_Hz_all);

Signal_info_full.date_time_len = {date_name, [num2str(TIME_INCR_PER_DAY/MINS_PER_HOUR) ' hours']};
Signal_info_full.centerFreqs_MHz_all= centerFreqs_Hz_all'/MHZ_TO_HZ;
Signal_info_full.timeSecOfWeek      = NaN(num_centerFreqs,TIME_INCR_PER_DAY);
Signal_info_full.data_reshaped_main = NaN(num_centerFreqs,TIME_INCR_PER_DAY,DATALEN_MAIN);
Signal_info_full.data_reshaped_all  = NaN(num_centerFreqs,TIME_INCR_PER_DAY,DATALEN_ALL);
Signal_info_full.binsize_Hz         = repmat(BINSIZE_HZ,[1 num_centerFreqs]);
Signal_info_full.freqAxis_MHz_main  = NaN(num_centerFreqs,DATALEN_MAIN);
Signal_info_full.freqAxis_MHz_all   = NaN(num_centerFreqs,DATALEN_ALL);
Signal_info_full.mean_Power_dB_main     = NaN(num_centerFreqs,DATALEN_MAIN);
Signal_info_full.stddev_Power_dB_main   = NaN(num_centerFreqs,DATALEN_MAIN);
Signal_info_full.mean_Power_dB_all      = NaN(num_centerFreqs,DATALEN_ALL);
Signal_info_full.stddev_Power_dB_all    = NaN(num_centerFreqs,DATALEN_ALL);
