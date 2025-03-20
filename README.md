# CLI for creating project template

Only support nodejs, but i may add other languages and templates in the future.

Inside the templates folder are all templates, if you don't need some of the templates, you can deleted there templates from the templates folder

## Install

**You must have [nodejs](https://nodejs.org/) installed**

1. **Clone the Repository**

   ```bash
   git clone https://github.com/Fileurix3/app_templates.git
   ```

2. **Navigate to the Project Folder**

   ```bash
   cd app_templates
   ```

3. **Install dependencies and Compile this project**

   ```bash
   npm i
   npm run build
   ```

4. **Make CLI usable globally**

   ```bash
   npm link
   ```

   OR

   ```bash
   sudo npm link
   ```

## Uninstall

1. **Navigate to the Project Folder**

   ```bash
   cd app_templates
   ```

2. **Remove global CLI**

   ```bash
   npm unlink --global
   ```

3. **Remove folder with this project**
   ```bash
   rm -rf app_templates
   ```

## How to use it?

1. **Enter CLI name**

   ```bash
   appt
   ```

2. **You'll be asked to enter the name of your project**
3. **You'll be asked to enter the name of the template**

   You can see the names of the templates included in the project here: [What templates does this CLI support?](#templates)

## What templates does this CLI support? <a id="templates"></a>

- **expressjs:** express.js project template
- **expressts:** express.js project template with typescript
- **typescript:** typescript project
