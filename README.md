# DecryptHash
Hello welcome!!!

I will give a brief explanation about the repository scripts. Making it clear that they only work in Linux environments

# decrypt.py
Give permission for the script: **chmod +x decrypt.py**
After that, in the first option paste the path of the desired wordList
In the second option put the hash (in **crypt format**) like for example: **$1$etNnh7FA$OlM7eljE/B7F1J4XYNnk81**
In the example above we code in **MD5**
After entering the desired information, wait until the entire process is completed, if 
it finds the password it will inform it on the screen, if not it will show a warning stating that it was not possible to find the password


# decryptHash_v2.sh
Give permission for the script: **chmod +x decryptHash_v2.sh**
Script made in bash script, it will ask for some information, such as:
- WordList;
- Full hash;
- Type Hash;<br><br>
However, if you do not define a wordList, it will use the default that is in the repository folder ""WordLists\10M_password.txt",
I ask to put outside the folder on the same level as the script so that it works correctly!
When all information is entered correctly, wait until the entire process is completed! 
