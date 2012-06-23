function MapFeatures2Songs

load historyM.mat
fsongs = fopen('kaggle_songs.txt','r');

PATH = pwd;
song_folder = uigetdir(PATH,' Enter the path to MillionSongDataset files');
song_list=dir([song_folder '\*.h5']);
numofsongs=length(song_list);

historyM = [historyM zeros(size(historyM))];
 
kk=0;
for ii=1:numofsongs
    ii
    kk
    song_name = song_list(ii).name;
    h5 = HDF5_Song_File_Reader([song_folder '\' song_name]);
    songID = h5.get_song_id();
    song_number = find_in_file(fsongs,songID);
    if song_number~=0
        kk=kk+1;
    end
%     disp(songID);
    familiarity = h5.get_artist_familiarity();
    a_hotness = h5.get_artist_hotttnesss();
    s_hotness = h5.get_song_hotttnesss();
    historyM(find(historyM(:,2)==song_number),4) = familiarity;
    historyM(find(historyM(:,2)==song_number),5) = a_hotness;
    historyM(find(historyM(:,2)==song_number),6) = s_hotness;
    sim_artist = h5.get_similar_artists();
    clear 'h5';
end
fclose(fsongs);
save 'historyfeaturesM.mat' historyM






