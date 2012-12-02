install: copy_scripts copy_vimrc


develop: symbolic_link_to_scripts symbolic_link_to_vimrc


copy_scripts:
	@echo "Copying ctags script..."
	@cp .vim/update_ctags ~/.vim/


copy_vimrc:
	@echo "Copying .vimrc file..."
	@cp .vimrc ~/


symbolic_link_to_scripts:
	@echo "Creating a symbolic link to ctags script..."
	@ln -s .vim/update_tags ~/.vim/update_tags


symbolic_link_to_vimrc:
	@echo "Creating a symbolic link to .vimrc file..."
	@ln -s .vimrc ~/.vimrc
