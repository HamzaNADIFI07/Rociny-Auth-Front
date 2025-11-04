# Rociny Auth Back — Initial Setup

Rociny App Front est la base du projet mobile Flutter de Rociny.
Cette première version constitue le socle du frontend mobile de l’application de la page d'authentification.
Elle inclut la structure Flutter initiale, la configuration du projet et les instructions pour le lancer sur simulateur iOS.

### Installation et Configuration

1. Cloner le projet
```bash
git clone https://github.com/HamzaNADIFI07/rociny-app-front
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

