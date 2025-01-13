


pro make_ACCEPT2_fig_set_commands, file_of_names, latex_filename, fignumber

; file_of_names is a text string = a csv file name (but it's just one text name per line
; no header line
; latex_filename is the name of the output file
; have to manually assign a figure number (fignum)

namelist = read_csv(file_of_names, count=nnames, n_table_header=0, type="String")
print,"There are ",nnames," figures in this Figure Set."

fignum=strcompress(string(fignumber),/remove_all)

close,1
openw,1,latex_filename

printf,1,"\figsetstart"
printf,1,"\figsetnum{"+fignum+"}"
printf,1,"\figsettitle{Radial Entropy Profiles and Fits}"


for i=0,nnames-1 do begin
	printf,1,"\figsetgrpstart"
	printf,1,"\figsetgrpnum{"+fignum+"."+strcompress(string(i+1),/REMOVE_ALL)+"}"
	printf,1,"\figsetgrptitle{"+namelist.field1[i]+"}"
	printf,1,"\figsetplot{figures_updated/figures_entropy_corner_plots/"+namelist.field1[1]+"_K0CP.pdf}"
	printf,1,"\figsetplot{figures_updated/figures_entropy_profiles/"+namelist.field1[i]+"_Kprof.pdf}"
	printf,1,"\figsetgrpnote{ACCEPT2.0 Gas Entropy Profiles and Fit Results. The first graph shows the radial profile of gas entropy. $R_{mid}$ is the midpoint of each annulus in kpc. Entropy $kT n_e^{-2/3}$ is derived from the deprojected temperature and electron density. The solid straight red line is the best fit to a simple power law function $K(r)=K_{100,PL} (r/100~\mathrm{kpc})^\alpha_{PL}$. The solid and dashed blue lines are the best fit from least squares and MCMC respectively to the function $K(r)=K+0+(K_{100}-K_0) (r/100~\mathrm{kpc})^\alpha$. The second figures shows the two-dimensional pairwise distributions (corner plots) of $K_0$, $K_{100}$, and $\alpha$, along with the independent distribution of each parameter, plus its median and standard deviation. Table~\ref{tab:K0_table_B} reports the best-fit MCMC parameters defined by the minimized fit statistic and 68th percentile ranges, because not all of the distributions are Gaussian. (Medians and standard deviations are provided here for visual comparisons, not as derivations of the fit parameters.) }"
	printf,1,"\figsetgrpend"
endfor

printf,1,"\figsetend"
close,1

return
end

; Main program

file_of_names ="sharetarlist"
latex_filename=""
;read, "Name of csv file with file names", file_of_names
read, "Name of output latex file: ", latex_filename
read,"Figure number for the Figure set: ", figno

make_ACCEPT2_fig_set_commands, file_of_names, latex_filename, figno


end

	



