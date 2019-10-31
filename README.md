README


Notes & Use :

-run in commandline from folder : - bundle install - rails db:create |rails db:migrate | rails db:seed - rails s

go to http://localhost:3000 and enjoy ;)
type in http://localhost:3000/home/:id to go to the hidder url (question 2.4) where the id is an existing user id in the database
team and contact page are bootstrat templates
Projet : Gossip Project : Facebook style

Introduction Ça y est ! Tu commences à maîtriser les fondamentaux de Rails, les termes de MVC, routes, params et bases de données te sont familiers et tu commences à être fier des quelques applications que tu as codé cette semaine.
Aujourd'hui, nous allons un peu plus loin avec notre application Gossip Project, en rajoutant des features un peu plus stylées que tu pourras peut-être réutiliser pour l'architecture de ton projet final.

Pour commencer, tu peux reprendre ton app d'hier car la base de données reste globalement la même.

Ce projet sera peu guidé, je vais juste te donner une liste de fonctionnalités que ton app devra avoir et tu vas les implémenter. Celles-ci reprendrons essentiellement ce que tu as vu cette semaine et la semaine dernière.

Voici ce que tu vas devoir implémenter dans l'application :

Nous allons commencer par un CRUD succinct des utilisateurs : création Nous allons mettre en place un système de login / logout avec une page de connexion Nous allons faire en sorte que les potins créés soient associés à l'utilisateur en cours, idem pour les commentaires Nous allons rendre impossible la création de potin si l'utilisateur n'est pas connecté. Idem pour show du potin Édition et destruction des potins Puis nous allons mettre en place le système de likes 2. Le projet 2.1. Création d'utilisateurs Fais donc une création d'utilisateur, avec la notion de mot de passe. Bien entendu, le mot de passe ne sera pas stocké en clair dans ta base de données.

Le lien pour s'inscrire devra être sur la navbar. Et une fois l'utilisateur inscrit l'utilisateur sera redirigé vers la page d'accueil.

2.2. Login / logout 2.2.1. Login Nous allons mettre un écran de connexion à l'application qui demandera email et mot de passe. Cet écran va créer une session si tu arrives à authentifier l'utilisateur avec l'email ou le mot de passe, puis le rediriger vers la page d'accueil s'il arrive à se connecter. Cela sera relié au sessions_controller (méthodes #new et #create)

Aussi, à la création de l'utilisateur, il faut login l'utilisateur.

2.2.2. Logout Maintenant il faut faire sessions#destroy. Code la méthode.

2.2.3. Login / Signup Dans la majorité des sites (le notre inclus), tu pourras retrouver en haut à droite un bouton qui change en fonction de l'état de l'utilisateur

Si l'utilisateur n'est pas connecté, il y aura un dropdown "S'inscrire / Se connecter", avec un bouton pour lien (users#new) et un lien pour se connecter (sessions#new) Si l'utilisateur est connecté, il y aura un bouton pour se déconnecter (sessions#destroy) Ta mission est mettre en place ceci.

2.3. Création des potins Quand tu créés un potin, ce dernier est associé à un utilisateur de ta base. Arrange-toi pour faire en sorte que le potin créé soit associé à l'utilisateur connecté. Fais de même avec les commentaires.

2.4. Impossible de commérer sans inscription Si actuellement tu crées un potin alors que le visiteur n'est pas connecté, cela va te renvoyer un bug. C'est pas incroyable. Il faut donc faire en sorte que les méthodes #new et #create vérifient que l'utilisateur est bien connecté avant de se lancer. Si ce dernier n'est pas connecté, l'application devra le renvoyer vers l'écran de login. Fais la même pour l'affichage du potin, et la création de commentaires.

indice : before_action

2.5. Édition et destruction des potins Pour le moment, tout le monde peut éditer un potin. Arrange-toi pour que le bouton pour pouvoir éditer le potin n'apparaisse QUE si l'utilisateur connecté est le créateur du potin. De plus, les méthodes gossips#edit, gossips#update et gossips#destroy doivent vérifier que le current_user soit bien le créateur du potin : impossible de faire ces actions (afficher le formulaire d'édition du potin, pouvoir éditer le potin, pouvoir détruire le potin) si ce n'est pas le créateur qui le fait !

2.6. Like that Nous allons mettre en place un système de likes, yahou ! Il faut que l'on soit capable de liker un potin sur la page d'index des potins, sur la page des villes (qui affiche les potins pour une ville donnée), ainsi que sur la page d'affichage d'un potin.

Le like sera attribué à l'utilisateur en cours (comme Facebook) donc il est impossible de liker si le visiteur n'est pas connecté. Enfin, sur les pages mentionnées plus haut, insère aussi un petit espace qui dit le nombre de likes d'un potin.

Pour finir : il est possible de déliker un potin.

3.Rendu attendu Un gossip project qui déchire !

⚠ il est interdit d'utiliser une gem d'authentification comme Devise ou Clearance. Seule bcrypt est autorisée.