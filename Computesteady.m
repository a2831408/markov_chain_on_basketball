function Computesteady(Transfile, outputfile)


finput = fopen(Transfile,'r');
if finput<0, error('Can''t open the transition file "%s"', Transfile); end
Trans = [];

while ~feof(finput)
    Trans = [Trans;str2num(fgetl(finput))];
end
fclose(finput);
steadystate = steadyfun(Trans);

foutput = fopen(outputfile,'w');
if foutput<0, error('Can''t open the output file "%s"', Transfile); end
fprintf(foutput, '%.6f ', steadystate);
fprintf(foutput, '\n');
fclose(foutput);

end