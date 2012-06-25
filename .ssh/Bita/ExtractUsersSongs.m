ftriplets = fopen('train_triplets.txt','r');
fusers = fopen('train_users.txt','w+');
fsongs = fopen('train_songs.txt','w+');
ntriplets = 0;
nusers = 0;
nsongs = 0;
tline = fgetl(ftriplets);
while ischar(tline)
    ntriplets = ntriplets+1
    new_user = tline(1:40);
    old_users = fread(fusers,'*char');
    userIDlen = 40;
    user_loc = strfind(old_users',new_user);
    if isempty(user_loc)
        nusers = nusers + 1;
        tmpStr = [new_user ' ' num2str(nusers) '\n'];
        fprintf(fusers,tmpStr);
    end
    frewind(fusers)
    
    new_song = tline(42:59);
    old_songs = fread(fsongs,'*char');
    songIDlen = 18;
    song_loc = strfind(old_songs',new_song);
    if isempty(song_loc)
        nsongs = nsongs + 1;
        tmpStr = [new_song ' ' num2str(nsongs) '\n'];
        fprintf(fsongs,tmpStr);
    end
    frewind(fsongs)
    tline = fgetl(ftriplets);
end

fclose(ftriplets);
fclose(fusers);
fclose(fsongs);