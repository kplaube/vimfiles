install: install_package_manager copy_vimrc


develop: symbolic_link_to_vimrc


copy_vimrc:
	@echo "Copying .vimrc file..."
	@cp .vimrc ~/


symbolic_link_to_vimrc:
	@echo "Creating a symbolic link to .vimrc file..."
	@ln -sf `pwd`/.vimrc ~/.vimrc


install_package_manager:
	@wget -O - https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | bash
