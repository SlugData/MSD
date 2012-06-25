function song_n=find_in_file(fid,word)
f_text = fread(fid,'*char');
songIDlen = 18;
word_loc = strfind(f_text',word);
if isempty(word_loc)
    song_n = 0;
else
    jj=1;
    line(jj) = f_text(word_loc+songIDlen+jj);
    while str2double(line(jj))<10
        jj=jj+1;
        line(jj) = f_text(word_loc+songIDlen+jj);
    end
    song_n = str2double(line);
end
frewind(fid)

