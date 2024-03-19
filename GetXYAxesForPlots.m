
centerFreq_temp = centerFreqs_Hz_all(cF_idx); 
binSize_temp    = BINSIZE_HZ; %Signal_info_full.binsize_Hz(cF_idx);
ax_a            = (centerFreq_temp-binSize_temp*(DATALEN_MAIN/2-1)):binSize_temp:centerFreq_temp;
ax_b_main       = (centerFreq_temp+binSize_temp):binSize_temp:(centerFreq_temp+DATALEN_MAIN/2*binSize_temp); 
ax_b_all        = (centerFreq_temp+binSize_temp):binSize_temp:(centerFreq_temp+(DATALEN_MAIN/2+DATALEN_MAIN)*binSize_temp);
Signal_info_full.freqAxis_MHz_main(cF_idx,:)    = [ax_a ax_b_main]/MHZ_TO_HZ;
Signal_info_full.freqAxis_MHz_all(cF_idx,:)     = [ax_a ax_b_all]/MHZ_TO_HZ;
