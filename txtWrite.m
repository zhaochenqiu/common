function result = txtWrite(data,filename)

%注意精度只有float只是图用着方便，用的时候还是要注意一下

[row column] = size(data);

filestream = fopen(filename,'wt');

for i = 1:row
    for j = 1:column
       
        fprintf(filestream,'%f',data(i,j));
        

            fprintf(filestream,'\t');
        
        
    end
    fprintf(filestream,'\n');
end

fclose(filestream);

result = 0;
