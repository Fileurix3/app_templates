#!/bin/sh
project_name=$1

mkdir $project_name
cd $project_name

npm init -y
npm i express dotenv
npm i -D nodemon

sed -i '/"main": ".*",/a \  "type": "module",' package.json
sed -i -E 's/"test":\s"echo.+$/"start": "node src\/index.js",/g' ./package.json
sed -i '/"start": "node src\/index.js",/a \    "dev": "nodemon"' package.json

echo '.env
node_modules/
vscode/
' > .gitignore

echo 'PORT=3000
' > .env

echo '
{
  "watch": ["src"],
  "ext": "js",
  "exec": "node src/index.js"
}
' > nodemon.json

echo '
{
  "semi": true,
  "singleQuote": false,
  "trailingComma": "all",
  "printWidth": 80,
  "tabWidth": 2,
  "useTabs": false,
  "arrowParens": "always"
}
' > .prettierrc

mkdir src
cd src

echo 'import express from "express";
import "dotenv/config";

const app = express();

app.set("view engine", "ejs");
app.use(express.static("public"));

app.get("/", (req, res) => {
  res.render("index");
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server was running on port: ${PORT}`);
});' > index.js

cd ../
mkdir views
cd views

echo '<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/style.css" />
    <script src="https://unpkg.com/htmx.org@2.0.4"></script>
    <title>express + htmx</title>
  </head>
  <body>
    <h1>expressjs + htmx</h1>
  </body>
</html>
' > index.ejs

cd ../
mkdir public
cd public 

touch style.css



