
% compute mean and stddev of power
Signal_info_full.mean_Power_dB_main(cF_idx,:)	= mean(squeeze(Signal_info_full.data_reshaped_main(cF_idx,:,:)),1,'omitnan');
Signal_info_full.stddev_Power_dB_main(cF_idx,:) = std(squeeze(Signal_info_full.data_reshaped_main(cF_idx,:,:)),0,1,'omitnan');
Signal_info_full.mean_Power_dB_all(cF_idx,:)    = mean(squeeze(Signal_info_full.data_reshaped_all(cF_idx,:,:)),1,'omitnan');
Signal_info_full.stddev_Power_dB_all(cF_idx,:)  = std(squeeze(Signal_info_full.data_reshaped_all(cF_idx,:,:)),0,1,'omitnan');

