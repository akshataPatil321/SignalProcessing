
i_cF_idx_all = find(date_name_mat(:,CENTER_FREQ_HZ_COL)==centerFreqs_Hz_all(cF_idx));
%i_cF_idx_all = find(date_name_mat(:,CENTER_FREQ_HZ_COL)==centerFreqs_Hz_all(cF_idx) & ...
%                          date_name_mat(:,BINSIZE_KHZ_COL)~=12.207);
%i_cF_idx_all_valid = i_cF_idx_all_valid;
Signal_info_full.timeSecOfWeek(cF_idx,:) = date_name_mat(i_cF_idx_all,3)';
i_notNaN = find(~isnan(Signal_info_full.timeSecOfWeek(cF_idx,:)));
i_rollover = find(diff(Signal_info_full.timeSecOfWeek(cF_idx,i_notNaN))<0);
Signal_info_full.timeSecOfWeek(cF_idx,i_notNaN(i_rollover)) = Signal_info_full.timeSecOfWeek(cF_idx,i_notNaN(i_rollover))-SECONDS_PER_WEEK;
Signal_info_full.data_reshaped_main(cF_idx,1:TIME_INCR_PER_DAY,:) = reshape(date_name_mat(i_cF_idx_all,DATA_DB_MAIN_COLS),[1 size(date_name_mat(i_cF_idx_all,DATA_DB_MAIN_COLS))]);
Signal_info_full.data_reshaped_all(cF_idx,1:TIME_INCR_PER_DAY,:) = reshape(date_name_mat(i_cF_idx_all,DATA_DB_ALL_COLS),[1 size(date_name_mat(i_cF_idx_all,DATA_DB_ALL_COLS))]);
Signal_info_full.binsize_Hz(cF_idx) = BINSIZE_HZ; % date_name_mat(cF_idx,BINSIZE_KHZ_COL)*KHZ_TO_HZ;
