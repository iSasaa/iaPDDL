# Nivell Simple - Operació MagaBot

Aquest document detalla les especificacions per al **Nivell Simple** de la pràctica de Planificació Automàtica.

## Missió Global
Mobilitzar la flota de robots del magatzem estel·lar i assegurar que cada paquet arribi al seu destí (dispensador) adequadament.

## Regles del Magatzem (Model Simple)
L'entorn és una graella amb els següents elements:
- **Passadís (blanc)**: Casella lliure. Només hi cap **un robot alhora**.
- **# Paret/obstacle**: Casella bloquejada.
- **[E] Estanteria**: Conté una pila de paquets. Els robots han d'estar en una casella **adjacent** per operar.
- **[R] Robot**: Agent mòbil. En el nivell simple, no té restriccions d'energia ni de pes.
- **[D] Dispensador espacial**: On s'han de portar els paquets. El robot hi opera des d'una casella adjacent. Una vegada dispensat, el paquet no es pot recuperar.

## Accions Disponibles
1. **Moure**: D'una casella a una adjacent lliure.
2. **Agafar (Pick)**: El paquet del capdamunt d'una estanteria adjacent i posar-lo al capdamunt de la pila del robot.
3. **Descarregar (Drop)**: El paquet del capdamunt del robot al capdamunt de la pila d'una estanteria adjacent.
4. **Dispensar**: El paquet del capdamunt del robot al dispensador adjacent. Acció irreversible.

## Variants d'Ordenació
En les variants ordenades, els paquets han d'arribar al dispensador en un ordre seqüencial especificat a l'objectiu.

---

## Problemes a resoldre (Nivell Simple)

### 1. pb_simplea — «Evacuació Sector Alfa»
- **Elements**: 3 caixes (pkg1, pkg2, pkg3), 2 estanteries (E1, E2), 1 dispensador (D), 2 robots (R1, R2).
- **Configuració inicial**:
  - E1 (2,2): pkg2 (bottom) · pkg1 (top)
  - E2 (2,5): pkg3
  - D (4,4)
  - R1 (6,1), R2 (5,5)
- **Objectiu**: Dipositar els tres paquets (sense ordre).

### 2. pb_simpleb — «Evacuació Sector Alfa Ordenada»
- **Mateixa configuració que pb_simplea**.
- **Objectiu**: Dipositar en l'ordre: **pkg2 -> pkg1 -> pkg3**.

### 3. pb_simplec — «Evacuació Sector Alfa Ordenada i selectiva»
- **Mateixa configuració que pb_simplea**.
- **Restricció**: `pkg1` està contaminat i **no** s'ha de dispensar.
- **Objectiu**: Dipositar en l'ordre: **pkg2 -> pkg3**.

---
**Nota**: El model simple no té en compte pesos ni bateria. Qualsevol robot pot transportar qualsevol paquet i moure's infinitament.
