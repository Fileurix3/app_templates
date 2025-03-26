#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_PATH_LENGTH 206
#define MAX_NAME_LENGTH 50
#define MAX_COMMAND_LENGTH 256

void validateArgs(int *countArgs, char *cliName, char *templateName, char *projectName);

int main(int argc, char *argv[])
{
  char *cliName = argv[0];
  char *templateName = argv[1];
  char *projectName = argv[2];

  validateArgs(&argc, cliName, templateName, projectName);

  char templatePath[MAX_PATH_LENGTH];
  snprintf(templatePath, sizeof(templatePath), "./templates/%s/template.sh", templateName);

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

void validateArgs(int *countArgs, char *cliName, char *templateName, char *projectName)
{
  if (*countArgs != 3)
  {
    printf("Please usage: %s <template_name> <project_name>\n", cliName);
    exit(1);
  }
  else if (strlen(projectName) > MAX_NAME_LENGTH)
  {
    printf("Error: Project name '%s' is too long. Max length is %d characters\n", projectName, MAX_NAME_LENGTH);
    exit(1);
  }
}