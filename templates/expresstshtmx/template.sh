#!/bin/sh
project_name=$1

mkdir $project_name
cd $project_name

npm init -y
npm i express dotenv ejs
npm i -D nodemon typescript ts-node @types/node @types/express
tsc --init

sed -i -E 's/"test":\s"echo.+$/"start": "node build\/index.js",/g' ./package.json
sed -i '/"start": "node build\/index.js",/a \    "build": "npx tsc",' package.json
sed -i '/"build": "npx tsc",/a \    "dev": "nodemon"' package.json

echo '.env
node_modules/
vscode/
' > .gitignore

echo 'PORT=3000
' > .env

echo '{
  "compilerOptions": {
    "target": "ESNext" /* Set the JavaScript language version for emitted JavaScript and include compatible library declarations. */,
    "module": "NodeNext" /* Specify what module code is generated. */,
    "rootDir": "./src" /* Specify the root folder within your source files. */,
    "moduleResolution": "NodeNext" /* Specify how TypeScript looks up a file from a given module specifier. */,
    "allowJs": true /* Allow JavaScript files to be a part of your program. Use the 'checkJS' option to get errors from these files. */,
    "outDir": "./build" /* Specify an output folder for all emitted files. */,
    "esModuleInterop": true /* Emit additional JavaScript to ease support for importing CommonJS modules. This enables 'allowSyntheticDefaultImports' for type compatibility. */,
    "forceConsistentCasingInFileNames": true /* Ensure that casing is correct in imports. */,
    "strict": true /* Enable all strict type-checking options. */,
    "noImplicitAny": true /* Enable error reporting for expressions and declarations with an implied 'any' type. */,
    "skipLibCheck": true /* Skip type checking all .d.ts files. */
  },
  "include": ["src/**/*.ts"],
  "exclude": ["node_modules"],
  "lib": ["ESNext"],
  "ts-node": { "esm": true }
}
' > tsconfig.json

echo '{
  "watch": ["src"],
  "ext": "ts",
  "exec": "npx tsx src/index.ts"
}
' > nodemon.json

echo '{
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

echo 'import { Request, Response } from "express";
import express from "express";
import "dotenv/config";

const app = express();

app.set("view engine", "ejs");
app.use(express.static("public"));

app.get("/", (req: Request, res: Response) => {
  res.render("index");
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server was running on port: ${PORT}`);
});' > index.ts

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

