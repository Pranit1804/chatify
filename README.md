1. Auto generate the code of dependencies graph for the application, by running following:

```sh
fvm flutter packages pub run build_runner build --delete-conflicting-outputs 
```
Note: `--delete-conflicting-outputs` is optional to override the conflicts in the graph.# chatify