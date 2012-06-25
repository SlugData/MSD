function tripletstomatrix
ftriplets = fopen('kaggle_triplets_numerified.csv','r');
fseek(ftriplets,15,'bof');
historyM = fscanf(ftriplets, ['%d,%d,%d'],[3 inf]);
fclose(ftriplets);
historyM = historyM';

% historyM = zeros(1500000,3);%user, song, count, familiarity, artist hotness, song hotness
% ntriplets = 0;
% tline = fgetl(ftriplets);
% tline = fgetl(ftriplets);
% while ischar(tline)
%     ntriplets = ntriplets+1;
%     historyM(ntriplets,:) = str2num(tline);
% %     disp(tline);
%     tline = fgetl(ftriplets);
% end
% 
% fclose(ftriplets);

% historyM = [historyM(1:ntriplets,:) zeros(ntriplets,3)];
 
save 'historyM.mat' historyM