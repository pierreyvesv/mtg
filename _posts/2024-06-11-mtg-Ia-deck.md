---
layout: single
title:  "améliorer son deck avec l'IA"
date:   2024-06-11 14:40:46 +0100
categories: pioneer
published: true
---
![Image]({{ site.baseurl }}/assets/images/banner_1000x400.png)

# Conseils pour utiliser l'IA et améliorer vos decks

Dans cet article je vous montre comment améliorer votre deck à l'aide de l'IA tchat GPT. J'ai noté la pertinence de ses réponses sur 5.

Seul GPT4o permet d'obtenir des réponses avec les maj des derniers sets.

## les bases de l'intérogation de l'IA

- 1 définir le context
- 2 poser une question
- 3 poser une autre question ou faites corriger la réponse.

## indiquer votre deck et format.

- pour entrer votre deck , ajoutez le comme de code entre triple "back quote".
- ou indiquer lui le deck "mono green stompy Pioneer"


rentrer votre deck 

## example de demande

### Hello, please create a MTG explorer deck using the latest set Outlow thunder of Junction. The deck should be a mono green stompy deck

Qualité de la réponse: 2/5

/### Hello, create a Mono Green Stompy MTG explorer deck using the latest set Outlow thunder of Junction.

Qualité de la réponse: 2/5

il ne prend pas de cartes du set.

### Hello, create a Mono Green Stompy MTG explorer deck using deck since 2022".

Qualité de la réponse 4/5

C'est beaucoup mieux mais il ne prend toujours pas de cartes du set OTJ.

### Polukranos is a legendary creature, you set too much of them"

Qualité de la réponse 5/5

il réduit le nombre de Polukranos de 4 à 2.

{% mtg_card_link "Polukranos Reborn" %}

{% mtg_card "Polukranos Reborn" %}

### update the deck so that it can compete with the 2024 Explorer meta

Qualité de la réponse 5/5"

exemple il change les forets basique et met les terrain suivants

- 18 Forest
- 2 Boseiju, Who Endures
- 2 Lair of the Hydra
- 2 Nykthos, Shrine to Nyx

<div class="mtg-card-container">
  {% mtg_card "Boseiju, Who Endures" %}
  {% mtg_card "Lair of the Hydra" %}
  {% mtg_card "Nykthos, Shrine to Nyx" %}
</div>

### improve the sideboard to tackle with other 2024 decks like "rakdos vampire", "Izzert Phenix" or "blue white control" deck"

Qualité 5/5

il ajoute les cartes suivantes et explique pourquoi.

- 2 Carnage Tyrant
- 3 Pithing Needle

<div class="mtg-card-container">
  {% mtg_card "Carnage Tyrant" %}
  {% mtg_card "Pithing Needle" %}
</div>


## Conclusion

C'est un bon moyen de découvrir de nouvelles cartes ou idée, mais il ne révolutionnera pas la meta !
