EXEC = appt
SRC = main.c

INSTALL_DIR = /usr/local/bin
TEMPLATES_DIR = /usr/local/share/templates/

install: 
	gcc main.c -o $(EXEC)

	sudo mkdir -p $(TEMPLATES_DIR)
	sudo cp -r ./templates/* $(TEMPLATES_DIR)

	sudo mv appt $(INSTALL_DIR)

uninstall:
	sudo rm $(INSTALL_DIR)/appt
	sudo rm -rf $(TEMPLATES_DIR)