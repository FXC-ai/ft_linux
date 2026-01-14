# ft_linux

# Avant propos

Bienvenue dans ce mini-tutoriel, écrit pour vous aider — du moins je l’espère — à aller au bout du projet **ft_linux** de l’école 42. Avant de commencer, voici quelques remarques importantes.

1. **Ne prenez pas tout au pied de la lettre.** Malgré le soin apporté à la rédaction, ce document peut contenir des erreurs ou des imprécisions. Si vous repérez un problème, n’hésitez pas à **ouvrir une issue** (ou à proposer une correction).
2. Ce tutoriel s’appuie sur la version française du livre **Linux From Scratch 12.4-systemd**.
3. En pratique, le cœur du projet consiste à **suivre Linux From Scratch** (LFS) pas à pas. Le sujet **ft_linux** demande seulement de respecter quelques contraintes supplémentaires mais le guide LFS suffit presque entièrement.
    
    Voici les points sur lesquels il faut être particulièrement attentif :
    
    1. **Partitionnement** : LFS évoque une partition `/boot` mais ne l’impose pas toujours selon les choix du lecteur. Le sujet **ft_linux**, lui, exige **au moins trois partitions**, dont une **`/boot` séparée** (en plus de `/` et du swap).
    2. **Nom d’hôte (hostname)** : il doit être **votre login étudiant**.
    3. **Version du noyau** : la chaîne renvoyée par le noyau doit inclure **votre login étudiant** (ex. `Linux kernel X.Y.Z-<login>`).
    4. **Nom du binaire du noyau dans `/boot`** : il doit suivre la forme `vmlinuz-<linux_version>-<login_étudiant>`
    5. **Emplacement des sources du noyau** : elles doivent se trouver dans `/usr/src/kernel-$(version)`.

# Sujet

## Chapitre I - Introduction

Bienvenue dans **ft_linux**. Dans ce projet, vous devez construire une distribution Linux basique mais fonctionnelle. Ce sujet ne porte **pas sur la programmation du noyau (Kernel)**, mais il y est **étroitement lié**. Cette distribution sera **la base de tous vos projets liés au noyau**, car tout votre code kernel sera exécuté ici, sur votre propre distribution. Essayez d’y implémenter ce que vous voulez ou ce dont vous avez besoin. C’est votre **espace utilisateur** — prenez-en soin !

## Chapitre II - Objectifs

- Construire un noyau Linux
- Installer plusieurs binaires (voir la liste ci-dessous)
- Mettre en place une **hiérarchie de système de fichiers conforme aux [standards](https://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html)**
- Connecter le système à Internet

## Chapitre III - Instructions générales

### III.0.1 Ressources

- [**La Bible**](https://www.linuxfromscratch.org/lfs/view/stable/index.html)
- **Comment construire un noyau Linux** : il existe en ligne de nombreuses ressources détaillant, étape par étape, la configuration, la compilation et l’exécution d’un noyau Linux personnalisé.
- [**Autotools**](https://www.gnu.org/software/automake/manual/html_node/index.html#SEC_Contents)

### III.0.2 Instructions

- Pour ce projet, vous **devez utiliser une machine virtuelle** (par exemple VirtualBox ou VMWare).
- Bien que **non obligatoire**, il est **vivement recommandé** de lire certains documents de référence dès maintenant et de garder ces standards à l’esprit. Vous ne serez pas noté sur votre conformité totale à ces standards, mais ce sera une **bonne pratique**.
- Vous devez utiliser une **version du noyau ≥ 4.0** (stable ou non, du moment que c’est une version ≥ 4.0).
- Les **sources du noyau** doivent se trouver dans : `/usr/src/kernel-$(version)`
- Vous devez utiliser **au moins trois partitions** :
    - une racine (`/`)
    - une `/boot`
    - une **partition d’échange (swap)**
        
        Vous pouvez bien sûr en créer davantage si vous le souhaitez.
        
- Votre distribution doit implémenter un **chargeur de modules du noyau**, comme `udev`.
- La version du noyau doit contenir **votre login étudiant**, par exemple : `Linux kernel 4.1.2-<login_étudiant>`
- Le **nom d’hôte** de votre distribution doit également être **votre login étudiant**.
- Vous êtes libre de choisir entre un **système 32 bits ou 64 bits**.
- Vous devez utiliser un logiciel de **gestion et configuration centralisée**, comme **SysV** ou **SystemD**.
- Votre distribution doit **démarrer avec un chargeur d’amorçage**, tel que **LILO** ou **GRUB**.
- Le **binaire du noyau** situé dans `/boot` doit être nommé comme suit : `vmlinuz-<linux_version>-<login_étudiant>`
    
    Adaptez votre configuration de bootloader en conséquence.
    

## Chapitre IV - Partie obligatoire

### IV.0.1 Paquets à installer

Les paquets listés ci-dessous (comme **vim**, **bash**, **grub**, **udev**) ne sont que des **exemples**. Vous pouvez les remplacer par tout équivalent de votre choix et utiliser les **versions** que vous voulez.

- Acl

- Attr

- Autoconf

- Automake

- Bash

- Bc

- Binutils

- Bison

- Bzip2

- Check

- Coreutils

- DejaGNU

- Diffutils

- Eudev

- E2fsprogs

- Expat

- Expect

- File

- Findutils

- Flex

- Gawk

- GCC

- GDBM

- Gettext

- Glibc

- GMP

- Gperf

- Grep

- Groff

- GRUB

- Gzip

- Iana-Etc

- Inetutils

- Intltool

- IPRoute2

- Kbd

- Kmod

- Less

- Libcap

- Libpipeline

- Libtool

- M4

- Make

- Man-DB

- Man-pages

- MPC

- MPFR

- Ncurses

- Patch

- Perl)

- Pkg-config

- Procps

- Psmisc

- Readline

- Sed

- Shadow

- Sysklogd

- Sysvinit

- Tar

- Tcl

- Texinfo

- Time Zone Data

- Udev-lfs Tarball

- Util-linux

- Vim

- XML::Parser

- Xz Utils

- Zlib

> Pour les **besoins de l’évaluation**, vous devez être capable de **télécharger du code source**. Nous recommandons fortement d’installer **curl**, **wget** ou tout autre outil équivalent.
> 

> À des fins d’évaluation, vous devez également être capable d’installer des paquets, alors assurez-vous d’avoir tout ce dont vous avez besoin.
> 

## Chapitre V - Partie bonus

Vous avez un système stable ? Parfait. Maintenant, amusons-nous un peu !

Installez ce que vous voulez.

N’importe quel logiciel, une interface graphique, **N’IMPORTE QUOI**.

Faites de ce système **le vôtre**, avec **votre touche personnelle**.

Des points spéciaux seront attribués pour l’installation d’un **serveur X** et de **gestionnaires de fenêtres / environnements de bureau**, tels que **GNOME**, **LXDE**, **KDE**, **i3**, **dwm**, etc.

> ⚠️ La partie bonus ne sera évaluée **que si la partie obligatoire est PARFAITE.** « Parfaite » signifie que la partie obligatoire a été entièrement réalisée et fonctionne **sans aucun dysfonctionnement.**
> 

Si vous n’avez pas rempli **toutes** les exigences obligatoires, votre partie bonus ne sera **pas évaluée du tout.**

## Chapitre VI - Rendu et évaluation par les pairs

Soumettez votre projet dans votre dépôt Git comme d’habitude. Seul le travail présent **dans votre dépôt** sera évalué lors de la soutenance.

N’hésitez pas à vérifier soigneusement les noms de vos dossiers et fichiers pour vous assurer qu’ils sont corrects.

Pour des raisons évidentes, vous ne pousserez **pas** l’intégralité de votre machine virtuelle, mais plutôt **une somme de contrôle (checksum)** de votre image disque.

Cela peut être fait avec une commande comme :

```bash
shasum < disk.vdi
```

Gardez votre image disque quelque part pour l’évaluation par les pairs.

# Notions essentielles à connaître avant de commencer le projet

<aside>
📖 Les sources sont en bas de ce document. La plupart des réponses aux questions proviennent de wikipedia.
</aside>

## Quelle est le séquence de démarrage d’un micro-ordinateur ?

Voici la séquences des différentes couches qui interviennent lors de la mise sous tension d’un micro-ordinateur sur lequel est installé une distribution Linux :

<aside>
👉🏽 Matériel → Firmware (BIOS/UEFI) → Bootloader (ex. GRUB ; LILO est aujourd’hui rare) → Noyau Linux (souvent avec un initramfs) → Système d’initialisation (init / systemd) → Espace utilisateur (services, login, shell, etc.)
</aside>

Petite précision utile : le noyau lance en général un tout premier processus (PID 1) — **systemd** ou un autre *init* — qui se charge ensuite de démarrer le reste du système (services, montages, session…).

## Qu’est ce qu’une partition ?

En informatique, une **partition** est une section d'un support de stockage (disque dur, SSD, carte-mémoire...). Le partitionnement est l'opération qui consiste à diviser ce support en partitions dans lesquelles le système d'exploitation peut gérer les informations de manière séparée, généralement en y créant un système de fichiers, une manière d’organiser l’espace disponible.

Chaque système d’exploitation a une manière différente de désigner les partitions qu’il détecte. Les systèmes Unix ou Gnu/Linux, les désignent par un identifiant sous la forme *sdXN*, avec *X* une lettre représentant le support et *N* le numéro de la partition sur le support (par exemple *sdb3* pour la troisième partition du disque *b*).

On nomme « partition d'amorçage », ou en anglais *boot partition*, (parfois par abus de langage « partition primaire ») celle dans laquelle le micro-code, après avoir accompli l'initialisation du matériel, va chercher les *premières* instructions à exécuter pour continuer le processus de démarrage. En général, ce micro-code y trouve un chargeur d'amorçage qui lui permet, soit de démarrer l'unique système d'exploitation présent sur l'ordinateur, soit de présenter à l'utilisateur un choix entre différents systèmes chargeables.

Un support de stockage peut être partitionné pour différentes architectures. On trouve ainsi le partitionnement de type MBR (partitionnement Intel) longtemps employé sur la majorité des ordinateurs personnels de type PC pour les supports d'une capacité inférieure ou égale à 2 To (le partitionnement MBR étant limité par l'adressage en 32 bits), ou GPT pour des architectures plus récentes (Macintosh, Linux, et PC depuis les années 2010) conçues pour exploiter pleinement les supports de capacité supérieure à 2 To.

### Que signifit “monter une partition” ?

**Monter** (un système de fichiers) signifie **le rendre accessible en l’attachant à un répertoire**, appelé *point de montage*. Concrètement, quand vous montez une partition sur un dossier, son contenu apparaît **à cet endroit** dans l’arborescence (par exemple, monter `/dev/sda2` sur `/mnt/lfs` rend les fichiers de cette partition visibles via `/mnt/lfs`).

Le piège classique à éviter :

Si vous montez une partition sur un répertoire qui **contient déjà des fichiers**, ces fichiers ne sont pas supprimés, mais ils deviennent **invisibles tant que la partition reste montée**. Ils réapparaîtront après un `umount`. Autrement dit : la partition “recouvre” temporairement le contenu du dossier.

## Qu’est-ce qu’un système de fichier ?

De façon générale, un **système de fichiers** ou **système de gestion de fichiers** (SGF) est une façon de stocker les informations et de les organiser dans des fichiers sur ce que l'on appelle, en génie logiciel, des mémoires secondaires (pour le matériel informatique, il s'agit de mémoire de masse comme un disque dur, un disque SSD, une clé USB, etc.). Une telle gestion des fichiers permet de traiter, de conserver des quantités importantes de données ainsi que de les partager entre plusieurs programmes informatiques. Il offre à l'utilisateur une vue abstraite sur ses données et permet de les localiser à partir d'un chemin d'accès.

## Qu’est ce que le BIOS ?

Le **BIOS (*Basic Input Output System)*** est un firmware. Il est principalement utilisé sur les systèmes informatiques utilisant l'architecture de processeur 32 bits i686 d'Intel et 64 bits d'AMD. Il comporte un ensemble de fonctions, contenu dans la mémoire morte (ROM) de la carte mère de l’ordinateurs, lui permettant d'effectuer des opérations de base, lors de sa mise sous tension. Par exemple l'identification et l'initialisation des périphériques d'alimentation et d’entrée/sortie 
connectés et la lecture du système d'amorçage, que ce soit un secteur d'amorçage sur la mémoire de masse (disque dur, clé USB, SSD). Il permet également au système de communiquer avec les différents périphériques de la carte 
mère. Sur les cartes récentes, l'UEFI a été ajouté au BIOS pour unifier les méthodes de communication avec le noyau du système. C'est un palliatif de l'absence de spécification ouverte des pilotes de périphériques, tels qu'ils se présentent au sein du BIOS.

L'objectif du BIOS est de rendre transparente, à tout système d'exploitation, la façon dont le fabricant a développé la carte mère (quels composants il a choisis et la manière dont ils sont interconnectés). Ainsi, en utilisant les mêmes fonctions du BIOS sur deux cartes mères différentes, on obtiendra le même résultat. Les systèmes d'exploitation peuvent utiliser ces fonctions, au moins pendant les premières étapes du démarrage de l'ordinateur, et ensuite lors du fonctionnement normal pour un accès direct au matériel.

Le BIOS comprend également le logiciel nécessaire à l'amorçage de l'ordinateur. La première phase de l'amorçage  (*boot*) est la mise sous tension et le cadençage de quelques périphériques essentiels). Il vient ensuite l'auto-configuration à l'allumage (POST de l’anglais *Power-On Self-Test*), qui compte la quantité de mémoire, teste les disques et configure les composants. La séquence d'amorçage continue avec la recherche d'un système d'exploitation, dans l'ordre des périphériques disponibles, avant de le lancer.

Le BIOS prend en charge à bas niveau les communications avec les périphériques, néanmoins le système d'exploitation peut aussi s'adresser directement aux périphériques s'il le juge nécessaire. Parmi les prises en charge offertes par le BIOS, il y a celle du clavier et celle d'un mode d'affichage simplifié.

Le BIOS contient également des outils de diagnostic pour vérifier sommairement l'intégrité des composants critiques comme la mémoire, le clavier, le disque dur, les ports d'entrée/sortie, etc.

Certains paramètres du BIOS peuvent être réglés par l'utilisateur (ordre des périphériques à scruter pour détecter une zone de *boot*, type et fréquence du processeur, etc.). L'ensemble de ces paramètres est stocké de manière permanente grâce à une mémoire de taille réduite (quelques centaines d'octets) à faible consommation (type CMOS) alimentée par une pile (généralement au lithium) présente sur la carte mère. Cette mémoire est communément appelée, par abus, « CMOS ».

## Qu’est ce que l’UEFI ?

Le standard **UEFI** (**Unified Extensible Firmware Interface**) définit une interface entre le *firmware* et le système d'exploitation (OS) d'un ordinateur. Cette interface succède sur certaines cartes mères au BIOS. L'UEFI offre de nombreux avantages sur le BIOS : 

- fonctionnalités réseau en standard
- interface graphique de bonne résolution
- gestion intégrée d'installations multiples de systèmes d’exploitation et affranchissement de la limite des disques à 2,2 To.

Le BIOS, écrit en assembleur, limitait les modifications et/ou remplacements, gage de sûreté de fonctionnement et de sécurité. L'UEFI est écrit en C, ce qui rend sa maintenance plus souple et reste acceptable en raison des coûts décroissants de la mémoire. L’UEFI a été développé pour assurer l'indépendance entre système d'exploitation et plate-forme matérielle sur laquelle il fonctionne.

## Qu’est ce que GRUB ?

**GNU GRUB** (***GR**and **U**nified [**B**](https://fr.wikipedia.org/wiki/Chargeur_d%27amor%C3%A7age)ootloader*) est un programme d'amorçage de micro-ordinateur. Il s'exécute au demarrage de l'ordinateur avant le système d'exploitation proprement dit, puisque son rôle est justement d'en organiser le chargement. Lorsque l'ordinateur héberge plusieurs systèmes (multi-amorçage), il permet à l'utilisateur de choisir quel système démarrer.

C'est un logiciel libre. Il permet l'amorçage de systèmes GNU/Linux ou Windows (ainsi que d'autres systèmes), la lecture de la configuration au démarrage (pas besoin de réinstaller  GRUB dans le secteur d'amorçage après un changement de configuration, contrairement à LILO), une ligne de commande permettant de changer la configuration au démarrage et surtout la reconnaissance en natif de divers systèmes de fichiers existants. Il possède également une sorte de langage de commande simple permettant de « rattraper » un amorçage qui se serait mal passé, à la suite du mauvais adressage d'une partition, par exemple.

Grub doit être capable de reconnaître *tous* les systèmes de fichiers sur lesquels il pourrait être amené à démarrer. Il est pour cette raison beaucoup plus volumineux que LILO. Il fait partie du projet GNU.

## Qu’est ce que le kernel ?

Le kernel (noyau) est un programme qui se trouve au cœur du système d’exploitation. Il est responsable d’éviter les conflits entre les différent process en cours. Il permet la communication entre les processus. Il assure la communication entre les logiciels et le matériel. Le kernel possède sa propre région au sein de la mémoire vive. L’autre partie de la mémoire vive est disponible pour l’utilisateur.

Il assure :

- la communication entre les logiciels et le matériel ;
- la gestion des divers logiciels d’une machine (lancement des programmes, ordonnancement…) ;
- la gestion du matériel (mémoire, processeur, stockage…).

## Qu’est ce que systemD ?

**systemd** est une suite logicielle (quelques dizqines de binaires) qui fournit une gamme de composants système pour les systèmes d'exploitation Linux. Il a été conçu pour unifier la configuration et le comportement des services entre les distributions Linux Son composant principal est un système d’initialisation (init) utilisé pour amorcer l’espace utilisateur et gérer les processus utilisateurs (démarrage, arrêt, dépendance,…). Elle fournit également des remplacements pour divers démons et utilitaires, notamment la gestion des périphériques, la gestion des connexions (login), la gestion des connexions réseau et la journalisation des événements. Le “d” de “*systemd”* fait référence au fait qu’il s’agit d’un daemon.

Depuis 2015, presque toutes les distributions Linux ont adopté systemd.

Les critiques de systemd soutiennent qu’il souffre d’une inflation fonctionnelle (*feature creep*) et qu’il a nui à l’interopérabilité entre les systèmes d’exploitation de type Unix (puisqu’il ne fonctionne pas sur des dérivés Unix non Linux comme BSD ou Solaris). De plus, ils estiment que l’ensemble étendu de fonctionnalités de systemd crée une surface d’attaque plus grande. Cela a conduit au développement de plusieurs distributions Linux mineures remplaçant systemd par d’autres systèmes d’initialisation, comme SysVinit.

Il s’exécute dans le processus ayant l’id 1. C’est un système d’initialisation appelé par le kernel. 

## Qu’est ce que udev ?

**udev** est un gestionnaire intégré à Linux depuis la version 2.6. Sa fonction principale est de gérer les périphériques dans le répertoire /dev. udev s'exécute en mode utilisateur et écoute le socket netlink pour communiquer avec le noyau. Contrairement au système traditionnel de gestion de périphériques sous Linux, qui utilisait un ensemble statique de nœuds de périphériques, udev fournit dynamiquement des nœuds seulement pour les périphériques réellement présents sur le système.

Lors d'un démarrage normal d'un système Linux, le noyau monte automatiquement le système de fichiers `devtmpfs` dans le répertoire `/dev` et crée des nœuds de périphériques sur que système de fichiers virtuel pendant le processus de démarrage ou lorsqu’un périphérique est détecté ou qu'on tente d'y pour la première fois (par exemple lorsque l’on branche une clé USB). Le démon udev permet de modifier le propriétaire, de gérer les permissions des nœuds de périphériques créés par le noyau, d’en créer de nouveaux ou de créer des liens symboliques afin de faciliter la tâche de maintenance de distribution ou d'administration système.

## Qu’est ce qu’une chaîne de compilation ?

La majorité des programmes actuels sont écrits dans des langages de haut niveau  (C, le Java, …). Mais ces le processeur,  ne comprend que le langage machine. Les codes sources écrits dans des langages de 
haut niveau doivent donc être traduit en langage machine par la **chaîne de compilation**. À l'heure actuelle, la majorité des compilateurs ne traduit pas directement un langage de haut niveau en langage machine, mais passe par un langage intermédiaire : l'**assembleur**. Il va de soit que cet assembleur doit être traduit en langage machine pour être exécuté par le processeur. Tout ce qui se passe entre la compilation et l'exécution du programme est pris en charge par **trois programmes** qui forment ce qu'on appelle la **chaîne d'assemblage :**

1. Cette chaîne d'assemblage commence par le **logiciel d'assemblage** qui traduit le code assembleur en  code machine. Ce code machine est alors mémorisé dans un fichier objet.
2. Ensuite, l'**éditeur de liens** (ou linker) combine plusieurs fichiers objets en un fichier exécutable.
3. Enfin, le **chargeur de programme** (ou loader), charge les programmes en mémoire.

L'ensemble regroupant compilateur et chaîne d'assemblage, avec éventuellement des interpréteurs, est appelé la **chaîne de compilation**.

## Notions de Bash

### LC_ALL

La commande suivante permet d’avoir la sortie de `command` en français.

```bash
LC_ALL=fr_FR command
```

### Rappel commande cat

La commande suivante revient très souvent dans LFS. Soyez au clair avec son fonctionnement.

```bash
cat <nom_du_fichier> << EOF
Hello World !
EOF
```

cat va écrire dans le fichier tout le texte qu’il trouve ligne après ligne jusqu’à rencontrer EOF.

### su VS sudo

Pour suivre LFS, il est très important de faire la distinction entre l’utilisation de su et de sudo. Voici un tableau récapitulatif :

| Commande | But | Environnement de départ |
| --- | --- | --- |
| `su <user>` | changer d’utilisateur | conserve l’environnement courant |
| `su - <user>` | changer d’utilisateur en **shell de connexion** | charge l’environnement de l’utilisateur cible |
| `sudo <commande>` | exécuter une commande en tant que root (ou autre) | conserve l’environnement |
| `sudo -s` | ouvrir un shell root | conserve l’environnement courant |
| `sudo -i` | ouvrir un shell root en **shell de connexion** | charge l’environnement root |

Qu’est-ce qu shell de connexion ?

Un shell de connexion simule une connexion en affectant aux variables d’environnement des valeurs différentes. Par exemple la variable HOME sera modifié pour contenir le chemin vers le répertoire `home/<user>` qui correspond à l’utilisateur “connecté”.

## Qu’est ce qu’un fichier .vdi ?

Un fchier “.vdi” et une image disque conçu pour faire tourner des machines virtuelles sur virtual box. Virtual Box est en mesure de créer une machine virtuelle sur la base de ce “.vdi”. Le fichier contient le kernel, le nécessaire pour faire fonctionner la distribution et les fichiers créé par l’utilisateur. Une fois que notre LFS est terminée, il est possible de faire foncitonner notre distribution sur n’importe quel ordinateur sur lequel est installé Virtual Box.

# Préparation de l’environnement de développement

<aside>
⚠️ Attention ! Dans cette section, j’appelle **machine hôte** l’ordinateur *physique* sur lequel est installé VirtualBox. Par la suite la “machine hôte” désignera la machine virtuelle sur laquelle nous allons construire notre distribution.
</aside>

## Etape 0 : Installer Virtual Box

Sur Windows, VirtualBox peut nécessiter certains prérequis (selon la version : pilotes, packs additionnels, etc.). Pour ma part j’ai dû installer Microsoft Visual C++.

## Etape 1 : Installer une distribution Linux sur une machine virtuelle

Créez une machine virtuelle Debian. De mon côté, j’ai utilisé **Debian 13 (Trixie)** avec interface graphique, et un disque virtuel (VDI) de **50 Go**.

Côté ressources, ma VM avait **4 Go de RAM**, **4 vCPU**, et **deux disques virtuels de 50 Go** :

- **Disque 1** : pour Debian (la machine invitée “outil”).
- **Disque 2** : dédié à la future installation **LFS**.

<aside>
💡Pour trouver l’image correspondant à votre architecture sur windows, il suffit d’utiliser la commande `set` dans cmd.
</aside>

La machine virtuelle que j’ai utilisé comporte 4 Go de RAM, 4 CPU et deux disques durs de 50 Go. Le premier disque dur sera dédié à la machine virtuelle qui permettra la construction de notre Linux From Scratch. Le second disque sera utilisé pour notre LFS lui même.

## Etape 2 : Ajouter un disque dur virtuel supplémentaire à la VM

Dans VirtualBox : **Paramètres de la VM → Stockage → Ajouter un disque dur**. “add hard disk”.

![ajout_disk.png](ajout_disk.png)

## Etape 3 : Établir un connexion ssh entre la machine hôte et la machine virtuelle

Une connexion SSH est fortement recommandée : vous allez faire énormément de copier/coller depuis le livre LFS. Sans SSH, vous risquez de devoir retaper des centaines de commandes.

Voici les étapes à suivre pour établir une connexion ssh entre la machine et la machine virtuelle.

### 1) Dans la VM Debian (machine invitée)

Installez le serveur SSH :

- `sudo apt update`
- `sudo apt install openssh-server`

Vérifiez que le service tourne :

- `sudo systemctl status ssh`

Pare-feu (optionnel mais propre) :

- `sudo apt install ufw`
- `sudo ufw allow OpenSSH` *(ou `sudo ufw allow 22/tcp`)*
- `sudo ufw enable`
- `sudo ufw status`

### 2) Dans VirtualBox : redirection de port

Dans les réglages réseau de la VM (mode NAT), ajoutez une règle de redirection :

- **Port hôte** : `2222`
- **Port invité** : `22`
    
    ![Capture d’écran 2025-11-17 145731.png](Capture_dcran_2025-11-17_145731.png)
    

### 3) Depuis la machine hôte

Vous pouvez maintenant vous connecter à la VM avec :

`ssh -p 2222 <user>@localhost`

- `<user>` = un utilisateur existant dans Debian
- `p 2222` indique le port côté machine hôte (redirigé vers le 22 de la VM)

# Linux From Scratch !

Bon bon bon… Debian 13 est installé dans une VM maintenant nous allons construire notre propre distribution Linux From Scratch. Je ne vais pas recopier le livre ici. Je vous invite à lire et suivre les instructions qu’il contient pas à pas. Dans cette section je vais me contenter de commenter certains passages pour apporter quelques éclaircissements.

## Création d’une nouvelle partition (Section 2.4)

Le livre indique qu’« une partition de 30 Go devrait suffire ». Pour ft_linux, je recommande plutôt un **disque virtuel de 50 Go**, plus confortable (marges de manœuvre, logs, recompilations, etc.). Voici une proposition de découpage compatible avec un démarrage **en BIOS** et une partition **/boot séparée** :

| Partition | Taille | Rôle |
| --- | --- | --- |
| `/dev/sdb1` | 1 MiB | **BIOS boot partition** (nécessaire pour GRUB en mode BIOS sur disque GPT) |
| `/dev/sdb2` | 256 MiB | **/boot** (noyau `vmlinuz`, initramfs, fichiers du bootloader) |
| `/dev/sdb3` | 45 GiB | **/** (racine : l’arborescence complète du système) |
| `/dev/sdb4` | ~4–5 GiB | **swap** (mémoire d’échange) |

Ne confondez pas la partition **BIOS boot** (1 MiB) avec la partition **/boot** :

- la **BIOS boot** ne contient **pas** de système de fichiers et sert à GRUB quand on démarre en **BIOS** sur un disque **GPT** ;
- la partition **/boot**, elle, contient les fichiers nécessaires au démarrage (noyau, initramfs, etc.).

Le nom du disque à partitionner dépend de votre VM (souvent `sdb`, mais pas toujours). Pour vérifier :`lsblk` ou `sudo fdisk -l` . Ensuite j’ai utilisé fdisk pour partitionner le disque.

### Tutoriel fdisk

Tout d’abord démarez fdisk :

```bash
sudo fdisk /dev/sdX
```

Remplacez `sdX` par le bon disque (ex. `/dev/sdb`).

Pour le partitionnement sur fdisk, il faudra ensuite effectuer la suite de commande suivante :

Tout d’abord `g` permet de choisir le type de disque dur (g pour GPT). La notion GPT VS MBR est abordée plus haut.

```bash
Welcome to fdisk (util-linux 2.41).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Command (m for help): g
Created a new GPT disklabel (GUID: EACB74D2-7A4A-44C9-8655-BD190BC7E51E).
```

- Partition d’amorçage

`n` pour “new” demande à fdisk la création d’une nouvelle partition. Ici on choisit la partition no 1 qui est destiné au secteur d’amorçage. Pour choisir le type, il faut taper `t` et choisir le type avec l’indice 4 qui correspond au bios boot. `L` permet de voit la liste des différents types de partition disponibles. Notre LFS démarrera en BIOS et non pas en UEFI (cf section plus haut pour comprendre la différence).

```bash
Command (m for help): n
Partition number (1-128, default 1): 1
First sector (2048-62914526, default 2048):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-62914526, default 62912511): +1M

Created a new partition 1 of type 'Linux filesystem' and of size 1 MiB.

Command (m for help): t
Selected partition 1
Partition type or alias (type L to list all): L
  1 EFI System                     C12A7328-F81F-11D2-BA4B-00A0C93EC93B
  2 MBR partition scheme           024DEE41-33E7-11D3-9D69-0008C781F39F
  3 Intel Fast Flash               D3BFE2DE-3DAF-11DF-BA40-E3A556D89593
  4 BIOS boot                      21686148-6449-6E6F-744E-656564454649
  5 Sony boot partition            F4019732-066E-4E12-8273-346C5641494F
	[..]
Partition type or alias (type L to list all): 4
Changed type of partition 'Linux filesystem' to 'BIOS boot'.
```

<aside>
📖 Cette partition n a aucun systeme de fichier. Elle conteint core.img qui est lu par le BIOS pour demarer la machine… Elle est necessaire car le disque est en GPT.
</aside>

- Partition boot

Pour cette seconde partition nous laisserons le type par défaut : 'Linux filesystem’

```bash
Command (m for help): n
Partition number (2-128, default 2): 2
First sector (4096-62914526, default 4096):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (4096-62914526, default 62912511): +256M

Created a new partition 2 of type 'Linux filesystem' and of size 256 MiB.
```

- Partition root

Même chose que pour la précédente mais cette fois ci nous allons choisir une taille beaucoup plus grande : 47,7 G.

```bash
Command (m for help): n
Partition number (3-128, default 3): 3
First sector (528384-62914526, default 528384):

Last sector, +/-sectors or +/-size{K,M,G,T,P} (528384-62914526, default 62912511): +45G

Created a new partition 3 of type 'Linux filesystem' and of size 45 GiB.
```

- Partition swap

Pour cette dernière partition, il n’est pas nécessaire de remplir la taille car c’est la dernière et nous lui laissons tout l’espace disque restant. L’indice du type pour une partition swap est 19 dans mon cas.

```bash
Command (m for help): n
Partition number (4-128, default 4): 4
First sector (55054336-62914526, default 55054336):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (55054336-62914526, default 62912511):

Created a new partition 4 of type 'Linux filesystem' and of size 4.7 GiB.

Command (m for help): t
Partition number (1-4, default 4): 4
Partition type or alias (type L to list all): L
[..]
 17 HP-UX data                     75894C1E-3AEB-11D3-B7C1-7B03A0000000
 18 HP-UX service                  E2A1E728-32E3-11D6-A682-7B03A0000000
 19 Linux swap                     0657FD6D-A4AB-43C4-84E5-0933C84B4F4F
[..]
Partition type or alias (type L to list all): 19

Changed type of partition 'Linux filesystem' to 'Linux swap'.
```

Enfin la dernière étape consiste à écrire sur le disque toutes les partitions que nous venon de créer à l’aide de la commande `w` de fdisk :

```bash
Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```

Ensuite il faudra ajouter un système de fichier aux partitions avec les commandes `mkfs -v -t ext4 /dev/*<xxx*` et swap : `mkswap /dev/*<yyy>`.* Mais le livre LFS est parfaitement clair à ce sujet. Je ne reviens donc pas sur ce point. Pour observer les filesystems : `findmnt <chemin_vers_le_dossier>`

## **Montage de la nouvelle partition (Section 2.7)**

### Partition root

Il faut garder en tête que le montage d’une partition n’est **pas permanent** : après chaque arrêt/redémarrage de la VM, la partition n’est plus montée, et son contenu n’est donc plus visible tant que vous ne la remontez pas. Pour éviter de refaire le montage à la main à chaque fois, on peut ajouter une entrée dans `/etc/fstab`, le fichier qui décrit quelles partitions doivent être montées automatiquement au démarrage (systemd s’appuie sur ce fichier pour générer les points de montage).

Dans notre cas, pendant la construction de LFS, on souhaite surtout remonter la partition “root LFS” (souvent `/dev/sdb3`) sur le répertoire `/mnt/lfs`.

Le livre propose d’ajouter une ligne de ce type :

```
/dev/<xxx>  /mnt/lfs  ext4  defaults  1  1
```

Le problème, c’est que le nom `/dev/sdb3` peut changer d’un démarrage à l’autre (ordre de détection des disques), ce qui peut empêcher le montage automatique et, selon la configuration, bloquer le démarrage en mode “emergency”.

La solution la plus fiable est d’utiliser l’**UUID** (identifiant unique qui ne change pas) :

```bash
sudo blkid /dev/sdb3
```

Puis dans `/etc/fstab` :

```
UUID=<uuid_de_sdb3>  /mnt/lfs  ext4  defaults  1  1
```

Une alternative acceptable, si vous voulez éviter qu’un échec de montage perturbe le démarrage, est d’ajouter une entrée “tolérante” :

```
UUID=<uuid_de_sdb3>  /mnt/lfs  ext4  defaults,nofail,x-systemd.device-timeout=1,x-systemd.automount  0  0
```

Dans ce cas, la partition sera montée automatiquement **à la première tentative d’accès** à `/mnt/lfs`.

### Partition swap

LFS nous propose d’activer le swap sur la machine hôte à l’aide de cette commande : `/sbin/swapon -v /dev/<zzz>`. C’est plus que probablement inutile. Notre distribution hôte possède très probablement déjà un swap. `lsblk` peut en témoigner. Cette activation ne sera véritablement utile que lorsque nous démarrerons notre distribution à la toute fin du projet.

## **Remarques techniques sur la chaîne de compilation (Partie II de LFS)**

Cette page est la plus importante de tout de livre. Elle explique la notion essentielle à comprendre pour la construction d’une nouvelle distribution Linux. Il indispensable mon sens de la lire attentivement et e bien l’appréhender. Je me propose ici de faire une explication équivalente dans le but de faciliter votre compréhension. Il est plus que possible que cette partie contienne quelques inexactitudes.

### Le chroot

Le chroot consiste à dire au système que le “/” a changé de dossier. Le dossier racine n’est plus “/” mais est /mnt/lfs dans notre cas.

### La “Canadian Cross Compilation”

Cette Canadian Cross Compilation imagine un scenario à trois machines : A, B et C. Au départ nous disposons uniquement du compilateur de la machine A.

A chaque étape nous avons 3 éléments à prendre en considération :

- La machine qui compile le nouveau compilateur (Construction)
- La machine qui utilisera ce nouveau compilateur (Hôte)
- La machine pour laquelle le nouveau compilateur sera en mesure de produire des binaires (Cible)

Voici les 3 étapes de compilation :

| Étape | Construction | Hôte | Cible | Action |
| --- | --- | --- | --- | --- |
| 1 | A | A | B | Construire un compilateur croisé cc1 avec ccA sur la machine A. |
| 2 | A | B | C | Construire un compilateur croisé cc2 avec cc1 sur la machine A. |
| 3 | B | C | C | Construire le compilateur ccC avec cc2 sur la machine B. |

Étape 1 : La machine A utilise ccA pour produire un nouveau compilateur : cc1. cc1 est capable de tourner sur la machine A et produit des exécutables pour la machine B.

Étape 2 : La machine A utilise cc1 pour produire un nouveau compilateur : cc2. cc2 est capable de tourner sur la machine B et produit des exécutables pour la machine C.

Étape 3 : La machine B utilise cc2 pour produire un nouveau compilateur : ccC. ccC est capable de tourner sur la machine C et produit des exécutables pour la machine C.

C’est clair ? Non ? Ba il faut relire 😊.

### **La compilation croisée dans LFS**

Maintenant nous allons nous intéresser à la compilation croisée dans le cadre de notre LFS. Le sommaire nous fait constater que GCC est compilé 3 fois exactement comme dans l’exemple théorique précedent. Voici les 3 compilations de gcc :

- [GCC-15.2.0 — Passe 1](https://fr.linuxfromscratch.org/view/lfs-12.4-systemd-fr/chapter05/gcc-pass1.html)
- [GCC-15.2.0 — Passe 2](https://fr.linuxfromscratch.org/view/lfs-12.4-systemd-fr/chapter06/gcc-pass2.html)
- [GCC-15.2.0](https://fr.linuxfromscratch.org/view/lfs-12.4-systemd-fr/chapter08/gcc.html) (nous l’appellerons gcc-lfs)

Voici les 3 étapes de compilation impémentées pour LFS :

| Étape | Construction | Hôte | Cible | Action |
| --- | --- | --- | --- | --- |
| 1 | Debian | Debian | Chroot | Construire un compilateur croisé gcc-Passe1 avec le gcc de la Debian sur la Debian. |
| 2 | Debian | Chroot | LFS | Construire un compilateur croisé gcc-Passe2 avec gcc-Passe1 sur la Debian. |
| 3 | Chroot | LFS | LFS | Construire le compilateur gcc-lfs avec gcc-Passe2 dans le Chroot. |

On retrouve donc les 3 mêmes étapes que dans la “Canadian Cross” : 

Étape 1 : La Debian utilise son compilateur pour produire un nouveau compilateur : gcc-Passe1. gcc-Passe1 est capable de tourner sur la Debian et produit des exécutables pour le Chroot.

Étape 2 : La Debian utilise gcc1-Passe1 pour produire un nouveau compilateur : gcc-Passe2. gcc-Passe2 est capable de tourner dans le Chroot et produit des exécutables pour LFS.

Étape 3 : Le Chroot utilise gcc-Passe2 pour produire un nouveau compilateur : gcc-lfs. gcc-lfs est capable de tourner dans LFS et produit des exécutables pour LFS.

Oui mais… LFS et le Chroot sont identiques ! Ce sont les deux même systèmes. D’ailleurs Le tableau de l’implémentation de la compilation croisé est celui-ci dans le livre :

| Étape | Construction | Hôte | Cible | Action |
| --- | --- | --- | --- | --- |
| 1 | pc | pc | lfs | Construire un compilateur croisé cc1 avec cc-pc sur pc. |
| 2 | pc | lfs | lfs | Construire un compilateur cc-lfs avec cc1 sur pc. |
| 3 | lfs | lfs | lfs | Reconstruire (et éventuellement tester) cc-lfs avec lui-même sur lfs. |

Aucune distinction n’est faite entre LFS et le Chroot.

<aside>
⁉️ Mais ! A quoi sert la dernière étape puisque nous disposons déjà d’un compilateur capable de tourner sur LFS et de produire des binaires pour LFS ?
</aside>

Mais ? A quoi sert la dernière étape ? Effectivement, en observant attentivement le tableau, dés la deuxième étape nous avons un compilateur capable de tourner dans notre distribution et de produire des éxécutables pour notre distribution. A quoi bon continuer ? On pourrait même pousser la question encore plus loin. Pourquoi ne pas tout faire en une seule étape ? La  Debian utiliserai son compilateur pour produire un nouveau compilateur cc-lfs. cc-lfs serait capable de tourner dans LFS et produirait des exécutables pour LFS.

| Étape | Construction | Hôte | Cible | Action |
| --- | --- | --- | --- | --- |
| 1 | pc | lfs | lfs | Construire un compilateur cc-lfs avec cc-pc sur pc. |

Eh bien la réponse est finalement assez courte : à cause des dépendances circulaires. Je m’explique…

Le langage C définit une bibliothèque standard, appelée **glibc**. Cette bibliothèque doit être compilée pour la machine LFS, c'est-à-dire à l’aide du compilateur croisé cc1. Mais le compilateur lui-même utilise une bibliothèque interne  : **libgcc** qui ****doit être liée à la bibliothèque **glibc** pour fonctionner correctement ! De plus, la bibliothèque standard C++ (**libstdc++**) a aussi besoin d'être associée à **glibc**. La solution à ce problème consiste d'abord à construire une **libgcc** inférieure basée sur cc1, qui ne dispose pas de fonctionnalités avancées comme les threads et le traitement des exceptions, puis de construire **glibc** avec ce compilateur inférieur (**glibc** elle-même n'étant pas inférieure !), puis de construire **libstdc++**. Cette bibliothèque ne dispose pas des fonctionnalités avancées de **libgcc**.

La conséquence du paragraphe précédent est que cc1 est incapable de construire une **libstdc++** complètement fonctionnelle avec la **libgcc** dégradée, mais cc1 est le seul compilateur disponible pour construire les bibliothèques C/C++ à la deuxième étape. Comme indiqué, nous ne pouvons pas exécuter cc-lfs sur pc (la distribution hôte) car il peut nécessiter certaines bibliothèques, du code ou des données qui ne sont pas disponibles sur « la construction » (la distribution hôte). Ainsi, lorsque nous construisons la deuxième étape de gcc, nous remplaçons le chemin de recherche des bibliothèques pour se lier à **libstdc++** de la **libgcc** nouvellement reconstruite au lieu de l'ancienne construction dégradée. Cela rend la **libstdc++** reconstruite complètement fonctionnelle.

## **Préparer les systèmes de fichiers virtuels du noyau (Section 7.3) et Entrer dans l'environnement chroot (Section 7.4)**

L’entrée dans le chroot (= “change root”) est la première fois que l’on “s’isole” du système hôte pour utiliser notre compilateur croisé qui nous permettra de compiler les binaires définitifs qui seront utilisés par notre distribution LFS. MAIS (!), notre LFS ne possède pas encore son propre noyau ni ses propres systèmes de fichier virtuels qui permettent la communication avec le dit noyau. Nous sommes donc obligé d’emprunter les systèmes de fichier virtuels du système hôte et d’utiliser son noyau. Les montages `proc`, `sysfs`, `devpts`, `tmpfs` sont les **systèmes de fichiers virtuels** fournis par le noyau (en mémoire), nécessaires pour que les programmes *dans le chroot* puissent “parler” au noyau (processus, périphériques, pseudo-tty, etc.). LFS le dit explicitement : ces FS sont virtuels et doivent être montés dans l’arborescence `$LFS` pour que les applis du chroot les trouvent.

> Les applications qui tournent en espace utilisateur utilisent différents systèmes de fichiers créés par le noyau pour communiquer avec le noyau lui-même. Ces systèmes de fichiers sont virtuels du fait qu'ils n’utilisent aucun espace disque. Le contenu de ces systèmes de fichiers réside en mémoire. Ces systèmes de fichiers doivent être montés dans l’arborescence de $LFS pour que les applications puissent les trouver dans l’environnement chroot.
> 

A chaque redémarrage, il sera nécessaire de monter à nouveau ces systèmes de fichier virtuels avant d’entrer à nouveau dans le chroot. C’est pourquoi je remet ici les commandes nécessaires pour faire cela afin que vous n’ayez pas à fouiller dans le livre à chaque redémarrage de votre VM. Ces commandes doivent donc être exécuté sur le système hôte en tant que `root` :

- Tout d’abord le montage des systèmes de fichier :

```bash
mount -v --bind /dev $LFS/dev

mount -vt devpts devpts -o gid=5,mode=0620 $LFS/dev/pts
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run

if [ -h $LFS/dev/shm ]; then
install -v -d -m 1777 $LFS$(realpath /dev/shm)
else
mount -vt tmpfs -o nosuid,nodev tmpfs $LFS/dev/shm
fi
```

> Le montage avec --bind est un type spécial de montage qui vous permet de créer le miroir d'un répertoire ou d'un point de montage à un autre endroit.
> 

`mount --bind /dev $LFS/dev` n’attache pas une partition : c’est un **bind mount** = “deuxième vue” du même arbre de répertoires (ici, on “revois” `/dev` de l’hôte à l’intérieur de `$LFS/dev`).

- Ensuite l’entrée dans chroot :

```bash
chroot "$LFS" /usr/bin/env -i \
HOME=/root \
TERM="$TERM" \
PS1='(lfs chroot) \u:\w\$ ' \
PATH=/usr/bin:/usr/sbin \
MAKEFLAGS="-j$(nproc)" \
TESTSUITEFLAGS="-j$(nproc)" \
/bin/bash --login
```

## **Configuration générale du réseau (Section 9.2)**

Cette section est importante car elle permettra à notre futur système LFS de se connecter à internet. Comme le livre propose différentes solutions de configuration, je vous remet ici celle qui est la plus pertinente pour le projet ft_linux. 

- **9.2.1.3. Configuration du DHCP.**

```bash
cat > /etc/systemd/network/10-eth-dhcp.network << "EOF"
[Match]
Name=<network-device-name>

[Network]
DHCP=ipv4

[DHCPv4]
UseDomains=true
EOF
```

`ip link` permet de connaitre `<network-device-name>`

- **9.2.3. Configurer le nom d'hôte du système**

```bash
echo <student_login> > /etc/hostname
```

<aside>
⚠️ Attention cette commande  permet de répondre à l’une des éxigences du sujet : “Le **nom d’hôte** de votre distribution doit également être **votre login étudiant**.” !

</aside>

- **9.2.4. Personnaliser le fichier /etc/hosts**

```bash
 cat > /etc/hosts << "EOF"
# Début de /etc/hosts

127.0.0.1 <login_student>.localhost.ch <login_student>
::1       ip6-localhost ip6-loopback
ff02::1   ip6-allnodes
ff02::2   ip6-allrouters

# Fin de /etc/hosts
EOF
```

## L**inux-6.16.1** (Section 10.3)

La section est parfaitement claire dans le livre. Cependant je vais attirer votre attention sur 3 consignes du sujet, qui doivent être remplis à ce moment :

- Consigne 1 : La version du noyau doit contenir **votre login étudiant**, par exemple : `Linux kernel 4.1.2-<login_étudiant>`

Il faut configurer cela dans le menu de configuration du noyau `make menuconfig`. Voici quelques captures d’ecran pour vous montrer comment faire :

![ecran1-menuconfig-lfs.jpg](ecran1-menuconfig-lfs.jpg)

![ecran2-menuconfig-lfs.jpg](ecran2-menuconfig-lfs.jpg)

![Ne pas oublier le “-” avant le login !](ecran3-menuconfig-lfs.jpg)

Ne pas oublier le “-” avant le login !

- Consigne 2: Vous devez utiliser **au moins trois partitions** : une racine (`/`), une `/boot`, une **partition d’échange (swap)**

LFS vous prévient mais je le répète. Notre dossier /boot doit être monté sur une partition séparée de notre partition utilisateur (root). Cela signifie qu’avant d’entrer dans le chroot, il faut monter la partition boot avec le dossier boot qui se trouve dans `/mnt/lfs` . Attention la partition root doit être monté en premier pour pouvoir voir les dossiers qu’elle contient dans `/mnt/lfs` Pour cela :

```bash
mount /dev/sdXN /mnt/lfs/boot
```

- Consigne 3 : La version du noyau doit contenir **votre login étudiant**, par exemple : `Linux kernel 4.1.2-<login_étudiant>`

LFS nous dit “Vous pouvez changer le nom du fichier ci-dessous selon votre goût”. Il est donc essentiel d’adapter la commande du livre commesuit : `cp -iv arch/x86/boot/bzImage /boot/vmlinuz-<linux_version>-<login_étudiant>` .

- Consigne 4 : Les **sources du noyau** doivent se trouver dans : `/usr/src/kernel-$(version)`. C’est le moment de le faire !

## **Utiliser GRUB pour paramétrer le processus de démarrage (Section 10.4)**

LFS nous propose ce template :

```bash
cat > /boot/grub/grub.cfg << "EOF"
# Début de /boot/grub/grub.cfg
set default=0
set timeout=5

insmod part_gpt
insmod ext2

set root=(hd0,2)

set gfxpayload=1024x768x32

menuentry "GNU/Linux, Linux 6.16.1-lfs-12.4-systemd" {
        linux   /boot/vmlinuz-6.16.1-lfs-12.4-systemd root=/dev/sda2 ro
}
EOF
```

Dans le projet il est nécessaire de faire quelques adaptations :

- `set root=(hd0,2)` : je conseille de remplacer ceci par `search -fs-uuid —set=root <UUID>` . Cela garantira le bon fonctionnement du systeme. Le risque etant que le disque virtuel change d’ordre lors du démarrage de la VM.
- `linux   /boot/vmlinuz-6.16.1-lfs-12.4-systemd root=/dev/sda2 ro` doit être remplacé par `linux   /boot/vmlinuz-6.16.1-<student_login> root=PARTUUID=<PARTUUID> ro`

Pour obtenir l’UUID et le PARTUUID du vdi que vous utilisez, il faut utiliser la commande `blkid` sur la machine hôte.

# Grille de correction

| Question | Commande(s) | Explication |
| --- | --- | --- |
| Le noyau est-il un noyau Linux ? | `uname -s` | Affiche le nom du noyau.  |
| La version Linux est-elle supérieure à 4.x ? | `uname -r` | Affiche la version du noyau (release). Doit être `>4`. |
| Les sources sont-elles dans `/usr/src/linux-x.x` ? | `ls /usr/src` | Liste le contenu de `/usr/src` pour vérifier la présence du répertoire des sources du noyau. |
| Vérifier la version du kernel dans les logs | `journalctl -k -b \| grep -m1 "Linux version"` ou `dmesg \| grep -m1 "Linux version"` | journalctl suffit, la première ligne montre la version du noyau |
| Y a-t-il au moins 3 partitions (root, `/boot`, swap) ? | `lsblk swapon --show` | `lsblk` affiche disques/partitions et points de montage (utile pour voir `/` et `/boot`). `swapon --show` affiche les espaces swap actifs. |
| Y a-t-il un chargeur de modules (type udev) ? | `systemctl status systemd-udevd` | Vérifie que le démon udev (gestion des périphériques) est présent et actif via systemd. |
| Y a-t-il un bootloader (LILO / GRUB / …) ? | `grub-install --version` | Affiche la version de `grub-install`. Si la commande existe, GRUB est installé. |
| Vérifier le nom du binaire du kernel dans `/boot` | `ls /boot` | Liste les fichiers de `/boot` pour vérifier la présence et le nom du noyau (`vmlinuz-<version>-<login>`). |
| Y a-t-il un gestionnaire de démons ? (SysV, systemd, …) | `ps -p 1` | Affiche le nom de la commande du PID 1 (init). Dans notre cas : `systemd` . |
| Un éditeur est-il présent ? | `vim ft_linux_basic.sh` | Ouvre un fichier avec Vim pour vérifier que l’éditeur est installé et fonctionnel. |
| Internet fonctionne-t-il ? | `ping -c 3 1.1.1.1`  `ping -c 3 google.com` | Ping vers une IP (teste réseau sans DNS) puis vers un nom de domaine (teste DNS + réseau). `-c 3` envoie 3 paquets. |
| Installer le paquet **screen** (source GNU) | `wget https://ftp.gnu.org/gnu/screen/screen-5.0.1.tar.gz tar -xf screen-5.0.1.tar.gzcd screen-5.0.1 ./configure \ --prefix=/usr \ --disable-pam \ --enable-socket-dir=/run/screen \ --with-pty-group=5 make make install` | Télécharge l’archive, l’extrait, configure la compilation avec options (installation dans `/usr`, PAM désactivé, socket dans `/run/screen`, groupe pty), compile puis installe. |

# Sources

## Documentation officielle

https://fr.linuxfromscratch.org/lfs/

https://fr.linuxfromscratch.org/lfs/lire/

## Projets d’autres étudiants

[GitHub - phillipjacobs/ft_linux: My own linux distribution. :)](https://github.com/phillipjacobs/ft_linux)

Repo pédagogique

[GitHub - jbettini/ft_linux](https://github.com/jbettini/ft_linux)

Tutoriel complet pour le projet !

[GitHub - grumbach/ft_linux: Making my own linux distribution (LFS)](https://github.com/grumbach/ft_linux)

Rassemble l’ensemble des scripts nécessaires

[GitHub - 2ndcouteau/ft_linux: All the tools and scripts to reproduce LFS easily](https://github.com/2ndcouteau/ft_linux/tree/master)

Rassemble les scripts nécessaires

[GitHub - rbourgeat/ft_linux: This subject is not about Kernel programming, but it’s highly related. This distro will be the base for all your kernel projects, because all your kernel-code will be executed here, on your distro.](https://github.com/rbourgeat/ft_linux/tree/main)

Scripts de la correction

[GitHub - ClemaX/ft_linux: Build scripts for my custom Linux From Scratch.](https://github.com/ClemaX/ft_linux)

[GitHub - Jibus22/ft_linux: Build of a LFS sytem](https://github.com/Jibus22/ft_linux)

## Tutoriels youtube

https://www.youtube.com/watch?v=6WI4FZNYAPI

https://www.youtube.com/watch?v=ceIvnPjPA7U&t=1s

https://www.youtube.com/watch?v=Srq7mpu9tOw&list=PLjAHiXDnp3JlH98GKJvwD1oa7-9pA_iNt

## Pages web

https://wiki.archlinux.org/title/Udev_(Fran%C3%A7ais)

https://alexhost.com/fr/faq/comment-installer-et-configurer-un-serveur-ssh-sur-debian/

https://fr.wikipedia.org/wiki/BIOS_(informatique)

https://www.tech2tech.fr/quelle-est-la-difference-entre-le-format-gpt-et-mbr-pour-un-disque/

https://codefinity.com/blog/MBR-vs-GPT:-Understanding-Disk-Partitioning-Schemes?utm_source=google&utm_medium=cpc&utm_campaign=21193856569&utm_content=&utm_term=&dki=&gad_source=1&gad_campaignid=21183361821&gclid=CjwKCAiA64LLBhBhEiwA-Pxgu4X13R60mU89BX_oZxIivooM3_XN8INRowW7SePnqJVFnio1AJbAwRoC-V4QAvD_BwE

https://www.tech2tech.fr/les-differences-entre-bios-et-uefi/

https://fr.wikipedia.org/wiki/Noyau_de_syst%C3%A8me_d%27exploitation

https://fr.wikipedia.org/wiki/Partition_(informatique)

https://fr.wikipedia.org/wiki/Point_de_montage

https://fr.wikibooks.org/wiki/Les_syst%C3%A8mes_d%27exploitation/Assembleur_et_%C3%A9dition_des_liens

https://docs.fileformat.com/fr/disc-and-media/vdi/

https://man.archlinux.org/man/fdisk.8

https://doc.ubuntu-fr.org/fdisk

https://unix.stackexchange.com/questions/35338/su-vs-sudo-s-vs-sudo-i-vs-sudo-bash

https://www.ionos.fr/digitalguide/serveur/configuration/commande-linux-sudo/

https://docs.oracle.com/en/operating-systems/oracle-linux/6/admin/mount-filesysystem.html?utm_source=chatgpt.com

https://www.linuxfromscratch.org/blfs/view/stable/general/screen.html

https://www.linuxtricks.fr/wiki/screen-un-multiplexeur-de-terminal-pratique

https://lecrabeinfo.net/tutoriels/verifier-integrite-calculer-empreinte-checksum-md5-sha1-sha256-fichier-windows/
