# Scrape die Statistiken der Spielberichte von der Bundesliga Website!

Mit diesem Skript kann man sich die Spielstatistiken in R Scrapen und anschließend in eine .csv oder .xslx ausgeben.

# Was wird benötigt?

1. Installation von [R](https://www.r-project.org/)
2. [R-Studio](https://posit.co/download/rstudio-desktop/)
3. Die entsprechenden R-Packages: rvest und dplyr

# Wie benutze ich das Skript?

Kopiere den Link vom Spielbericht der **englischen** Bundeliga-webseite und füge den bei *link* zwische den " " ein.
Die Daten werden dann anschließend als Dataframe ausgegeben.
Es wird die englisch-sprachige Seite benutzt, da auf der deutsch-sprachigen Seite xGoals mit dem Seperator "," beschrieben wird und dadurch Fehler entstehen können.



