# Python program to explain os.path.expanduser() method 
    
# importing os.path module 
import os.path
  
  
# Path
path = "~\\Documents\\file.txt"
  
# Expand an initial ~ component
# in the given path
# using os.path.expanduser() method
full_path = os.path.expanduser(path)
  
# print the path after
# expanding the initial ~ component
# in the given path
print(full_path)
