# Script to convert evaluation triples to numeric form
# Usage: python numberify.py <userfile> <songfile> <infile> <outfile>

#Bita# import sys

#Bita# userfile, songfile, infile, outfile = sys.argv[1:]
userfile = 'kaggle_users.txt';#Bita#
songfile = 'kaggle_songs.txt';#Bita#
infile = 'train_triplets.txt';#Bita#
outfile = 'train_triplets_numerified.csv';#Bita#

users = {}
for n, line in enumerate(open(userfile), start=1):
  users[line.strip()] = n

songs = {}
for line in open(songfile):
  song, n = line.split()
  songs[song] = n

with open(outfile, 'wb') as out:
  out.write('user,song,count\n')
  for line in open(infile):
    user, song, count = line.split()
    out.write('%d,%s,%s\n' % (users[user], songs[song], count))