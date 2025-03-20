#!/bin/sh
project_name=$1

mkdir $project_name
cd $project_name

npm init -y
npm i express dotenv
npm i -D nodemon

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
import "dotenv/config"

const app = express();

app.use(express.json());

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server was running on port: ${PORT}`);
});' > index.js