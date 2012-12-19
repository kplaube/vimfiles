install: copy_vimrc


develop: symbolic_link_to_vimrc


copy_vimrc:
	@echo "Copying .vimrc file..."
	@cp .vimrc ~/


symbolic_link_to_vimrc:
	@echo "Creating a symbolic link to .vimrc file..."
	@ln -s .vimrc ~/.vimrc
