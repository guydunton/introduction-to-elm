# Introduction to Elm

This repo contains the code and slides for my presentation "Introduction to Elm".

There are 2 branches:

- [master](https://github.com/guydunton/introduction-to-elm/tree/master): This contains the code pre refactor
- [post-refactor](https://github.com/guydunton/introduction-to-elm/tree/post-refactor): This branch has the final code (including gif loading).

## How to build

```bash
npm install -g elm
git clone https://github.com/guydunton/introduction-to-elm.git
cd introduction-to-elm
elm make --output=build/index.html src/Main.elm
```

## How to run

Start the Elm reactor. The reactor is a server which also compiles your code. To start:

```bash
elm reactor
```

Then navigate to `http://localhost:8000/src/Main.elm`

## More Resources

- How to install Elm on various platforms: [link](https://guide.elm-lang.org/install/elm.html)
- Link to online Elm examples: [link](https://elm-lang.org/try)
