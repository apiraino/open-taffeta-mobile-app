# Open Taffeta mobile app

This mobile App is the client in a project to manage a door entrance infrastruture.

The present companion mobile app is strictly interwined to this [backend](https://github.com/apiraino/open-taffeta); they  can only work together, in addition to the hardware managing the door itself.

Out of this context, the codebase is good for educational purposes only. However, with some effort on the hardware interfacing part, this project could be ported to other environments.

If you're interested in an overview of the project (mostly focused on the Rust backend), you can have a look at this [talk](https://apiraino.github.io/talks/open-taffeta-rustlab-19/index.html).

## Config
You must create your configuration `config.json` from the config template `config.json.dist` (the new file should reside in the same directory). Customize the values as needed.

## Tips

### Code generation
Ref :
- JSON [documentation](https://flutter.io/json/)

Generate : `flutter packages pub run build_runner build` | `flutter packages pub run build_runner watch`

## TODO

- Implement ClientID
- [Change package name](https://stackoverflow.com/questions/51534616/how-to-change-package-name-in-flutter)
- Add screenshots! Everybody love screenshots!

## Credits

The original application code repository repo is [here](https://gitlab.com/apiraino/flutter_door_buzzer). This repository contains an almost full rewrite, accomplished by [@axellebot](https://github.com/axellebot) - thanks for the effort! 🙏
