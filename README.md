# CLI for creating project template

Only support nodejs templates, but i may add other languages and templates in the future.

Inside the `/usr/local/share/templates/` folder are all the templates, if you don't need some of them, you can delete them from the templates folder

## Install

1. **Clone the Repository**

   ```bash
   git clone https://github.com/Fileurix3/app_templates.git
   ```
2. **Navigate to the Project Folder**

   ```bash
   cd app_templates
   ```

3. **Install project**

   ```bash
   sudo make install
   ```

## Uninstall

1. **Navigate to the Project Folder**

   ```bash
   cd app_templates
   ```

2. **Remove CLI**

   ```bash
   sudo make uninstall
   ```

3. **Remove folder with this project**
   ```bash
   rm -rf app_templates
   ```

## How to use it?

- **`appt -h, --help`**

  - information about all commands

- **`appt -c, --create <templateName> <projectName>`**

  - #### `<templateName>`: is the name of the template you want to create

    - You can see the names of the templates included in the project here: [What templates does this CLI support?](#templates)

  - #### `<projectName>`: this is the name of your project

  #### Example:

  ```bash
  appt -c expressjs my_project
  ```

  OR

  ```bash
  appt --create expressjs my_project
  ```

## What templates does this CLI support? <a id="templates"></a>

- **typescript:** typescript project template
- **expressjs:** express.js project template
- **expressts:** express.js project template with typescript
- **expressjshtmx:** express.js project template with htmx
- **expresstshtmx:** express.js project template with typescript and htmx
