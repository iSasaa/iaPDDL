# Nivell Avançat I - Operació MagaBot

Aquest document detalla les especificacions per al **Nivell Avançat I** de la pràctica de Planificació Automàtica.

## Missió Global
Modelar el magatzem estel·lar tenint en compte els recursos crítics: **energia** i **capacitat de càrrega**.

## Regles del Magatzem (Model Avançat)
L'entorn és una graella amb els següents elements:
- **Passadís (blanc)**: Casella lliure. Només hi cap **un robot alhora**.
- **# Paret/obstacle**: Casella bloquejada.
- **[E] Estanteria**: Conté una pila de paquets.
- **[C] Punt de càrrega**: Permet recarregar energia (+20 unitats per càrrega, sense superar el màxim).
- **[R] Robot**: Agent mòbil amb bateria i capacitat limitada de càrrega (kg).
- **[D] Dispensador espacial**.

## Gestió d'Energia i Pes
- **Moure**: 
  - Cost: **2 unitats** si el robot carrega **menys de 5 kg**.
  - Cost: **3 unitats** si el robot carrega **més de 5 kg**.
- **Recarregar**: +20 unitats d'energia (sense superar el màxim).
- **Si el robot es queda sense bateria (<= 0), no pot fer cap acció.**
- **Mètrica**: Cal **minimitzar l'energia total consumida**.

---

## Problemes a resoldre (Nivell Avançat I)

### 1. pb_avancat1a — «Descens a la Bahia 66»
- **Elements**: 4 caixes, 2 estanteries (E1, E2), 1 dispensador (D), 1 carregador (C), 2 robots (R1, R2).
- **Configuració inicial**:
  - E1 (2,4): pkg1(4kg) / pkg2(3kg) / pkg3(2kg) / pkg4(1kg).
  - E2 (5,1): buida.
  - C (6,2), D (6,6).
  - R1 (1,6) i R2 (6,2): 20 energia inicial, 50 màxima, càrrega màxima 10kg.
- **Objectiu**: Dipositar els paquets **pkg1, pkg2, pkg3** (en qualsevol ordre). **pkg4** no es dispensa.
- **Mètrica**: Minimitzar energia.

### 2. pb_avancat1b — «Descens Ordenat a la Bahia 66»
- **Mateixa configuració que pb_avancat1a**.
- **Restricció**: La càrrega màxima dels robots és **8 kg**.
- **Objectiu**: Dipositar en l'ordre: **pkg1 -> pkg2 -> pkg3 -> pkg4**.
- **Mètrica**: Minimitzar energia.

### 3. pb_avancat1c — «Ruta de Transferència Sud»
- **Mateixa configuració que pb_avancat1b**.
- **Modificació**: 
  - Bateria inicial: 30 unitats.
  - Càrrega màxima: 12 kg.
- **Objectiu**: Dipositar en l'ordre invers: **pkg4 -> pkg3 -> pkg2 -> pkg1**.
- **Mètrica**: Minimitzar energia.

---
**Nota**: El model avançat té en compte el pes dels paquets i la capacitat de càrrega i la bateria dels robots.
