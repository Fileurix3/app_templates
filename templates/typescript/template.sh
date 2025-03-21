#!/bin/sh
project_name=$1

mkdir $project_name
cd $project_name

npm init -y
npm i
npm i -D typescript @types/node ts-node 
tsc --init

sed -i -E 's/"test":\s"echo.+$/"start": "node build\/index.js",/g' ./package.json
sed -i '/"start": "node build\/index.js",/a \    "build": "npx tsc",' package.json
sed -i '/"build": "npx tsc",/a \    "dev": "npx tsx src/index.ts"' package.json

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

touch index.ts