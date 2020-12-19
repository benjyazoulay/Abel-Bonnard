library(stringr)
setwd("C:/Users/Benjamin/Downloads") #inscrivez ici votre répertoire de travail
poetes_fr<-read.csv("poetes_fr.csv",encoding = "UTF-8")
poetes_journalistes_fr<-read.csv("poetes_journalistes_fr.csv",encoding = "UTF-8")
poetes_pol_fr<-read.csv("poetes_pol_fr.csv",encoding = "UTF-8")

pp<-rbind(poetes_journalistes_fr,poetes_pol_fr)

poetes_fr$birthdate<-as.character(poetes_fr$birthdate)
poetes_fr$birthdate<-str_extract(poetes_fr$birthdate,"....")
poetes_fr$deathdate<-as.character(poetes_fr$deathdate)
poetes_fr$deathdate<-str_extract(poetes_fr$deathdate,"....")

pp$birthdate<-as.character(pp$birthdate)
pp$birthdate<-str_extract(pp$birthdate,"....")
pp$deathdate<-as.character(pp$deathdate)
pp$deathdate<-str_extract(pp$deathdate,"....")

pp<-pp[!duplicated(pp$item),]
poetes_fr<-poetes_fr[!duplicated(poetes_fr$item),]

ratio<-length(pp$item)/length(poetes_fr$item)

poetes_1800<-poetes_fr[poetes_fr$deathdate>1800 & poetes_fr$deathdate<2000,]
pp_1800<-pp[pp$deathdate>1800 & pp$deathdate<2000,]
ratio_1800<-length(pp_1800$item)/length(poetes_1800$item)

