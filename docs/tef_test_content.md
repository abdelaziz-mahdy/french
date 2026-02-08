# TEF Comprehension Ecrite - Practice Test Content

**Purpose**: This file contains the raw content for TEF reading comprehension practice tests. The data-engineer should convert each test into JSON following the schema in `docs/product_spec_v2.md` (section 3.6).

**Format per question**: Passage text, question, 4 options (A/B/C/D), correct answer, explanation.

**Content notes**:
- All passages are original (not copied from real TEF exams) but designed to match real TEF style and difficulty
- Questions are in French, explanations are in English
- Section A = short notices/signs (easiest), Section D = complex texts (hardest)
- Accented characters must be preserved exactly in the JSON

---

# TEST 1: tef_ce_001

## Section A - Textes courts (Short Texts)

Each passage has 1 question. 5 passages, 5 questions total.

---

### Passage A-1
**Type**: sign
**Text**:
```
BIBLIOTHEQUE MUNICIPALE VICTOR HUGO
Horaires d'ouverture :
Lundi - Vendredi : 9h00 - 18h30
Samedi : 10h00 - 17h00
Dimanche : Fermee

Inscription gratuite sur presentation
d'un justificatif de domicile.
```

**Question 1** (id: tef_ce_001_A_01_q1)
Question : Pour s'inscrire a la bibliotheque, que faut-il presenter ?
- A) Une carte d'identite
- B) Un justificatif de domicile
- C) Une photo d'identite
- D) Un bulletin de salaire

**Correct**: B
**Explanation**: The sign states "Inscription gratuite sur presentation d'un justificatif de domicile" (Free registration upon presentation of proof of address).

---

### Passage A-2
**Type**: notice
**Text**:
```
AVIS AUX RESIDENTS

En raison de travaux de renovation dans le hall d'entree,
l'acces principal de l'immeuble sera ferme du 15 au 22 mars.
Veuillez utiliser l'entree secondaire situee rue Pasteur.

Nous nous excusons pour la gene occasionnee.
La direction
```

**Question 2** (id: tef_ce_001_A_02_q1)
Question : Pendant combien de temps l'entree principale sera-t-elle fermee ?
- A) Deux jours
- B) Une semaine
- C) Deux semaines
- D) Un mois

**Correct**: B
**Explanation**: The notice says the main entrance will be closed "du 15 au 22 mars" (from March 15 to 22), which is approximately one week (8 days).

---

### Passage A-3
**Type**: ad
**Text**:
```
RESTAURANT LE PETIT LYONNAIS
Nouveau ! Menu du midi a 14,90 EUR
Entree + Plat + Dessert
Du lundi au vendredi, de 12h a 14h30
Reservation conseillee au 04 72 33 45 67
Ferme le week-end pour le dejeuner
Ouvert tous les soirs de 19h a 23h
```

**Question 3** (id: tef_ce_001_A_03_q1)
Question : Quand peut-on profiter du menu du midi ?
- A) Tous les jours de la semaine
- B) Du lundi au vendredi uniquement
- C) Le week-end seulement
- D) Le soir de 19h a 23h

**Correct**: B
**Explanation**: The ad specifies "Du lundi au vendredi, de 12h a 14h30" and notes the restaurant is "Ferme le week-end pour le dejeuner" (closed on weekends for lunch).

---

### Passage A-4
**Type**: sign
**Text**:
```
PARC MUNICIPAL - REGLEMENT
- Chiens autorises en laisse uniquement
- Velos interdits sur les sentiers pietons
- Pique-nique autorise dans les zones designees
- Fermeture des portes a la tombee de la nuit
- Jeux de ballon autorises sur le terrain de sport
```

**Question 4** (id: tef_ce_001_A_04_q1)
Question : D'apres ce reglement, que peut-on faire dans le parc ?
- A) Faire du velo sur tous les sentiers
- B) Laisser son chien se promener librement
- C) Manger dans les zones prevues a cet effet
- D) Rester dans le parc apres la tombee de la nuit

**Correct**: C
**Explanation**: The rules state "Pique-nique autorise dans les zones designees" (Picnics allowed in designated areas). Dogs must be on leashes, bikes are forbidden on pedestrian paths, and the park closes at nightfall.

---

### Passage A-5
**Type**: notice
**Text**:
```
PHARMACIE DE GARDE - DIMANCHE 12 JANVIER

Pharmacie Centrale
15, avenue de la Republique
Ouverte de 9h00 a 20h00

Pour les urgences en dehors de ces horaires,
appelez le 3237 (service payant)
```

**Question 5** (id: tef_ce_001_A_05_q1)
Question : Que doit-on faire en cas d'urgence apres 20h le dimanche ?
- A) Aller a la Pharmacie Centrale
- B) Attendre le lundi matin
- C) Appeler le 3237
- D) Se rendre a l'hopital

**Correct**: C
**Explanation**: The notice states "Pour les urgences en dehors de ces horaires, appelez le 3237" (For emergencies outside these hours, call 3237).

---

## Section B - Textes de longueur moyenne (Medium Texts)

Each passage has 1-2 questions. 5 questions total.

---

### Passage B-1
**Type**: email
**Text**:
```
De : service.client@technoplus.fr
A : m.dupont@email.com
Objet : Votre commande n. 45892

Madame, Monsieur,

Nous vous informons que votre commande n. 45892 a ete expediee
ce jour. Le colis sera livre a votre domicile sous 3 a 5 jours
ouvrables.

Vous pouvez suivre votre livraison grace au numero de suivi
suivant : TR789456123FR sur le site de La Poste.

En cas d'absence lors de la livraison, un avis de passage sera
depose dans votre boite aux lettres et votre colis sera
disponible a votre bureau de poste pendant 15 jours.

Cordialement,
Le service client TechnoPlus
```

**Question 6** (id: tef_ce_001_B_01_q1)
Question : Quel est l'objet principal de cet email ?
- A) Confirmer une commande
- B) Informer de l'expedition d'un colis
- C) Signaler un retard de livraison
- D) Proposer un nouveau produit

**Correct**: B
**Explanation**: The email informs the customer that their order "a ete expediee ce jour" (has been shipped today) and provides a tracking number, making it a shipment notification.

**Question 7** (id: tef_ce_001_B_01_q2)
Question : Que se passe-t-il si le client n'est pas chez lui lors de la livraison ?
- A) Le colis est renvoye a l'expediteur
- B) Le livreur revient le lendemain
- C) Un avis de passage est laisse et le colis est garde a la poste
- D) Le colis est laisse devant la porte

**Correct**: C
**Explanation**: The email explains "un avis de passage sera depose dans votre boite aux lettres et votre colis sera disponible a votre bureau de poste pendant 15 jours" (a delivery notice will be left and the package will be available at the post office for 15 days).

---

### Passage B-2
**Type**: article
**Text**:
```
LE COVOITURAGE EN FRANCE : UNE PRATIQUE EN PLEINE CROISSANCE

Le covoiturage connait un succes grandissant en France. Selon
une etude recente, pres de 3 millions de Francais utilisent
regulierement des plateformes de covoiturage pour leurs
trajets quotidiens ou occasionnels.

Les raisons principales sont economiques : partager les frais
d'essence et de peage permet d'economiser en moyenne 2 000
euros par an. Mais les motivations ecologiques jouent aussi
un role important. Un trajet en covoiturage reduit les
emissions de CO2 de 75 % par passager par rapport a un trajet
en voiture individuelle.

Le gouvernement encourage cette pratique en proposant des
voies reservees sur certaines autoroutes et des places de
stationnement dediees pres des gares.
```

**Question 8** (id: tef_ce_001_B_02_q1)
Question : Selon l'article, quelle est la principale raison du succes du covoiturage ?
- A) Le gain de temps
- B) Les economies financieres
- C) Le confort du trajet
- D) L'obligation legale

**Correct**: B
**Explanation**: The article states "Les raisons principales sont economiques" (The main reasons are economic), with an average saving of 2,000 euros per year.

**Question 9** (id: tef_ce_001_B_02_q2)
Question : Comment le gouvernement soutient-il le covoiturage ?
- A) En offrant des subventions aux conducteurs
- B) En reduisant le prix de l'essence
- C) En reservant des voies sur les autoroutes et des parkings pres des gares
- D) En rendant le covoiturage obligatoire pour aller travailler

**Correct**: C
**Explanation**: The article states the government "proposant des voies reservees sur certaines autoroutes et des places de stationnement dediees pres des gares" (offering reserved lanes on certain highways and dedicated parking near train stations).

---

### Passage B-3
**Type**: instructions
**Text**:
```
INSCRIPTION AUX COURS DE FRANCAIS - CENTRE LINGUISTIQUE INTERNATIONAL

Procedure d'inscription :
1. Remplir le formulaire en ligne sur notre site www.cli-langues.fr
2. Joindre une copie de votre piece d'identite
3. Effectuer le test de niveau en ligne (30 minutes)
4. Recevoir votre resultat et votre placement par email
   sous 48 heures
5. Regler les frais d'inscription (350 EUR par trimestre)

Les cours ont lieu du lundi au jeudi, de 9h a 12h ou de
14h a 17h, selon le niveau. Les groupes sont composes de
8 a 12 personnes maximum.

Attention : aucun remboursement ne sera effectue apres le
debut des cours. Toute demande d'annulation doit etre faite
au moins 7 jours avant le premier cours.
```

**Question 10** (id: tef_ce_001_B_03_q1)
Question : Que doit faire un candidat avant de payer les frais d'inscription ?
- A) Assister a un cours d'essai
- B) Passer un test de niveau en ligne
- C) Rencontrer un professeur
- D) Fournir un certificat medical

**Correct**: B
**Explanation**: According to the procedure, step 3 is to take an online placement test ("Effectuer le test de niveau en ligne") before receiving placement results (step 4) and paying fees (step 5).

---

## Section C - Textes longs (Longer Texts)

Each passage has 2 questions. 5 questions total (with a remaining passage having 3).

---

### Passage C-1
**Type**: article
**Text**:
```
LE TELETRAVAIL TRANSFORME LA VIE DES FRANCAIS

Depuis la pandemie, le teletravail s'est installe durablement
dans les habitudes des Francais. Une enquete de l'INSEE publiee
en 2024 revele que 29 % des salaries travaillent a distance au
moins un jour par semaine, contre seulement 3 % avant 2020.

Cette evolution a des consequences profondes sur l'organisation
du territoire. De nombreuses familles ont quitte les grandes
villes pour s'installer dans des villes moyennes ou a la
campagne, ou les logements sont plus spacieux et moins chers.
Des villes comme Angers, Rennes ou La Rochelle ont vu leur
population augmenter de maniere significative.

Cependant, le teletravail n'est pas sans inconvenients. Selon
une etude de l'Universite Paris-Dauphine, 45 % des
teletravailleurs declarent souffrir d'isolement social et 38 %
ont du mal a separer vie professionnelle et vie personnelle.
Les psychologues du travail recommandent de limiter le
teletravail a deux ou trois jours par semaine pour maintenir
un equilibre sain.

Les entreprises, de leur cote, s'adaptent en proposant des
espaces de travail partages, des journees d'equipe obligatoires
et des outils de communication plus performants. Le modele
hybride -- quelques jours au bureau, quelques jours a la
maison -- semble etre la solution privilegiee par la majorite
des employeurs et des salaries.
```

**Question 11** (id: tef_ce_001_C_01_q1)
Question : Quel changement majeur le teletravail a-t-il provoque dans l'organisation du territoire ?
- A) Les entreprises ont ferme leurs bureaux en ville
- B) Des familles ont quitte les grandes villes pour des villes moyennes ou la campagne
- C) Les transports en commun ont ete supprimes
- D) Les loyers ont augmente dans les petites villes

**Correct**: B
**Explanation**: The article states "De nombreuses familles ont quitte les grandes villes pour s'installer dans des villes moyennes ou a la campagne" (Many families left big cities to settle in medium-sized towns or the countryside).

**Question 12** (id: tef_ce_001_C_01_q2)
Question : Que recommandent les psychologues du travail ?
- A) D'arreter completement le teletravail
- B) De travailler uniquement depuis la maison
- C) De limiter le teletravail a deux ou trois jours par semaine
- D) De travailler seul dans un espace dedie

**Correct**: C
**Explanation**: The article states "Les psychologues du travail recommandent de limiter le teletravail a deux ou trois jours par semaine pour maintenir un equilibre sain" (Work psychologists recommend limiting remote work to two or three days per week to maintain a healthy balance).

---

### Passage C-2
**Type**: article
**Text**:
```
L'ALIMENTATION BIO : ENTRE CONVICTION ET REALITE

Le marche du bio en France represente aujourd'hui 12 milliards
d'euros. Pourtant, apres des annees de croissance record, les
ventes de produits biologiques ont ralenti. Comment expliquer
ce phenomene ?

Plusieurs facteurs entrent en jeu. D'abord, l'inflation a
pousse de nombreux consommateurs a revoir leurs priorites
budgetaires. Un panier de produits bio coute en moyenne 30 %
plus cher qu'un panier conventionnel. Pour les familles aux
revenus modestes, cet ecart est devenu difficile a supporter.

Ensuite, la confusion autour des labels n'aide pas. Entre le
label AB (Agriculture Biologique), le label europeen, et les
multiples certifications privees, les consommateurs ne savent
plus toujours ce qu'ils achetent. Certains se tournent vers
des alternatives comme le "local" ou le "raisonne", juges
plus accessibles.

Neanmoins, les experts s'accordent a dire que le bio reste
une tendance de fond. Les jeunes generations, en particulier,
considerent l'alimentation biologique comme un choix de societe
plutot qu'un simple acte de consommation. Les cantines
scolaires, qui doivent desormais proposer 20 % de produits bio
dans leurs menus, contribuent a normaliser cette pratique.
```

**Question 13** (id: tef_ce_001_C_02_q1)
Question : Pourquoi les ventes de produits bio ont-elles ralenti ?
- A) Parce que les produits bio sont de mauvaise qualite
- B) A cause de l'inflation et du cout plus eleve des produits bio
- C) Parce que les magasins bio ont ferme
- D) En raison d'un scandale sanitaire

**Correct**: B
**Explanation**: The article explains "l'inflation a pousse de nombreux consommateurs a revoir leurs priorites budgetaires" and "Un panier de produits bio coute en moyenne 30 % plus cher qu'un panier conventionnel" (inflation pushed consumers to reconsider their budgets, and organic products cost 30% more on average).

**Question 14** (id: tef_ce_001_C_02_q2)
Question : Dans ce texte, que signifie l'expression "une tendance de fond" ?
- A) Un phenomene temporaire et superficiel
- B) Une mode passagere chez les jeunes
- C) Un mouvement durable et profondement ancre
- D) Une obligation imposee par le gouvernement

**Correct**: C
**Explanation**: "Tendance de fond" means a deep, lasting trend -- as opposed to a passing fad. The context confirms this: experts say organic food remains important and young generations see it as a societal choice, not just a consumer act.

**Question 15** (id: tef_ce_001_C_02_q3)
Question : Quelle obligation concerne les cantines scolaires ?
- A) Servir uniquement des produits bio
- B) Proposer au moins 20 % de produits bio dans les menus
- C) Supprimer la viande des menus
- D) Acheter des produits locaux exclusivement

**Correct**: B
**Explanation**: The article states "Les cantines scolaires, qui doivent desormais proposer 20 % de produits bio dans leurs menus" (School cafeterias must now offer 20% organic products in their menus).

---

## Section D - Textes complexes (Complex Texts)

One long passage with 5 questions.

---

### Passage D-1
**Type**: opinion
**Text**:
```
FAUT-IL INTERDIRE LES ECRANS AUX ENFANTS DE MOINS DE TROIS ANS ?

La question de l'exposition des jeunes enfants aux ecrans
numeriques divise les specialistes et les parents. En France,
le Haut Conseil de la Sante Publique recommande de ne pas
exposer les enfants de moins de trois ans aux ecrans, quels
qu'ils soient. Mais cette recommandation est-elle realiste
dans une societe ou les ecrans sont omnipresents ?

Le docteur Sophie Martin, pediatre a l'hopital Necker,
est categorique : "Les ecrans sont nefastes pour le
developpement cognitif des tout-petits. Ils reduisent les
interactions avec les parents, retardent l'acquisition du
langage et perturbent le sommeil." Elle cite une etude
canadienne montrant que chaque heure passee devant un ecran
avant l'age de deux ans est associee a une diminution de
7 % des capacites d'attention a l'age de cinq ans.

En revanche, Marc Legrand, chercheur en sciences de l'education
a l'Universite de Lyon, nuance cette position : "Il ne faut
pas diaboliser les ecrans en tant que tels. Ce qui compte,
c'est la qualite du contenu et la presence d'un adulte. Un
enfant qui regarde un programme educatif avec ses parents,
qui lui expliquent et interagissent, n'est pas dans la meme
situation qu'un enfant laisse seul devant une tablette pendant
des heures."

Les pays scandinaves ont adopte une approche intermediaire.
En Suede, les recommandations ne fixent pas d'age minimum
absolu mais insistent sur la qualite des contenus et la
duree limitee. En Finlande, les creches integrent des outils
numeriques adaptes a l'age des enfants dans leurs activites
pedagogiques, avec des resultats juges positifs par les
educateurs.

Face a ces positions divergentes, l'Academie des Sciences
francaise a propose une approche equilibree : pas d'ecran
avant 2 ans, un usage tres limite et accompagne entre 2 et
6 ans, et une education progressive au numerique a partir
de 6 ans. Cette position pragmatique reconnait que l'objectif
n'est pas d'eliminer les ecrans -- ce qui serait utopique --
mais d'apprendre aux familles a les utiliser de maniere
responsable.
```

**Question 16** (id: tef_ce_001_D_01_q1)
Question : Quelle est la recommandation du Haut Conseil de la Sante Publique ?
- A) Limiter les ecrans a une heure par jour pour les enfants
- B) Ne pas exposer les enfants de moins de trois ans aux ecrans
- C) Autoriser uniquement les programmes educatifs
- D) Interdire les ecrans dans les ecoles maternelles

**Correct**: B
**Explanation**: The text clearly states "le Haut Conseil de la Sante Publique recommande de ne pas exposer les enfants de moins de trois ans aux ecrans" (the High Council of Public Health recommends not exposing children under three to screens).

**Question 17** (id: tef_ce_001_D_01_q2)
Question : Selon l'etude canadienne citee, quel est l'effet des ecrans sur les jeunes enfants ?
- A) Ils ameliorent la creativite
- B) Ils reduisent les capacites d'attention a cinq ans
- C) Ils favorisent l'apprentissage des langues
- D) Ils n'ont aucun effet mesurable

**Correct**: B
**Explanation**: The text cites a Canadian study showing "chaque heure passee devant un ecran avant l'age de deux ans est associee a une diminution de 7 % des capacites d'attention a l'age de cinq ans" (each hour spent in front of a screen before age two is associated with a 7% decrease in attention capacity at age five).

**Question 18** (id: tef_ce_001_D_01_q3)
Question : Selon Marc Legrand, quel est le facteur le plus important concernant l'usage des ecrans par les enfants ?
- A) L'age de l'enfant
- B) La marque de l'appareil
- C) La qualite du contenu et la presence d'un adulte
- D) La duree totale d'utilisation

**Correct**: C
**Explanation**: Marc Legrand states "Ce qui compte, c'est la qualite du contenu et la presence d'un adulte" (What matters is the quality of the content and the presence of an adult).

**Question 19** (id: tef_ce_001_D_01_q4)
Question : Comment les pays scandinaves abordent-ils la question des ecrans pour les enfants ?
- A) Ils interdisent totalement les ecrans avant 6 ans
- B) Ils n'ont aucune recommandation sur le sujet
- C) Ils mettent l'accent sur la qualite des contenus et une duree limitee
- D) Ils laissent les parents decider sans aucune directive

**Correct**: C
**Explanation**: The text explains that Sweden focuses on content quality and limited duration ("insistent sur la qualite des contenus et la duree limitee") and Finland integrates age-appropriate digital tools in daycare activities.

**Question 20** (id: tef_ce_001_D_01_q5)
Question : Quelle est la position de l'Academie des Sciences francaise ?
- A) Interdire completement les ecrans pour tous les enfants
- B) Laisser les parents decider sans recommandations
- C) Proposer une approche progressive selon l'age de l'enfant
- D) Imposer un controle parental obligatoire sur tous les appareils

**Correct**: C
**Explanation**: The Academie des Sciences proposes "pas d'ecran avant 2 ans, un usage tres limite et accompagne entre 2 et 6 ans, et une education progressive au numerique a partir de 6 ans" (no screens before 2, very limited accompanied use between 2 and 6, and progressive digital education from 6) -- a graduated approach by age.

---
---

# TEST 2: tef_ce_002

## Section A - Textes courts (Short Texts)

---

### Passage A-1
**Type**: ad
**Text**:
```
DEMENAGEMENT EXPRESS
Devis gratuit en ligne !
- Appartements et maisons
- Garde-meubles disponible
- Assurance incluse
Prix a partir de 390 EUR (studio, meme ville)
Tel : 01 55 78 90 12
Disponible 7j/7, y compris jours feries
```

**Question 1** (id: tef_ce_002_A_01_q1)
Question : Que propose cette entreprise en plus du demenagement ?
- A) La vente de meubles
- B) Le stockage de meubles
- C) La decoration d'interieur
- D) Le nettoyage d'appartement

**Correct**: B
**Explanation**: The ad mentions "Garde-meubles disponible" (Furniture storage available), which is a storage service for furniture.

---

### Passage A-2
**Type**: sign
**Text**:
```
PISCINE MUNICIPALE JEAN MOULIN
FERMETURE EXCEPTIONNELLE

La piscine sera fermee du 1er au 14 septembre
pour maintenance annuelle des bassins.

Les abonnes pourront utiliser la piscine
du complexe sportif des Lilas (15 min en bus, ligne 7)
sur presentation de leur carte d'abonnement.

Reouverture le 15 septembre a 8h00.
```

**Question 2** (id: tef_ce_002_A_02_q1)
Question : Que peuvent faire les abonnes pendant la fermeture ?
- A) Demander un remboursement
- B) Nager dans une autre piscine avec leur carte
- C) Attendre la reouverture
- D) S'inscrire dans un club prive

**Correct**: B
**Explanation**: The notice says subscribers can use the pool at "complexe sportif des Lilas ... sur presentation de leur carte d'abonnement" (upon presentation of their membership card at the Lilas sports complex).

---

### Passage A-3
**Type**: notice
**Text**:
```
MARCHE DE NOEL DE STRASBOURG
du 24 novembre au 24 decembre

Plus de 300 chalets sur 10 sites differents
Artisanat local, gastronomie alsacienne, animations

Horaires : 10h - 20h (jusqu'a 22h les vendredis et samedis)
Entree libre

Patinoire : 5 EUR / personne (gratuit pour les moins de 6 ans)
```

**Question 3** (id: tef_ce_002_A_03_q1)
Question : A quel horaire le marche ferme-t-il le samedi ?
- A) 18h
- B) 20h
- C) 22h
- D) Minuit

**Correct**: C
**Explanation**: The notice states hours are "10h - 20h (jusqu'a 22h les vendredis et samedis)" (until 10pm on Fridays and Saturdays).

---

### Passage A-4
**Type**: sign
**Text**:
```
CENTRE MEDICAL PASTEUR
Consultations uniquement sur rendez-vous

Dr. Lemaire (Generaliste) - Lundi, Mercredi, Vendredi
Dr. Faure (Pediatre) - Mardi et Jeudi
Dr. Nguyen (Dermatologue) - Mercredi apres-midi

Urgences : composez le 15 (SAMU)
Pas de consultations sans rendez-vous. Merci.
```

**Question 4** (id: tef_ce_002_A_04_q1)
Question : Si un enfant est malade un lundi, que doit-on faire ?
- A) Consulter le Dr. Faure directement
- B) Aller au centre medical sans rendez-vous
- C) Prendre rendez-vous, car le Dr. Faure consulte le mardi et jeudi
- D) Appeler le 15

**Correct**: C
**Explanation**: The pediatrician Dr. Faure only sees patients on Tuesday and Thursday ("Mardi et Jeudi"), and all consultations require an appointment ("uniquement sur rendez-vous"). For a non-emergency on Monday, the parent would need to make an appointment.

---

### Passage A-5
**Type**: notice
**Text**:
```
AVIS DE COUPURE D'EAU

Le mardi 8 octobre de 8h00 a 14h00, une coupure d'eau
est prevue dans les rues suivantes :
- Rue Victor Hugo
- Rue Emile Zola
- Avenue Jean Jaures

Nous vous conseillons de prevoir des reserves d'eau.
Nous vous remercions de votre comprehension.

Service des eaux - Mairie de Clichy
```

**Question 5** (id: tef_ce_002_A_05_q1)
Question : Combien de temps durera la coupure d'eau ?
- A) 2 heures
- B) 4 heures
- C) 6 heures
- D) 8 heures

**Correct**: C
**Explanation**: The notice says the water will be cut "de 8h00 a 14h00" (from 8am to 2pm), which is 6 hours.

---

## Section B - Textes de longueur moyenne (Medium Texts)

---

### Passage B-1
**Type**: email
**Text**:
```
De : rh@entreprise-martin.fr
A : tous.les.employes@entreprise-martin.fr
Objet : Nouveau reglement interieur - Teletravail

Chers collaborateurs,

A compter du 1er janvier, le reglement interieur de
l'entreprise evolue concernant le teletravail :

- Tous les salaries ayant plus de 6 mois d'anciennete
  peuvent beneficier de 2 jours de teletravail par semaine.
- Les jours de teletravail doivent etre fixes et valides
  par le responsable d'equipe.
- Une indemnite mensuelle de 30 EUR sera versee pour
  couvrir les frais (electricite, internet).
- Les reunions d'equipe du lundi restent obligatoires
  en presentiel.

Les demandes doivent etre adressees au service RH avant
le 15 decembre.

Cordialement,
Isabelle Roche
Directrice des Ressources Humaines
```

**Question 6** (id: tef_ce_002_B_01_q1)
Question : Qui peut beneficier du teletravail dans cette entreprise ?
- A) Tous les employes sans condition
- B) Les employes ayant plus de 6 mois d'anciennete
- C) Uniquement les cadres et les managers
- D) Les employes qui habitent loin du bureau

**Correct**: B
**Explanation**: The email states "Tous les salaries ayant plus de 6 mois d'anciennete peuvent beneficier de 2 jours de teletravail" (All employees with more than 6 months of seniority can benefit from 2 days of remote work).

**Question 7** (id: tef_ce_002_B_01_q2)
Question : Quel jour les employes doivent-ils obligatoirement etre au bureau ?
- A) Le vendredi
- B) Le mercredi
- C) Le lundi
- D) Tous les jours

**Correct**: C
**Explanation**: The email specifies "Les reunions d'equipe du lundi restent obligatoires en presentiel" (Monday team meetings remain mandatory in person).

---

### Passage B-2
**Type**: article
**Text**:
```
LA FRANCE BAT SON RECORD DE TOURISTES ETRANGERS

La France a accueilli 100 millions de touristes etrangers
l'annee derniere, un record historique qui confirme sa place
de premiere destination touristique mondiale.

Paris reste la ville la plus visitee, mais les regions
attirent de plus en plus. La Provence, la Bretagne et les
Alpes ont enregistre des hausses de frequentation de 15 %
a 20 %. Les touristes recherchent desormais des experiences
authentiques : sejours a la ferme, cours de cuisine
regionale, randonnees dans les vignobles.

Le secteur touristique represente 8 % du PIB francais et
emploie directement 2 millions de personnes. Cependant, le
surtourisme dans certaines zones pose des problemes : nuisances
pour les habitants, degradation des sites naturels et hausse
des prix de l'immobilier.
```

**Question 8** (id: tef_ce_002_B_02_q1)
Question : D'apres l'article, qu'est-ce qui attire les touristes en dehors de Paris ?
- A) Les prix plus bas des hotels
- B) Les experiences authentiques comme les cours de cuisine et les randonnees
- C) Les parcs d'attractions
- D) Les festivals de musique

**Correct**: B
**Explanation**: The article states tourists seek "des experiences authentiques : sejours a la ferme, cours de cuisine regionale, randonnees dans les vignobles" (authentic experiences: farm stays, regional cooking classes, vineyard hikes).

---

### Passage B-3
**Type**: instructions
**Text**:
```
COMMENT OBTENIR VOTRE CARTE VITALE

La carte Vitale est la carte d'assurance maladie en France.
Elle permet le remboursement de vos depenses de sante.

Pour obtenir votre carte Vitale :
1. Etre affilie a la Securite sociale (par votre emploi
   ou votre residence en France depuis plus de 3 mois)
2. Creer votre compte sur ameli.fr
3. Envoyer un formulaire de demande accompagne d'une
   photo d'identite et d'un justificatif d'identite
4. Delai de reception : 2 a 4 semaines

En attendant votre carte, vous pouvez demander une
attestation temporaire sur ameli.fr. Cette attestation
vous permet d'etre rembourse normalement.

Important : Mettez a jour votre carte Vitale au moins
une fois par an dans une pharmacie ou une borne de la
Securite sociale.
```

**Question 9** (id: tef_ce_002_B_03_q1)
Question : Que peut-on faire en attendant de recevoir sa carte Vitale ?
- A) Aller a l'hopital sans payer
- B) Utiliser la carte Vitale d'un proche
- C) Demander une attestation temporaire en ligne
- D) Payer toutes les consultations sans remboursement

**Correct**: C
**Explanation**: The text states "vous pouvez demander une attestation temporaire sur ameli.fr" (you can request a temporary certificate on ameli.fr) and this allows normal reimbursement.

**Question 10** (id: tef_ce_002_B_03_q2)
Question : A quelle frequence faut-il mettre a jour sa carte Vitale ?
- A) Tous les mois
- B) Au moins une fois par an
- C) Tous les 5 ans
- D) Seulement en cas de changement d'adresse

**Correct**: B
**Explanation**: The text states "Mettez a jour votre carte Vitale au moins une fois par an" (Update your Vitale card at least once a year).

---

## Section C - Textes longs (Longer Texts)

---

### Passage C-1
**Type**: article
**Text**:
```
LES FRANCAIS ET LE SPORT : UNE REVOLUTION SILENCIEUSE

La pratique sportive des Francais a profondement evolue ces
dernieres annees. Si le football reste le sport le plus
populaire en nombre de licencies (plus de 2 millions), les
activites individuelles connaissent une croissance spectaculaire.

La course a pied est devenue un phenomene de societe. On
compte aujourd'hui 12 millions de coureurs reguliers en
France, soit une augmentation de 40 % en dix ans. Le succes
des applications de suivi (Strava, Nike Run Club) et des
courses evenementielles comme le Marathon de Paris ou les
Color Run a contribue a populariser cette pratique.

Le yoga et le pilates attirent aussi de plus en plus d'adeptes,
en particulier chez les 25-45 ans. Ces disciplines, qui allient
exercice physique et bien-etre mental, repondent a un besoin
croissant de gestion du stress dans une societe de plus en
plus exigeante.

Paradoxalement, la sedentarite reste un probleme majeur de
sante publique. Selon l'ANSES, 95 % des adultes francais ne
pratiquent pas suffisamment d'activite physique. L'Organisation
Mondiale de la Sante recommande au minimum 150 minutes
d'activite moderee par semaine, un objectif que la plupart
des Francais n'atteignent pas.

Les pouvoirs publics tentent de reagir. Le programme "Bouger
30 minutes par jour" lance dans les ecoles primaires vise a
creer des habitudes des le plus jeune age. Des pistes cyclables
et des parcours sportifs en plein air sont amenages dans
de nombreuses villes pour encourager l'activite physique
quotidienne.
```

**Question 11** (id: tef_ce_002_C_01_q1)
Question : D'apres l'article, quelle activite sportive a connu la plus forte croissance ?
- A) Le football
- B) La course a pied
- C) Le yoga
- D) La natation

**Correct**: B
**Explanation**: The article describes running as "un phenomene de societe" with "12 millions de coureurs reguliers" and "une augmentation de 40 % en dix ans" (a 40% increase in ten years), making it the activity with the most notable growth described.

**Question 12** (id: tef_ce_002_C_01_q2)
Question : Que signifie le mot "paradoxalement" dans ce texte ?
- A) De maniere logique et attendue
- B) De facon contradictoire avec ce qui precede
- C) De maniere progressive
- D) De facon definitive

**Correct**: B
**Explanation**: "Paradoxalement" means "paradoxically" -- it introduces a contradiction. Despite the sports boom described in the preceding paragraphs, sedentary behavior remains a major public health problem. The word signals this surprising contrast.

**Question 13** (id: tef_ce_002_C_01_q3)
Question : Quelle est la recommandation de l'OMS en matiere d'activite physique ?
- A) 30 minutes par jour
- B) 1 heure par semaine
- C) Au moins 150 minutes d'activite moderee par semaine
- D) 3 seances de sport par semaine

**Correct**: C
**Explanation**: The article states "L'Organisation Mondiale de la Sante recommande au minimum 150 minutes d'activite moderee par semaine" (The WHO recommends at least 150 minutes of moderate activity per week).

---

### Passage C-2
**Type**: opinion
**Text**:
```
POUR OU CONTRE L'UNIFORME A L'ECOLE ?

Le debat sur l'uniforme scolaire revient regulierement en
France. Ses partisans affirment qu'il reduit les inegalites
sociales visibles, evite les conflits lies aux vetements de
marque et renforce le sentiment d'appartenance a l'ecole.

Ses opposants, en revanche, y voient une atteinte a la
liberte d'expression des eleves. Ils soulignent que l'uniforme
ne resout pas les problemes d'inegalite profonds et qu'il
represente un cout supplementaire pour les familles, qui
doivent acheter a la fois l'uniforme et des vetements pour
le week-end.

En France, l'uniforme n'est pas obligatoire dans les ecoles
publiques, contrairement a de nombreux pays anglophones. Seuls
quelques etablissements prives l'imposent. Un sondage recent
montre que 63 % des Francais seraient favorables a
l'introduction de l'uniforme dans les ecoles publiques.
```

**Question 14** (id: tef_ce_002_C_02_q1)
Question : Quel argument les opposants a l'uniforme avancent-ils ?
- A) L'uniforme est trop difficile a entretenir
- B) Il represente un cout supplementaire et limite la liberte d'expression
- C) Les enfants preferent porter des vetements de sport
- D) L'uniforme est inconfortable en ete

**Correct**: B
**Explanation**: The opponents see uniform as "une atteinte a la liberte d'expression des eleves" (an infringement on students' freedom of expression) and "un cout supplementaire pour les familles" (an additional cost for families).

**Question 15** (id: tef_ce_002_C_02_q2)
Question : Quelle est la situation actuelle de l'uniforme dans les ecoles publiques francaises ?
- A) Il est obligatoire partout
- B) Il est interdit
- C) Il n'est pas obligatoire
- D) Il est obligatoire uniquement au college

**Correct**: C
**Explanation**: The text clearly states "l'uniforme n'est pas obligatoire dans les ecoles publiques" (the uniform is not mandatory in public schools).

---

## Section D - Textes complexes (Complex Texts)

---

### Passage D-1
**Type**: formal_document
**Text**:
```
L'INTELLIGENCE ARTIFICIELLE ET L'AVENIR DU TRAVAIL EN FRANCE

Rapport de synthese - Conseil Economique, Social et Environnemental

L'intelligence artificielle (IA) transforme en profondeur le
marche du travail. Selon un rapport de l'OCDE, 27 % des
emplois en France presentent un risque eleve d'automatisation
dans les dix prochaines annees. Les metiers les plus exposes
sont ceux qui impliquent des taches repetitives et
previsibles : caissiers, comptables, agents administratifs.

Toutefois, l'IA cree aussi de nouveaux metiers. Les besoins
en data scientists, ingenieurs en apprentissage automatique,
et specialistes de l'ethique de l'IA sont en forte croissance.
Le probleme est que ces nouveaux emplois exigent des
competences que le systeme educatif actuel ne fournit pas
suffisamment. Il y a un decalage croissant entre les
competences disponibles sur le marche et celles que les
entreprises recherchent.

La formation continue apparait comme une solution essentielle.
Le Compte Personnel de Formation (CPF), qui permet a chaque
salarie de cumuler des droits a la formation tout au long de
sa carriere, doit etre renforce et mieux oriente vers les
competences numeriques. Actuellement, seulement 15 % des
formations financees par le CPF concernent le numerique.

Par ailleurs, le dialogue social doit accompagner cette
transition. Les entreprises qui automatisent certains postes
ont une responsabilite envers leurs salaries : proposer des
reconversions, financer des formations, et maintenir un
dialogue transparent avec les representants du personnel.

Le modele francais de protection sociale offre un cadre
favorable a cette transition, a condition de l'adapter. Le
systeme d'assurance-chomage, les dispositifs de formation et
les aides a la mobilite professionnelle doivent evoluer pour
repondre aux defis specifiques poses par l'automatisation.
L'enjeu n'est pas de s'opposer au progres technologique, mais
de s'assurer qu'il beneficie a l'ensemble de la societe.
```

**Question 16** (id: tef_ce_002_D_01_q1)
Question : Selon le rapport de l'OCDE, quel pourcentage d'emplois en France est menace par l'automatisation ?
- A) 15 %
- B) 27 %
- C) 40 %
- D) 50 %

**Correct**: B
**Explanation**: The text states "27 % des emplois en France presentent un risque eleve d'automatisation" (27% of jobs in France present a high risk of automation).

**Question 17** (id: tef_ce_002_D_01_q2)
Question : Quel probleme le texte identifie-t-il concernant les nouveaux metiers lies a l'IA ?
- A) Ces metiers sont mal remuneres
- B) Il n'y a pas assez de candidats avec les competences requises
- C) Les entreprises ne veulent pas embaucher
- D) Ces metiers n'existent qu'a l'etranger

**Correct**: B
**Explanation**: The text identifies "un decalage croissant entre les competences disponibles sur le marche et celles que les entreprises recherchent" (a growing gap between available skills and those companies are looking for), because the education system doesn't provide sufficient training.

**Question 18** (id: tef_ce_002_D_01_q3)
Question : Quel role le CPF devrait-il jouer selon le texte ?
- A) Financer les vacances des employes
- B) Remplacer le systeme d'assurance-chomage
- C) Etre renforce et mieux oriente vers les competences numeriques
- D) Permettre aux employes de travailler moins

**Correct**: C
**Explanation**: The text says the CPF "doit etre renforce et mieux oriente vers les competences numeriques" (must be strengthened and better oriented toward digital skills), noting that currently only 15% of CPF-funded training is related to digital skills.

**Question 19** (id: tef_ce_002_D_01_q4)
Question : Quelle responsabilite le texte attribue-t-il aux entreprises qui automatisent ?
- A) Payer des impots supplementaires
- B) Proposer des reconversions et financer des formations
- C) Cesser d'utiliser l'IA
- D) Augmenter les salaires de tous les employes

**Correct**: B
**Explanation**: The text states companies that automate "ont une responsabilite envers leurs salaries : proposer des reconversions, financer des formations, et maintenir un dialogue transparent" (have a responsibility toward their employees: offering retraining, funding training, and maintaining transparent dialogue).

**Question 20** (id: tef_ce_002_D_01_q5)
Question : Quelle est la conclusion principale du texte ?
- A) Il faut interdire l'intelligence artificielle en France
- B) Le progres technologique est inevitable et benefique pour tous
- C) Il faut adapter les dispositifs sociaux pour que le progres beneficie a toute la societe
- D) Le systeme educatif francais est le meilleur en Europe

**Correct**: C
**Explanation**: The final sentence states "L'enjeu n'est pas de s'opposer au progres technologique, mais de s'assurer qu'il beneficie a l'ensemble de la societe" (The challenge is not to oppose technological progress, but to ensure it benefits all of society), and the text argues for adapting social protections to achieve this.

---
---

# TEST 3: tef_ce_003

## Section A - Textes courts (Short Texts)

---

### Passage A-1
**Type**: sign
**Text**:
```
ATTENTION TRAVAUX
Route departementale D45
Deviation obligatoire par la D12
du 3 au 17 fevrier

Acces riverains maintenu.
Circulation interdite aux vehicules de plus de 3,5 tonnes.
Merci de votre patience.
```

**Question 1** (id: tef_ce_003_A_01_q1)
Question : Qui peut encore utiliser cette route pendant les travaux ?
- A) Tous les vehicules legers
- B) Les camions de plus de 3,5 tonnes
- C) Les habitants du quartier uniquement
- D) Personne

**Correct**: C
**Explanation**: The sign states "Acces riverains maintenu" (Local residents' access maintained), meaning only residents (riverains) can still use the road.

---

### Passage A-2
**Type**: ad
**Text**:
```
COURS DE CUISINE PROVENCALE
avec le Chef Antoine Moreau

Samedi 15 mars - 10h a 14h
Au menu : ratatouille, tapenade et tarte au citron

Tarif : 65 EUR par personne
(ingredients et tablier fournis)
Places limitees a 8 participants

Inscription : contact@ateliersdupalais.fr
Annulation gratuite jusqu'a 48h avant le cours
```

**Question 2** (id: tef_ce_003_A_02_q1)
Question : Que comprend le tarif de 65 euros ?
- A) Le repas et les boissons
- B) Les ingredients et un tablier
- C) Le transport et le parking
- D) Un livre de recettes

**Correct**: B
**Explanation**: The ad specifies "(ingredients et tablier fournis)" (ingredients and apron provided) as included in the price.

---

### Passage A-3
**Type**: notice
**Text**:
```
RESIDENCE LES ACACIAS
ASSEMBLEE GENERALE DES COPROPRIETAIRES

Date : Jeudi 20 mars a 19h00
Lieu : Salle polyvalente, rez-de-chaussee

Ordre du jour :
1. Approbation des comptes 2025
2. Travaux de ravalement de facade
3. Installation de bornes de recharge electrique
4. Questions diverses

En cas d'impossibilite, vous pouvez donner procuration
a un autre coproprietaire. Formulaire disponible chez
le gardien.
```

**Question 3** (id: tef_ce_003_A_03_q1)
Question : Que peut faire un coproprietaire qui ne peut pas assister a la reunion ?
- A) Voter par internet
- B) Reporter la reunion
- C) Donner procuration a un autre coproprietaire
- D) Envoyer un email au syndic

**Correct**: C
**Explanation**: The notice states "vous pouvez donner procuration a un autre coproprietaire" (you can give proxy to another co-owner).

---

### Passage A-4
**Type**: sign
**Text**:
```
MEDIATHEQUE MARGUERITE DURAS

Wi-Fi gratuit disponible
Code d'acces a demander a l'accueil

Impression : 0,10 EUR / page (noir et blanc)
              0,30 EUR / page (couleur)

Photocopies : meme tarif
Paiement par carte uniquement (pas d'especes)
```

**Question 4** (id: tef_ce_003_A_04_q1)
Question : Comment peut-on payer les impressions ?
- A) En especes uniquement
- B) Par carte bancaire uniquement
- C) En especes ou par carte
- D) Par cheque

**Correct**: B
**Explanation**: The sign clearly states "Paiement par carte uniquement (pas d'especes)" (Payment by card only, no cash).

---

### Passage A-5
**Type**: notice
**Text**:
```
COLLECTE DES SAPINS DE NOEL

La mairie organise la collecte gratuite des sapins
de Noel naturels (sans decoration ni pied).

Points de depot :
- Parking du gymnase (av. de la Gare)
- Place de la Mairie
- Parc des Sports

Du 2 au 15 janvier.
Les sapins seront transformes en compost.
```

**Question 5** (id: tef_ce_003_A_05_q1)
Question : Que deviendront les sapins collectes ?
- A) Ils seront brules
- B) Ils seront replantes
- C) Ils seront transformes en compost
- D) Ils seront vendus

**Correct**: C
**Explanation**: The notice states "Les sapins seront transformes en compost" (The trees will be turned into compost).

---

## Section B - Textes de longueur moyenne (Medium Texts)

---

### Passage B-1
**Type**: article
**Text**:
```
LES FRANCAIS ET LEURS ANIMAUX DE COMPAGNIE

La France compte 80 millions d'animaux de compagnie, ce qui
en fait le pays d'Europe avec le plus grand nombre d'animaux
domestiques. Un foyer sur deux possede au moins un animal.

Les chats sont les plus populaires (15 millions), devant les
chiens (7,5 millions). Cette preference pour les chats
s'explique en partie par l'evolution des modes de vie : un
chat s'adapte mieux a un appartement et demande moins de
disponibilite qu'un chien.

La depense annuelle moyenne pour un animal de compagnie est
de 800 euros pour un chien et de 600 euros pour un chat
(nourriture, veterinaire, accessoires). Le marche des animaux
de compagnie en France depasse 5 milliards d'euros par an.

Malgre cet engouement, l'abandon reste un fleau. Chaque
annee, pres de 100 000 animaux sont abandonnes en France,
en particulier pendant la periode des vacances d'ete. La loi
francaise punit l'abandon d'un animal de 3 ans d'emprisonnement
et 45 000 euros d'amende.
```

**Question 6** (id: tef_ce_003_B_01_q1)
Question : Pourquoi les Francais preferent-ils les chats aux chiens ?
- A) Les chats sont moins chers a l'achat
- B) Les chats s'adaptent mieux a la vie en appartement
- C) Les chats vivent plus longtemps
- D) Les chats sont plus affectueux

**Correct**: B
**Explanation**: The article explains "un chat s'adapte mieux a un appartement et demande moins de disponibilite qu'un chien" (a cat adapts better to an apartment and requires less availability than a dog).

**Question 7** (id: tef_ce_003_B_01_q2)
Question : Que risque une personne qui abandonne son animal en France ?
- A) Une amende de 200 euros
- B) Une interdiction de posseder un autre animal
- C) Jusqu'a 3 ans de prison et 45 000 euros d'amende
- D) Un avertissement de la mairie

**Correct**: C
**Explanation**: The article states "La loi francaise punit l'abandon d'un animal de 3 ans d'emprisonnement et 45 000 euros d'amende" (French law punishes animal abandonment with 3 years of imprisonment and a 45,000 euro fine).

---

### Passage B-2
**Type**: email
**Text**:
```
De : mairie-inscriptions@ville-nanterre.fr
A : famille.benali@email.com
Objet : Inscription scolaire de votre enfant - pieces manquantes

Madame, Monsieur Benali,

Nous avons bien recu votre demande d'inscription de votre
enfant Yasmine Benali a l'ecole elementaire Jules Ferry
pour la rentree prochaine.

Cependant, votre dossier est incomplet. Il nous manque
les documents suivants :
- Le certificat de vaccination a jour (DT Polio obligatoire)
- Un justificatif de domicile de moins de 3 mois

Merci de nous faire parvenir ces documents avant le 30 avril,
par email ou en vous rendant a la mairie, service scolaire,
2e etage, bureau 205.

Passe ce delai, l'inscription ne pourra pas etre garantie.

Cordialement,
Service des affaires scolaires
Mairie de Nanterre
```

**Question 8** (id: tef_ce_003_B_02_q1)
Question : Pourquoi la mairie a-t-elle envoye cet email ?
- A) Pour confirmer l'inscription de l'enfant
- B) Pour demander des documents manquants au dossier
- C) Pour refuser l'inscription de l'enfant
- D) Pour informer d'un changement d'ecole

**Correct**: B
**Explanation**: The email states "votre dossier est incomplet. Il nous manque les documents suivants" (your file is incomplete. We are missing the following documents), making it a request for missing documents.

---

### Passage B-3
**Type**: article
**Text**:
```
LE SUCCES DES REPAIR CAFES EN FRANCE

Les Repair Cafes, ces ateliers ou des benevoles aident
les particuliers a reparer leurs objets du quotidien, se
multiplient en France. On en compte desormais plus de 500
dans tout le pays.

Le concept est simple : vous apportez un objet en panne
(petit electromenager, vetement dechire, velo, jouet) et
des reparateurs benevoles vous aident a le reparer, tout
en vous apprenant les gestes de base. L'acces est gratuit,
une participation libre aux frais est bienvenue.

Au-dela de l'aspect ecologique -- eviter de jeter et de
racheter -- les Repair Cafes jouent un role social important.
Ils creent du lien entre les generations et les quartiers.
"Ici, un retraite ancien mecanicien peut montrer a un jeune
comment reparer son velo, et en retour le jeune peut l'aider
avec son telephone", explique Marie Lefebvre, coordinatrice
du Repair Cafe de Montpellier.
```

**Question 9** (id: tef_ce_003_B_03_q1)
Question : Quel est le principe des Repair Cafes ?
- A) Acheter des objets d'occasion a bas prix
- B) Faire reparer ses objets par des professionnels payants
- C) Apprendre a reparer ses objets avec l'aide de benevoles
- D) Recycler ses vieux appareils electroniques

**Correct**: C
**Explanation**: The article explains that Repair Cafes are places where "des benevoles aident les particuliers a reparer leurs objets du quotidien" and "des reparateurs benevoles vous aident a le reparer, tout en vous apprenant les gestes de base" (volunteers help you repair while teaching you basic skills).

**Question 10** (id: tef_ce_003_B_03_q2)
Question : En plus de l'aspect ecologique, quel autre role les Repair Cafes jouent-ils ?
- A) Un role politique
- B) Un role social, en creant des liens entre les gens
- C) Un role economique, en creant des emplois
- D) Un role educatif dans les ecoles

**Correct**: B
**Explanation**: The article states "les Repair Cafes jouent un role social important. Ils creent du lien entre les generations et les quartiers" (Repair Cafes play an important social role. They create connections between generations and neighborhoods).

---

## Section C - Textes longs (Longer Texts)

---

### Passage C-1
**Type**: article
**Text**:
```
VIEILLIR EN FRANCE : LES DEFIS D'UNE SOCIETE VIEILLISSANTE

La France compte aujourd'hui 14 millions de personnes agees
de plus de 65 ans, soit 21 % de la population. D'ici 2040,
ce chiffre pourrait atteindre 20 millions. Ce vieillissement
demographique pose des defis majeurs en matiere de sante, de
logement et de solidarite intergenerationnelle.

Le maintien a domicile est la solution privilegiee par la
grande majorite des personnes agees : 90 % d'entre elles
souhaitent vivre chez elles le plus longtemps possible. Pour
rendre cela possible, des aides existent : services d'aide
a domicile, tele-assistance, amenagement du logement (douche
a l'italienne, monte-escalier, domotique). L'Allocation
Personnalisee d'Autonomie (APA) finance une partie de ces
services en fonction des ressources de la personne.

Cependant, le secteur de l'aide a domicile souffre d'un manque
chronique de personnel. Les aides-soignantes et auxiliaires de
vie sont mal remunerees (souvent au SMIC) et exercent un
metier physiquement et emotionnellement exigeant. Le turnover
est eleve et le recrutement difficile.

Des solutions innovantes emergent. L'habitat intergenerationnel,
qui met en relation des personnes agees disposant d'une chambre
libre avec des etudiants cherchant un logement, connait un
succes croissant. L'etudiant paie un loyer modique en echange
de quelques heures de presence et de petits services. Ce
modele repond a la fois a l'isolement des personnes agees
et a la crise du logement etudiant.
```

**Question 11** (id: tef_ce_003_C_01_q1)
Question : Quel pourcentage de personnes agees souhaitent rester vivre chez elles ?
- A) 65 %
- B) 75 %
- C) 90 %
- D) 100 %

**Correct**: C
**Explanation**: The article states "90 % d'entre elles souhaitent vivre chez elles le plus longtemps possible" (90% of them wish to live at home as long as possible).

**Question 12** (id: tef_ce_003_C_01_q2)
Question : Quel est le principal probleme du secteur de l'aide a domicile ?
- A) Le cout trop eleve pour les familles
- B) Le manque de personnel et les salaires trop bas
- C) L'absence de formation adaptee
- D) Le refus des personnes agees d'accepter de l'aide

**Correct**: B
**Explanation**: The article identifies "un manque chronique de personnel" (chronic staff shortage) and notes workers are "mal remunerees (souvent au SMIC)" (poorly paid, often at minimum wage).

**Question 13** (id: tef_ce_003_C_01_q3)
Question : En quoi consiste l'habitat intergenerationnel ?
- A) Des residences ou vivent ensemble uniquement des personnes agees
- B) Des logements sociaux reserves aux etudiants
- C) Un systeme ou un etudiant loge chez une personne agee en echange de services
- D) Des maisons de retraite avec des creches

**Correct**: C
**Explanation**: The article explains this model "met en relation des personnes agees disposant d'une chambre libre avec des etudiants cherchant un logement" where "L'etudiant paie un loyer modique en echange de quelques heures de presence et de petits services" (The student pays a modest rent in exchange for a few hours of company and small services).

---

### Passage C-2
**Type**: opinion
**Text**:
```
LA PLACE DU FRANCAIS DANS LE MONDE NUMERIQUE

Le francais est-il menace par la domination de l'anglais sur
internet ? Avec 321 millions de locuteurs dans le monde, le
francais est la cinquieme langue la plus parlee. Pourtant,
seulement 4 % du contenu en ligne est en francais, contre
plus de 60 % en anglais.

Cette situation inquiete les defenseurs de la francophonie.
Si les contenus scientifiques, technologiques et culturels
ne sont disponibles qu'en anglais, les francophones risquent
d'etre marginalises dans l'economie de la connaissance.
L'intelligence artificielle, formee majoritairement sur des
donnees anglophones, pourrait aggraver ce desequilibre en
produisant des resultats moins pertinents en francais.

Mais d'autres observateurs sont plus optimistes. Le nombre
de francophones devrait atteindre 700 millions d'ici 2050,
principalement grace a la croissance demographique en Afrique.
Cette masse critique de locuteurs pourrait stimuler la
creation de contenus en francais et attirer les investissements
des grandes entreprises technologiques.
```

**Question 14** (id: tef_ce_003_C_02_q1)
Question : Quel est le desequilibre identifie dans ce texte ?
- A) Il y a trop de francophones et pas assez de contenu
- B) Le francais est tres parle mais sous-represente en ligne
- C) L'anglais est en declin sur internet
- D) Les pays francophones n'ont pas acces a internet

**Correct**: B
**Explanation**: The text highlights that French has 321 million speakers (5th most spoken) but only 4% of online content is in French, versus 60%+ in English -- showing the language is well-spoken but underrepresented online.

**Question 15** (id: tef_ce_003_C_02_q2)
Question : Pourquoi certains observateurs sont-ils optimistes pour l'avenir du francais ?
- A) Parce que l'anglais va disparaitre d'internet
- B) Parce que le nombre de francophones devrait fortement augmenter grace a l'Afrique
- C) Parce que l'Union Europeenne va imposer le francais
- D) Parce que les Francais utilisent de moins en moins internet

**Correct**: B
**Explanation**: The text states "Le nombre de francophones devrait atteindre 700 millions d'ici 2050, principalement grace a la croissance demographique en Afrique" (The number of French speakers should reach 700 million by 2050, mainly thanks to demographic growth in Africa).

---

## Section D - Textes complexes (Complex Texts)

---

### Passage D-1
**Type**: formal_document
**Text**:
```
LA TRANSITION ENERGETIQUE EN FRANCE : BILAN ET PERSPECTIVES

La France s'est engagee a atteindre la neutralite carbone
d'ici 2050. Cet objectif ambitieux implique une transformation
profonde de son modele energetique, qui repose encore
largement sur le nucleaire (environ 70 % de la production
electrique) et les energies fossiles (pour les transports
et le chauffage).

Le developpement des energies renouvelables constitue un
pilier central de cette transition. L'eolien et le solaire
ont connu une progression importante : la capacite installee
en solaire a triple en cinq ans, et la France dispose
desormais de 8 500 eoliennes terrestres. Cependant, la
France reste en retard par rapport a ses voisins europeens.
L'Allemagne produit trois fois plus d'energie solaire et
l'Espagne a une capacite eolienne superieure de 50 %.

Le secteur du batiment represente 45 % de la consommation
energetique totale du pays. La renovation thermique des
logements est donc une priorite absolue. Le gouvernement
a lance le dispositif MaPrimeRenov, qui finance jusqu'a
90 % des travaux de renovation energetique pour les
menages les plus modestes. Depuis son lancement, plus de
2 millions de dossiers ont ete traites, mais les experts
estiment qu'il faudrait renover 700 000 logements par an
pour atteindre les objectifs fixes, contre 200 000
actuellement.

Les transports constituent l'autre grand defi. Le secteur
est responsable de 31 % des emissions de gaz a effet de
serre en France. L'interdiction de la vente de vehicules
thermiques neufs a partir de 2035 accelere la transition
vers l'electrique. Mais le prix eleve des voitures
electriques (en moyenne 35 000 euros) et le manque de bornes
de recharge freinent l'adoption par les particuliers. Le
gouvernement a mis en place un bonus ecologique pouvant
atteindre 7 000 euros et s'est fixe l'objectif de 400 000
bornes de recharge publiques d'ici 2030.

Enfin, la question du nucleaire reste au coeur des debats.
La France a decide de construire 6 nouveaux reacteurs EPR2
pour garantir la securite d'approvisionnement. Les partisans
du nucleaire soulignent qu'il s'agit d'une energie bas carbone
et stable. Ses detracteurs pointent les risques lies aux
dechets radioactifs, le cout croissant des chantiers et les
delais de construction qui depassent systematiquement les
previsions. Le chantier de l'EPR de Flamanville, initie en
2007, n'a ete acheve qu'en 2024, avec un cout final quatre
fois superieur au budget initial.
```

**Question 16** (id: tef_ce_003_D_01_q1)
Question : Quel est l'objectif energetique de la France pour 2050 ?
- A) Doubler sa production nucleaire
- B) Atteindre la neutralite carbone
- C) Abandonner completement le nucleaire
- D) Devenir le premier producteur d'energie solaire en Europe

**Correct**: B
**Explanation**: The opening sentence states "La France s'est engagee a atteindre la neutralite carbone d'ici 2050" (France has committed to achieving carbon neutrality by 2050).

**Question 17** (id: tef_ce_003_D_01_q2)
Question : Pourquoi la renovation des batiments est-elle une priorite ?
- A) Parce que les batiments sont trop vieux et dangereux
- B) Parce que le secteur du batiment consomme 45 % de l'energie totale
- C) Parce que les Francais se plaignent du froid chez eux
- D) Parce que les normes europeennes l'exigent

**Correct**: B
**Explanation**: The text states "Le secteur du batiment represente 45 % de la consommation energetique totale du pays. La renovation thermique des logements est donc une priorite absolue" (The building sector represents 45% of total energy consumption, so thermal renovation is an absolute priority).

**Question 18** (id: tef_ce_003_D_01_q3)
Question : Quels sont les obstacles a l'adoption des voitures electriques par les particuliers ?
- A) La vitesse trop faible des voitures electriques
- B) Le prix eleve et le manque de bornes de recharge
- C) L'absence d'aide gouvernementale
- D) Le refus des constructeurs de produire des modeles electriques

**Correct**: B
**Explanation**: The text identifies "le prix eleve des voitures electriques (en moyenne 35 000 euros) et le manque de bornes de recharge" (the high price of electric cars and the lack of charging stations) as the main obstacles.

**Question 19** (id: tef_ce_003_D_01_q4)
Question : Quel probleme illustre le chantier de l'EPR de Flamanville ?
- A) Le manque de travailleurs qualifies
- B) L'opposition des habitants de la region
- C) Les depassements de delais et de couts des projets nucleaires
- D) La fermeture anticipee de la centrale

**Correct**: C
**Explanation**: The Flamanville EPR illustrates cost and timeline overruns: "initie en 2007, n'a ete acheve qu'en 2024, avec un cout final quatre fois superieur au budget initial" (started in 2007, completed only in 2024, at four times the initial budget).

**Question 20** (id: tef_ce_003_D_01_q5)
Question : Quel rythme de renovation serait necessaire pour atteindre les objectifs ?
- A) 100 000 logements par an
- B) 200 000 logements par an
- C) 500 000 logements par an
- D) 700 000 logements par an

**Correct**: D
**Explanation**: The text states "il faudrait renover 700 000 logements par an pour atteindre les objectifs fixes, contre 200 000 actuellement" (700,000 homes per year would be needed, compared to the current 200,000).

---

# Notes for Data Engineer

## Converting to JSON

Each test above maps to one JSON file following the schema in `product_spec_v2.md` section 3.6:

- **Test 1** -> `assets/data/tef_tests/tef_ce_001.json`
- **Test 2** -> `assets/data/tef_tests/tef_ce_002.json`
- **Test 3** -> `assets/data/tef_tests/tef_ce_003.json`

## ID Convention

- Test ID: `tef_ce_001`, `tef_ce_002`, `tef_ce_003`
- Passage ID: `tef_ce_001_A_01`, `tef_ce_001_B_02`, etc.
- Question ID: `tef_ce_001_A_01_q1`, `tef_ce_001_B_02_q2`, etc.

## Section Mapping

- Section A: `textType` values -- `sign`, `notice`, `ad`
- Section B: `textType` values -- `email`, `article`, `instructions`
- Section C: `textType` values -- `article`, `opinion`
- Section D: `textType` values -- `opinion`, `formal_document`

## Accent Characters

The passages above use ASCII approximations for readability. When converting to JSON, use proper Unicode French characters:
- e with accent aigu: e -> `\u00e9` (e.g., ete -> ete with accent)
- e with accent grave: e -> `\u00e8`
- e with accent circonflexe: e -> `\u00ea`
- a with accent grave: a -> `\u00e0`
- c with cedille: c -> `\u00e7`
- i with trema: i -> `\u00ef`
- u with accent grave: u -> `\u00f9`
- o with accent circonflexe: o -> `\u00f4`

**Important**: Review each passage and restore all proper French accents when creating the JSON files. For example:
- "ete" -> "ete" (with accent on first e)
- "francais" -> "francais" (with cedille on c)
- "probleme" -> "probleme" (with accent grave on second e)
- "bibliotheque" -> "bibliotheque" (with accent grave on first e, accent grave on last e)

## Manifest File

Create `assets/data/tef_tests/manifest.json`:
```json
{
  "tests": ["tef_ce_001", "tef_ce_002", "tef_ce_003"]
}
```

Update the manifest from 2 tests to 3 since we now have 3 full practice tests.
