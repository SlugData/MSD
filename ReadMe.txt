1. copy_files.m copies all the *.h5 files from the MillionSongSubset\Data into another folder (PATH_DEST = MSS_files), no subfolders anymore.

2. ExtractUsersSongs.m reads the train_triplet.txt and generates users.txt and songs.txt (a list of the the user IDs and song IDs appeared in train_triplet.

3. use numerify.py (got from github) to make a numerified version of the train_triplets.

4. Triplets2Matrix.m makes a matrix out of the numerified triplets file, so that it is easier to work with in MATLAB.

5. MapFeatures2Songs.m reads the features of each song from the (MSS_files\*.h5), and add the features to the triplets matrix, so each row in the result matrix (saved in historyfeaturesM.mat) contains user#, song#, count, familiarity, artist hotness, song hotness.


