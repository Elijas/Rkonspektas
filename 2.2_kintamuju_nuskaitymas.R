
#
#   Dalykas: STATISTINĖS DUOMENŲ ANALIZĖS SISTEMA IR PROGRAMAVIMO KALBA R
#            Įvairūs kintamųjų iš teksto nuskaitymo būdai.
#
#  Autorius: Tomas Rekašius
#
#   Sukurta: 2013-07-08 | 2013-07-12
#


# TURINYS -------------------------------

#
#   1. Duomenų įvedimas iš klaviatūros:
#      * komanda c
#      * procedūra scan
#
#   2. Duomenų importavimas kopijuojant:
#      * komanda clipboard
#      * procedūra readClipboard
#
#   3. Duomenų nuskaitymas iš teksto:
#      * parametras text
#      * funkcija textConnection
#


# PASTABOS ------------------------------

#
# Kol kas pastabų nėra.
# 


# NUSTATYMAI ----------------------------

# Nustatoma lietuviška lokalė. 
Sys.setlocale(locale = "Lithuanian")

# Nustatomas darbinis katalogas.
setwd("C:/Downloads")

# Ištrinami visi seni kintamieji.
rm(list = ls())


# --------------------------------------- #
# DUOMENŲ ĮVEDIMAS IŠ KLAVIATŪROS         #
# --------------------------------------- #

# Tiesiai iš klaviatūros įvedami nedideli duomenų rinkiniai. Paprastai tai yra
# keletą elementų turintis vektorius, kuris sudaromas naudojant komanda c.

x <- c(2, 3, 5, 7, 11, 13, 17, 19)


# Toks būdas paprastas ir labai dažnai naudojamas, tačiau dėl įvairių priežasčių 
# netinka dideliems duomenų masyvams. Kartais pasitaiko situacija, kai vektoriaus 
# reikšmės įvedamos tiesiai iš klaviatūros. Tada galima panaudoti procedūrą scan. 

x <- scan() 

# Vektorių sudarantys elementai rašomi konsolėje ir įvedami paspaudžiant klavišą 
# Enter. Į vieną eilutę galima surašyti kelis tarpu atskirtus elementus. Reikšmių 
# įvedimas nutraukiamas klavišą Enter paspaudus du kartus iš eilės. 

x


# Pačiu paprasčiausiu atveju taip galima įvesti tik iš skaičių sudarytą vektorių. 
# Norint įvesti kitokio tipo reikšmes, riboti jų skaičių ar pan., reikia pakeisti 
# tam tikrus procedūros scan parametrus. Kai kurie iš jų:
#
#    what -- vektoriaus reikšmių tipas: numeric(), character() ir kiti,
#     sep -- vektoriaus elementus atskiriantis simbolis, pagal nutylėjimą tarpas,
#       n -- maksimalus vektoriaus elementų skaičius.

# Pavyzdžiui, simbolinių reikšmių įvedimui iš klaviatūros, parametro what reikšmę
# pakeičiame į character(). Jei vektoriaus reikšmes sudaro atskiri simboliai arba 
# žodžiai, įvedinėjant juos galima rašyti be kabučių.

x <- scan(what = character())
x


# UŽDUOTIS ------------------------------ 

# 1. Naudodami procedūrą scan, užrašykite komandą, kuri iš klaviatūros nuskaitytų 
#    simbolių eilutę R-E-S-P-U-B-L-I-K-A. Turite gauti vektorių iš 10 raidžių.
# 2. Anksčiau užrašytą komandą pakeiskite taip, kad būtų nuskaitomos tik pirmos
#    trys simbolių eilutės raidės.


# --------------------------------------- #
# DUOMENŲ IMPORTAVIMAS KOPIJUOJANT        #
# --------------------------------------- #

# Nedidelį vektorių ar duomenų lentelę galima importuoti copy-paste metodu. Tam
# galima panaudoti procedūrą scan. Vektoriaus sudarymo veiksmų seka yra tokia:
# 
#  -- iš teksto nukopijuojame skaičius ar kitas reikšmes,
#  -- nuskaitymo iš klaviatūros režimu paleidžiame procedūra scan,
#  -- tiesiai į konsolę įkeliame nukopijuotas vektoriaus reikšmes.

# Vektoriaus elementai gali būti surašyti nebūtinai vienoje eilutėje ar viename 
# stulpelyje. Pavyzdžiui, sukursime skaičių vektorių. Pažymėkite žemiau esančius 
# skaičius ir su klavišų kombinacija Ctrl + C nukopijuokite juos. 

# ---
1 2 3
4 5 6
7 8 9
# ---

# Kadangi visi vektoriaus elementai yra skaičiai, papildomų parametrų procedūrai
# nurodyti nereikia.
x <- scan()

# Su klavišų kombinaciją Ctrl + V nukopijuotus skaičius įkelkite tiesiai į konsolę.
# Rezultatas yra vektorius iš 9 elementų.
x


# Nukopijuotas tekstas gali būti interpretuojamas kaip specialaus tipo failas,
# kurio vardas yra "clipboard". Jį galima nurodyti bet kuriai duomenų nuskaitymo 
# procedūrai, kuri gali nuskaityti duomenis iš failo pvz., scan arba read.table.

# Pavyzdžiui, tą patį skaičių vektorių galima gauti naudojant tokią komandą.
x <- scan(file = "clipboard")
x


# Tokiu būdu galima nuskaityti ir nedideles duomenų lenteles. Nukopijuokite šią
# lentelę su dviem kintamaisiais X ir Y.

# ---
X    Y
15,2 Vyras
41,5 Vyras
32,7 Moteris
28,1 Vyras
19,9 Moteris
# ---

# Kadangi pirmoje duomenų eilutėje surašyti kintamųjų vardai, o trupmeninė dalis
# skiriama kableliu, tą reikia papildomai nurodyti procedūrai.
d <- read.table(file = "clipboard", header = TRUE, dec = ",")
d


# NAUDINGA ------------------------------

# Nukopijuoto teksto nuskaitymui eilutėmis skirta procedūra readClipboard. Jos 
# rezultatas visada yra character tipo vektorius, kuris turi tiek elementų, kiek 
# eilučių buvo nuskaityta.

# ---
1 2 3
4 5 6
7 8 9
# ---

# Pavyzdžiui, trys skaičių eilutės nuskaitytos su šia procedūra bus apjungtos į
# vektorių iš trijų elementų: "1 2 3", "4 6 5" ir "7 8 9". Dėl tos priežasties
# ši procedūra tinka tik tekstiniams duomenims nuskaityti.

x <- readClipboard()
x


# UŽDUOTIS ------------------------------ 

# 1. Naudodami procedūrą scan ir komandą "clipboard", kopijavimo metodu sukurkite 
#    vektorių iš 3 žodžių JUODA PILKA BALTA. Kaip reikėtų surašyti tuos žodžius,
#    kad tokį pat vektorių būtų galima gauti su procedūra readClipboard?
# 2. Koks būtų rezultatas, jei lentelės importavimo komandoje nebūtų nurodyta, 
#    kad kablelis skiria trupmeninę dalį?


# --------------------------------------- #
# DUOMENŲ NUSKAITYMAS IŠ TEKSTO           #
# --------------------------------------- #

# Duomenų iš tekstinio failo nuskaitymui skirtos procedūros gali būti panaudotos
# character tipo vektorių nuskaitymui. Tai reiškia, kad nedidelius vektorius ar 
# duomenų lenteles galima užrašyti kaip paprastą tekstą tiesiai programos tekste, 
# o vėliau juos nuskaityti. Procedūrai scan arba read.table vektorių, kurį reikia
# nuskaityti, nurodome per parametrą text.

# Pavyzdžiui, nuskaitysime skaičių vektorių, kuris užrašytas kaip simbolių seka.
v <- "1 2 3"

# Vektoriaus nuskaitymui naudojame įprastą procedūrą scan su parametru text.
x <- scan(text = v)
x

# Jei nuskaitomas vektorius sudarytas ne iš skaičių, procedūrai reikia nurodyti 
# elementų tipą, šiuo atveju elementai yra character tipo.
v <- "a b c"

x <- scan(text = v, what = character())
x

# Duomenų lentelę užrašyti kaip vektorių galima panaudojant specialius simbolius: 
# \n reiškia perkėlimą į kitą eilutę, \t reiškia tabuliacijos ženklą. Pavyzdžiui, 
# užrašysime kaip vektorių tokią lentelę:
#
#   X  Y
#   11 12
#   21 22

l <- "X Y\n 11 12\n 21 22"

# Pirmoje šios duomenų lentelės eilutėje surašyti stulpelių pavadinimai, todėl 
# parametro header reikšmę pakeičiame į TRUE.
d <- read.table(text = l, header = TRUE)
d

# Teksto eilute užrašytą lentelę galima įrašyti tiesiai į nuskaitymo komandą.
d <- read.table(text = "X Y\n 11 12\n 21 22", header = TRUE)
d


# Didesnę lentelę patogiau užrašyti taip, kaip ji atrodo, o ne viena eilute.
l <- "X  Y  Z
      11 12 13
      21 22 23
      31 32 33"

d <- read.table(text = l, header = TRUE)
d

# Tokiu pavidalu užrašytą lentelę taip pat galima įrašyti į nuskaitymo komandą.
d <- read.table(header = TRUE, text = "
X  Y  Z
11 12 13
21 22 23
31 32 33
")

d


# UŽDUOTIS ------------------------------ 

# 1. Naudodami procedūrą scan, nuskaitykite kaip simbolių vektorių užrašytą datą 
#    "2013-07-11". Rezultatas turi būti 3 elementus turintis skaičių vektorius: 
#    metai, mėnuo ir diena.
# 2. Datos nuskaitymo komandą pakeiskite taip, kad būtų nuskaitomas tik metus 
#    reiškiantis skaičius.
# 3. Užrašykite lentelės "X Y\n 11 12\n 21 22" nuskaitymo komandą, kuri pakeistų
#    kintamųjų vardus į A ir B.


# R procedūros gali nuskaityti duomenis iš labai įvairių šaltinių (connections). 
# Duomenims užrašyti naudojami tekstiniai failai -- tik vienas iš tokių šaltinių.
# Kitas šaltinis yra jau anksčiau naudotas clipboard. 

# Naudojant funkciją textConnection teksto bloką galima paversti į dar vieno tipo 
# šaltinį, su kuriuo tokios procedūros kaip scan ar read.table elgiasi kaip su
# tekstiniu failu.

# Pavyzdžiui, nuskaitysime kaip simbolių eilutę užrašytą skaičių seką.
v <- "1 2 3"

# Iš pradžių character tipo vektorių paverčiame į šaltinį, o tada jį nuskaitome 
# kaip paprastą tekstinį failą.
t <- textConnection(v)
x <- scan(file = t)
x

# Patogumo dėlei visas komandas galima apjungti į vieną.
x <- scan(textConnection("1 2 3"))
x

# Tokiu būdu kaip failą galima nuskaityti ir tekste užrašytą duomenų lentelę.

t <- textConnection("
X    Y
15,2 Vyras
41,5 Vyras
32,7 Moteris
28,1 Vyras
19,9 Moteris
")

d <- read.table(file = t, header = TRUE, dec = ",")
d


# NAUDINGA ------------------------------

# Viename duomenų lentelės stulpelyje gali būti keli žodžiai ar skaičiai. Pvz.,
#
#    Valdovas             Metai
#    Vytautas Didysis     1350-1430
#    Žygimantas Augustas  1520-1572
#
# Nuskaitant iš failo tokią duomenų lentelę, žodžiai Vytautas ir Didysis būtų
# skirtinguose stulpeliuose. Kadangi pirmoje eilutėje yra du stulpelių vardai, 
# o stulpelių yra trys, pirmame stulpelyje esantys žodžiai Vytautas ir Žygimantas 
# automatiškai pavirstų į eilučių pavadinimus ir lentelė būtų nuskaitoma blogai.

adresas <- "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_5a.dat"
d <- read.table(file = adresas, header = TRUE)
d

# Kad to neatsitiktų, viename stulpelyje turinčius būti žodžių junginius galima 
# įtraukti į kabutes.

adresas <- "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_5b.dat"
d <- read.table(file = adresas, header = TRUE)
d

# Universalus sprendimas -- stulpelius vieną nuo kito atskirti kabliataškiu.
adresas <- "http://fmf.vgtu.lt/~trekasius/Rkonspektas/duomenys/lent_5c.csv"
d <- read.table(file = adresas, header = TRUE, sep = ";")
d

# Tą patį principą galima taikyti ir nuskaitant duomenis iš teksto. Nuskaitysime
# tą pačią duomenų lentelę dviem skirtingais būdais. Pirmas būdas -- sukuriant 
# tekstinį vektorių.

l <- "
Valdovas;           Metai
Vytautas Didysis;   1350-1430
Žygimantas Augustas;1520-1572
"

d <- read.table(text = l, header = TRUE, sep = ";")
d


# Antras būdas -- naudojant funkciją textConnection

t <- textConnection("
Valdovas;           Metai
Vytautas Didysis;   1350-1430
Žygimantas Augustas;1520-1572
")

d <- read.table(file = t, header = TRUE, sep = ";")
d

# Visą šią teksto nuskaitymo komandą galima užrašyti viena eilute.
d <- read.table(file = textConnection(l), header = TRUE, sep = ";")
d


# UŽDUOTIS ------------------------------ 

# 1. Naudodami funkciją textConnection nuskaitykite loginių reikšmių vektorių 
#    "F-T-T-T-F-T-F-F-F-T". Užrašykite šią komandą viena eilute.
# 2. Naudodami funkciją textConnection nuskaitykite šią paprastą duomenų lentelę 
#    "X Y\n 11 12\n 21 22". Užrašykite šią komandą viena eilute.
