import os 
import time
import settings as S

appinfo = r'C:\Program Files (x86)\Steam\appcache\appinfo.vdf'

dirname = S.Dir.dirname('')
Steam86 = r'C:\Program Files (x86)\Steam\config\libraryfolders.vdf'
Steam64 = r'C:\Program Files\Steam\config\libraryfolders.vdf'
SteamNA = os.path.join(dirname, 'libraryfolders.vdf')

class Libs:
	def __init__(self, filename):
		self.filename = filename
		self.path = os.path.join(dirname, filename)	

def test():
	if exists(Steam86):
		return Steam86
	elif exists(Steam64):
		return Steam64
	elif exists(SteamNA):
		return SteamNA
	else:
		return False

def read(library):
	with open(library, 'r+') as f:
		lines = f.readlines()
		ar = []
		locations = []
		for line in lines:
			ar = line.split("\"")
			try:
				if ar[1] == "path":
					#print(ar[3])
					locations.append(ar[3])
			except:
				continue
	return locations


def clean(array):
	x = 0
	for i in array:
		array[x] = f"{i}\\steamapps\\common\\"
		array[x] = array[x].replace("\\\\", "\\")
		x += 1
	return array


def loopfolders(directories):
	for i in directories:
		
		games = []
		for filename in os.listdir(directories):
			f = os.path.join(directories, filename)
			# checking if it is a file
			if os.path.isfile(f):
				print(f)
				games.append(f)

def exists(file):
	return os.path.exists(file)

def check_path(directory): 
	try:
		library = test()
		return library
	except:
		print('\n\nno library found\n===>C:\\Program Files (x86)\\Steam\\config\\libraryfolders.vdf\n\nMove this file adjacent to this app and try again.')
		time.sleep(10)
		return False

def grab_paths(library):
  
	locations = read(library)
	dirs = clean(locations)
	print(dirs)
	time.sleep(1)
	return dirs