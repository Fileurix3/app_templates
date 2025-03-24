install:
	npm install
	npm run build
	npm link

uninstall:
	npm unlink --global