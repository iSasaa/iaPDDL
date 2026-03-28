# Nivell Avançat II - Operació MagaBot

Aquest document detalla les especificacions per al **Nivell Avançat II** de la pràctica de Planificació Automàtica.

## Missió Global
Modelar el magatzem estel·lar amb coordinació total de robots i objectius més complexos de càrrega i ordre.

---

## Problemes a resoldre (Nivell Avançat II)

### 1. pb_avancat2a — «Evacuació Orbital Total»
- **Elements**: 6 caixes, 2 estanteries (E1, E2), 1 dispensador (D), 1 carregador (C), 2 robots (R1, R2).
- **Configuració inicial**:
  - E1 (2,4): pkg1(4kg) / pkg2(3kg) / pkg3(2kg) / pkg4(1kg).
  - E2 (5,6) i (4,6): pkg5(3kg) / pkg6(2kg).
  - D (5,1), C (5,5).
  - R1 (1,3), R2 (4,4): 30 energia inicial, 50 màxima, càrrega màxima 12kg.
- **Objectiu**: Les **6 caixes** (pkg1-6) dispensades.
- **Restriccions**: Sense restriccions d'energia ni de càrrega. No s'exigeix cap ordre de dispensació. (El domini simple hauria de ser suficient).

### 2. pb_avancat2b — «Evacuació Orbital Total Ordenada»
- **Mateixa configuració que pb_avancat2a**.
- **Restricció**: La dispensació ha de ser **ordenada de més pes a menys**.
- **En cas d'empat**: Prioritzar estanteria E1.
- **Objectiu**: Ordre: **pkg1 -> pkg2 -> pkg5 -> pkg3 -> pkg6 -> pkg4**.
- **Mètrica**: Minimitzar energia. Els robots han de tenir en compte les restriccions de **càrrega i energia**.

---

## Lliurament de la Pràctica
- **Informe**: PDF amb descripció del domini, tipus, predicats, funcions, accions, exemples d'execució i resum de resultats.
- **Models PDDL**: Domini i problemes comentats.
- **Mètode de resolució**: Explorar ENHSP i diferents estratègies/heurístics.
- **Data límit**: 15 d'abril.
