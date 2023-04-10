# Laden der benötigten Packages

library(rvest)
library(dplyr)

# Einlesen der Website

link <- "https://www.bundesliga.com/en/2bundesliga/matchday/2022-2023/26/fortuna-duesseldorf-vs-hamburger-sv/stats"
website <- read_html(link)

# Scrapen der Statistiken vom eingelesenen Link
# Daten werden mit dem Selectorgadget erkannt

# Holt die meisten Statistiken von der Website, nur die Werte in Prozent werden nicht angegeben.
werte <- website %>% html_nodes(".value") %>% html_text()
werte

# Holt die Namen der beteiligten Mannschafften
name <- website %>% html_nodes(".d-lg-block a") %>% html_text()
name

# Holt die restlichen statistiken die von .value nicht erfasst worden sind

werte_rest <- website %>% html_nodes("span") %>% html_text()
werte_rest

# Zuweisung der einzelnen Variablen

team_heim <- name[1]
team_ausw <- name[2]
goals_heim <- as.integer(werte[1])
goals_ausw <- as.integer(werte[4])
xgoals_heim <- as.double(werte[2])
xgoals_ausw <- as.double(werte[3])
shots_off_target_heim <- as.integer(werte[5])
shots_on_target_heim <- as.integer(werte[7])
shots_heim <- shots_off_target+shots_on_target
shots_off_target_ausw <- as.integer(werte[9])
shots_on_target_ausw <- as.integer(werte[11])
shots_ausw <- shots_off_target_ausw + shots_on_target_ausw
