function copy_files_func(PATH_DEST)
DIR = dir;
PATH = pwd;
for n=1:length(DIR)
  if DIR(n).isdir
      if strcmp(DIR(n).name,'.')||strcmp(DIR(n).name,'..')
      else
          % RECURSIVE CALL
          PATH_IN = [PATH '\' DIR(n).name];
          cd(PATH_IN);
          copy_files_func(PATH_DEST);
          cd(PATH);
      end
  else
      % copy to PATH_DEST
      eval(['!copy ',PATH,'\',DIR(n).name,' ',PATH_DEST])
  end
end
