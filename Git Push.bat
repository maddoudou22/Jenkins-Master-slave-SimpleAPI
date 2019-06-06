
echo off

SET nom_Projet_Git=Jenkins-Master-slave-SimpleAPI
SET URL_Projet_Git=https://github.com/maddoudou22/Jenkins-Master-slave-SimpleAPI.git
SET Repertoire_Local_Projet=C:\awsLambda\java\Jenkins-Master-slave-SimpleAPI

cd %Repertoire_Local_Projet%

echo "Git Add ..."
git add -A

echo "Git Commit ..."
git commit -m "latest push from windows"

echo "Git Push ..."
git push %URL_Projet_Git%

