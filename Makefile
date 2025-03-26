install: 
	gcc main.c -o appt
	sudo mv appt /usr/local/bin/

uninstall:
	sudo rm /usr/local/bin/app