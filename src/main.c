#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../utils.h"

int main(int argc, char *argv[])
{
  if (strcmp(argv[1], "-h") == 0 || strcmp(argv[1], "--help") == 0)
  {
    return help();
  }

  if (strcmp(argv[1], "-c") == 0 || strcmp(argv[1], "--create") == 0 && argc == 4)
  {
    char *templateName = argv[2];
    char *projectName = argv[3];

    return createTemplate(templateName, projectName);
  }

  printf("Invalid arguments, use: appt --help\n");
  return 1;
}