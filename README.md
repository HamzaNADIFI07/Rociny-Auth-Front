# Rociny Auth Back — Initial Setup

Rociny App Front est la base du projet mobile Flutter de Rociny.
Cette première version constitue le socle du frontend mobile de l’application de la page d'authentification.
Elle inclut la structure Flutter initiale, la configuration du projet et les instructions pour le lancer sur simulateur iOS.

### Fonctionnalités principales

- Écran complet de connexion avec `email` et `mot de passe`

- Gestion d’état via BLoC `Cubit` pour séparer l’UI de la logique

- Appel API vers le backend avec gestion du JWT

- Architecture claire : UI → Cubit → Repository → API → Backend

### Installation et Configuration

1. Cloner le projet
```bash
git clone https://github.com/HamzaNADIFI07/Rociny-Auth-Front.git
cd rociny-app-front
```

2. Installer Flutter (si ce n’est pas déjà fait)

- Si Flutter n’est pas installé, veuillez suivre la documentation officielle :

    `https://docs.flutter.dev/get-started/install`

- Vérifier l'environnement :

```bash
flutter doctor
```
3. Lancer le simulateur iOS

    - Option 1 — via le terminal
    ```bash
    open -a Simulator
    ```
    - Option 2 — via Xcode
    ```mermaid
    graph TD;
        A[Ouvre Xcode] --> B[Xcode];
        B[Xcode] --> C[Open Developer Tool];
        C[Open Developer Tool] --> D[Simulator];
    ```

4. Lancer l’application Flutter

```bash
cd rociny_app_front
```
Puis lance : (L’application se lancera automatiquement dans le simulateur iOS par défaut.)

```bash
flutter run
```
Si plusieurs devices sont disponibles :
```bash
flutter devices
```
```bash
flutter run -d "iPhone 15 Pro"
```
5. Test de la fonctionnalité de connexion
Pour tester la connexion réelle avec le backend, il faut d’abord réveiller le serveur hébergé (Render met en veille le serveur) :

    1. Ouvrir le lien du backend dans le navigateur :
        ```
        https://rociny-auth-back.onrender.com/auth
        ```
    2. Attendre quelques secondes que le serveur se lance.

    3. Une fois la page ouverte, relancer l'application Flutter et effectue la connexion depuis l'écran de login.

### Structure du projet

```bash
lib/
├── components/
│   └── button.dart           # Bouton principal réutilisable
├── logic/
│   ├── login_cubit.dart      # Gestion de l'état de connexion
│   └── login_state.dart      # Définition des états de la page de connexion
├── ui/
│   └── login_page.dart       # Page de connexion
├── data/
│   └── data.auth.dart        # Gestion des modèles et méthodes liées à l'authentification
├── main.dart                 # Point d'entrée, initialisation des Cubits et du backend
├── app.dart                  # Racine de l'application (MaterialApp + thème)
└── api.dart                  # Configuration des appels API (baseUrl, endpoints, headers)

```


### Convention de nommage des commits
Ce projet suit la convention Conventional Commits.

1. Format général:
```bash
<type>(scope?): <message clair et concis>
```
2. Types courants:

| Type       | Signification                                              |
| ---------- | ---------------------------------------------------------- |
| `feat`     | Nouvelle fonctionnalité                                    |
| `fix`      | Correction de bug                                          |
| `docs`     | Modification de la documentation                           |
| `style`    | Changement de formatage (indentation, espaces, etc.)       |
| `refactor` | Refactorisation sans ajout ni correction de fonctionnalité |
| `perf`     | Amélioration des performances                              |
| `test`     | Ajout ou modification de tests                             |
| `chore`    | Tâches diverses (build, dépendances, config, etc.)         |

3. Exemples:
```
feat(auth): add JWT strategy and login endpoint
fix(users): correct password hashing in user service
docs(readme): add commit naming convention
refactor(core): move config module to separate folder
chore(deps): update NestJS to v11
```

