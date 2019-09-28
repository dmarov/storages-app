# java+postgres+vuejs app for storages
[demo](https://storages-app.herokuapp.com/)

authorization credentials:

| username | role  | password |
|----------|-------|----------|
| admin    | admin | admin    |
| user     | user  | user     |

## deployment sequence

1. create postgres version >= 9.5 service instance according to
```
src/main/resources/application.properties
```
or modify connection properties

2. run mvn package
