    clc
  % PlotResults
    fignum = 1000+cF_idx;
    figure(fignum); clf;
    set(gcf,'Position',[179.4000 510.6000 919.6000 300])
    colormap(gcf,'jet');
    % contour plot (2-D)
    subplot(1,2,1); cla
    [cc_contour, hh_contour] = contourf(Signal_info_full.freqAxis_MHz_all(cF_idx,:),Signal_info_full.timeSecOfWeek(cF_idx,:),date_name_mat(i_cF_idx_all,DATA_DB_ALL_COLS)); colorbar
    set(hh_contour, 'edgecolor','none');
    set(gca, 'YTickLabel',get(gca,'YTick'))
    xlabel('Frequency (MHz)'); ylabel('GPS Time (Second of Week)'); %title('L1 band Power (dB)')
    title(['f_c = ' num2str(Signal_info_full.centerFreqs_MHz_all(cF_idx)) ' MHz (' date_name(16:end) ')']);
  % only plot the "main" signal band (ifnore optional additional higher frequencies
    axis([Signal_info_full.freqAxis_MHz_main(cF_idx,1)-1e-1 Signal_info_full.freqAxis_MHz_main(cF_idx,end)+1e-1 Signal_info_full.timeSecOfWeek(cF_idx,1)-1e2 Signal_info_full.timeSecOfWeek(cF_idx,end)+1e2])
    %axis([Signal_info_full.freqAxis_MHz_all(cF_idx,1)-1e-1 Signal_info_full.freqAxis_MHz_all(cF_idx,end)+1e-1 Signal_info_full.timeSecOfWeek(cF_idx,1)-1e2 Signal_info_full.timeSecOfWeek(cF_idx,end)+1e2])
    set(gca,'CLim',[32.5 38]);
    %%
    % surface plot (3-D)
    subplot(1,2,2); cla
    hh_surf = surf(Signal_info_full.freqAxis_MHz_all(cF_idx,:),Signal_info_full.timeSecOfWeek(cF_idx,:),date_name_mat(i_cF_idx_all,DATA_DB_ALL_COLS)); grid on; colorbar
    set(hh_surf,'edgecolor','none'); set(gca,'CLim',[20 50]);
    set(gca, 'YTickLabel',get(gca,'YTick'))
    xlabel('Frequency (MHz)'); ylabel('Time (Sec of Week)'); zlabel('Mean Power (dB)')
    title(['f_c = ' num2str(Signal_info_full.centerFreqs_MHz_all(cF_idx)) ' MHz (' date_name(16:end) ')']);
  % only plot the "main" signal band (ifnore optional additional higher frequencies
    axis([Signal_info_full.freqAxis_MHz_main(cF_idx,1)-1e-1 Signal_info_full.freqAxis_MHz_main(cF_idx,end)+1e-1 Signal_info_full.timeSecOfWeek(cF_idx,1)-1e2 Signal_info_full.timeSecOfWeek(cF_idx,end)+1e2])
    set(gca,'CLim',[34 36.75]);
    %set(gca,'CLim',[20 70]);

    % figname_temp = strrep([num2str(Signal_info_full.centerFreqs_MHz_all(cF_idx)) 'MHz' date_name(15:end)], '.', 'p');
    % saveas(fignum,['fc' date_name],'fig');
