# Laden der benötigten Packages

library(rvest)
library(dplyr)

# Einlesen der Website

link <- " "
website <- read_html(link)

# Scrapen der Statistiken vom eingelesenen Link
# Daten werden mit dem Selectorgadget erkannt

# Holt die meisten Statistiken von der Website, nur die Werte in Prozent werden nicht angegeben.
werte <- website %>% html_nodes(".value") %>% html_text()
werte

# Holt die Namen der beteiligten Mannschafften
name <- website %>% html_nodes(".d-lg-block a") %>% html_text()
name

# Holt die Statistik-Bezeichnungen

werte_name <- website %>% html_nodes(".title") %>% html_text()
werte_name
 
# Holt die restlichen statistiken die von .value nicht erfasst worden sind

werte_rest <- website %>% html_nodes(".text-chart span") %>% html_text()
werte_rest

#Zurzeit fehlt noch der Ballbesitz

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
paesse_heim <- as.integer(werte[13])
paesse_ausw<- as.integer(werte[14])
laufdistanz_heim <- as.double(werte[15])
laufdistanz_ausw <- as.double(werte[16])
sprints_heim <- as.integer(werte[17])
sprints_ausw <- as.integer(werte[18])
gewonnene_zweikämpfe_heim <- as.integer(werte[19])
gewonnene_zweikämpfe_ausw<- as.integer(werte[20])
ecken_heim <- as.integer(werte[21])
ecken_ausw <- as.integer(werte[22])
abseits_heim <- as.integer(werte[23])
abseits_ausw <- as.integer(werte[24])
fouls_heim <- as.integer(werte[25])
fouls_ausw <- as.integer(werte[26])
#ballbesitz_heim <- as.integer(werte_rest[38])
#ballbesitz_ausw <- as.integer(werte_rest[39])
werte_rest <- gsub("%", "", werte_rest)         #entfernen des "%" aus dem Wert um es anschließend in Integer umzuwandeln
passquote_heim <- as.integer(werte_rest[1])
passquote_ausw <- as.integer(werte_rest[3])


# Dataframe erstellen

spielstats <- data.frame( Team = c(team_heim,
                                   team_ausw),
                          Tore = c(goals_heim,
                                   goals_ausw),
                          xG = c(xgoals_heim,
                                 xgoals_ausw),
                          Torschuesse = c(shots_heim,
                                          shots_ausw),
                          #Ballbeseitz = c(ballbesitz_heim,
                          #                ballbesitz_ausw),
                          Pässe = c(paesse_heim,
                                    paesse_ausw),
                          Passquote = c(passquote_heim,
                                        passquote_ausw),
                          Ecken = c(ecken_heim,
                                            ecken_ausw),
                          Laufdistanz = c(laufdistanz_heim,
                                          laufdistanz_ausw),
                          Sprints = c(sprints_heim,
                                      sprints_ausw),
                          Zweikämpfe = c(gewonnene_zweikämpfe_heim,
                                         gewonnene_zweikämpfe_ausw),
                          Zweikampfquote = c((gewonnene_zweikämpfe_heim/(gewonnene_zweikämpfe_heim+gewonnene_zweikämpfe_ausw))*100,
                                             (gewonnene_zweikämpfe_ausw/(gewonnene_zweikämpfe_heim+gewonnene_zweikämpfe_ausw))*100),
                          Abseits = c(abseits_heim,
                                      abseits_ausw),
                          Fouls = c(fouls_heim,
                                    fouls_ausw))

View(spielstats)


