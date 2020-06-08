function MainProgram(inputfile, outputfile, n)

if nargin<1, inputfile = 'input.txt'; end
if nargin<2, outputfile = 'output.txt'; end
if nargin<3, n = 1;end


finput = fopen(inputfile,'r');
if finput<0, error('Can''t open the input file "%s"', intputfile); end
data = [];

while ~feof(finput)
    data = [data str2num(fgetl(finput))];
end
fclose(finput);

Trans = ComputeTransition(data,n);
foutput = fopen(outputfile,'w');
if foutput<0, error('Can''t open the output file "%s"', outputfile); end
for i = 1:2^n
    fprintf(foutput, '%.6f ',Trans(i,:));
    fprintf(foutput, '\n');
end
fclose(foutput);
end
