# `Hive Todo Example`

## `Made With Hive Database`

## This project about Store data into Databse Using Hive Database

- **STEPS** :

> **Create Model file Which Contain All Database Columns**

- In this file add part **'todo.g.dart'** statement

        Example : Todo.dart

            part 'todo.g.dart';

            @HiveType(typeId: 0)
            class Todo {

                @HiveField(0)
                String title;
                @HiveField(1)
                String desc;

                Todo({
                    required this.title,
                    required this.desc,
                });
            }

> after creating model file

- Create auto generated file

  - Run this command For create Auto Genatated file :

    - `flutter packages pub run build_runner build`

> After create auto generated file

- Init hive data in **main()**

        WidgetsFlutterBinding.ensureInitialized();
        await Hive.initFlutter();
        Hive.registerAdapter(TodoAdapter());
        await Hive.openBox<Todo>('todos');

- **Hive.openBox** is a method for create table
