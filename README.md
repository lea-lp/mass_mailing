# Envoi d'emails 

> Programming w/ @Debzow, @SAMTHP, @Javi & @LeaLp

**Après téléchargement du repo, lancer** ```bundle install```


 - les fichiers contenant id et mots de passe sont absents pour des raisons de sécurité
 - le dossier ```views``` n'est pas complété


## Résumé du projet
- scrapper tous les emails de mairies de 3 départements, enregistrer le tout dans un JSON 
- enregistrer les données du JSON dans dans un spreadsheet
- envoyer un email à toutes les mairies et en CCi à THP en se basant sur le spreadsheet
- relance des mairies sur Twitter en les "followant"

## Résumé des fichiers
app.rb => ```Class.new.perform``` (de toutes les CLASSES)

### Dossier 'app'
- **townhalls_scrapper.rb** => ```class TownhallsScrapper``` *(scrapper les données de mairies et les stocker dans 'hash_townhalls')* 
- **townhalls_adder_to_db.rb** => ```class TownhallsAdderToDb``` *(stocker et récupérer les données dans un json)*
- **townhalls_spreadsheet.rb** => ```class TownhallsSpreadsheet``` *(stocker et récupérer les données dans un spreadsheet)*
- **townhalls_mailer.rb** => ```class TownhallsMailer``` *(envoyer les emails à partir du spreadsheet)*
- **townhalls_follower.rb** => ```class TownhallsFollower``` *(en entrée : les données du hash_townhalls -fournies par la ```class TownhallsAdderToDb```-, récuperation des handles et les stocker dans un hash)*
