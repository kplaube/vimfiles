install: install_configuration_files install_package_manager

install_configuration_files:
	@echo "Installing VIM config files..."
	@ln -sf `pwd`/.vimrc ~/.vimrc

	@echo "Transitioning to NeoVim..."
	@ln -sf ~/.vim ~/.config/nvim
	@ln -sf ~/.vimrc ~/.config/nvim/init.vim

	@echo "Create tern file (for Javascript projects)..."
	@ln -sf `pwd`/tern-project-example ~/.tern-project


install_package_manager:
	@echo "vim-plug for VIM"
	@curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@echo "vim-plug for NeoVim"
	@curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
