    eval(['save ' date_name ' Signal_info_full']);
    zip([date_name(16:end) '_SUAlloyFFTdataNplots'],{[date_name '.mat'],'*.fig'});
    %eval(['!del ' date_name '*.mat'])
    eval('!move *.mat 2023/April29/SUAlloyFFTdata')
    eval('!move *.zip 2023/April29/SUAlloyFFTdata/Zipped/')
    eval('!move IN*.txt 2023/April29/SUAlloyFFTdata/txtFiles/')
    eval('!move fc*.fig 2023/April29/SUAlloyFFTdata/Figs/')
