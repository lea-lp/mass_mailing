# Envoi d'emails 

> Programming w/ @Debzow, @SAMTHP, @Javi & @LeaLp

**Après téléchargement du repo, lancer** ```bundle install```


## Résumé du projet
- scrapper tous les emails de mairies de 3 départements, enregistrer le tout dans un json. 
- enregistrer les données du json dans dans un spreadsheet
- envoyer un email à toutes les mairies et en CCi à THP en se basant sur le spreadsheet
- relance les mairies sur Twitter en les "followant"

## Résumé des fichiers
app.rb => ```Class.new.perform``` (de toutes les CLASSES)

### Dossier 'app'
- **townhalls_scrapper.rb** => ```class TownhallsScrapper``` *(scrapper les données de mairies et les stocker dans 'hash_townhalls')* 
- **townhalls_adder_to_db.rb** => ```class TownhallsAdderToDb``` *(stocker et récupérer les données dans un json)*
- **townhalls_spreadsheet.rb** => ```class TownhallsSpreadsheet``` *(stocker et récupérer les données dans un spreadsheet)*
- **townhalls_mailer.rb** => ```class TownhallsMailer``` *(envoyer les emails à partir du spreadsheet)*
- **townhalls_follower.rb** => ```class TownhallsFollower``` *(en entrée : les données du hash_townhalls -fournies par la ```class TownhallsAdderToDb```-, récupèration des handles et les stocker dans un hash)*

### Dossier 'views'
done.rb => ```class Done```
index.rb => ```class Index```


## IMPORTANT

- Format du hash_townhalls :
```{ ... townhall_name => [townhall_department, townhall_email, townhall_handle] ... }```
- Format du json :
identique au hash_townalls
- Format du spreadsheet :
colone A : townhall_name
colone B : townhall_department
colone C : townhall_email
colone D : townhall_handletwitter



### Appels des fichiers rb
```$:.unshift File.expand_path("./../FOLDER_NAME", __FILE__)```

```require```

