#ifndef UTILS_H
#define UTILS_H

#define MAX_PATH_LENGTH 206
#define MAX_NAME_LENGTH 50
#define MAX_COMMAND_LENGTH 256
#define TEMPLATES_PATH "/usr/local/share/templates"

int help();
int createTemplate(char *templateName, char *projectName);

#endif