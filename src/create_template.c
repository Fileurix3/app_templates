#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../utils.h"

int createTemplate(char *templateName, char *projectName)
{
  if (strlen(projectName) > MAX_NAME_LENGTH)
  {
    printf("Error: Project name '%s' is too long. Max length is %d characters\n", projectName, MAX_NAME_LENGTH);
    return 1;
  }

  char templatePath[MAX_PATH_LENGTH];
  snprintf(templatePath, sizeof(templatePath), "%s/%s/template.sh", TEMPLATES_PATH, templateName);

  FILE *template = fopen(templatePath, "r");

  if (template == NULL)
  {
    printf("Error: this template wasn't found\n");
    return 1;
  }

  fclose(template);

  char command[MAX_COMMAND_LENGTH];
  snprintf(command, sizeof(command), "sh %s %s", templatePath, projectName);

  printf("Executing command: %s\n", command);
  int result = system(command);

  if (result != 0)
  {
    printf("Error: Failed to create template\n");
    return 1;
  }

  printf("Template has been successfully created\n");

  return 0;
}
