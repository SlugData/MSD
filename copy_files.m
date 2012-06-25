PATH_ROOT = 'D:\Bita\Kaggle_Tecent';
PATH_FUNC = [PATH_ROOT '\Reading'];
addpath(PATH_FUNC);
PATH_DEST = [PATH_FUNC '\MSS_FILES'];
PATH_DATA = [PATH_ROOT '\MillionSongSubset\data'];
cd(PATH_DATA)
copy_files_func(PATH_DEST);
cd(PATH_FUNC);
