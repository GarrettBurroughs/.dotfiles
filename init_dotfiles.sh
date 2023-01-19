#!/bin/zsh
test -f directory_home
if [[ $? -eq 0 ]] then 
	directory=`cat directory_home`
else 
	echo "Enter your home directory: "
	read directory
	touch directory_home
	echo "$directory" > directory_home
fi


# function to recursively copy files from the dotfile directory to the home directory 
# 1 - Working Directory (This will change with recursive calls)
# 2 - Base Directory (This is the top level that the script works on and will not change with recursive calls)
# 3 - Target directory (the home directory)  
# 4 - Backup directory
copy_files () {
	files="$(ls -A $1)"
	objArr=( ${=files} )
	exclude=".git README.md init_dotfiles.sh .gitignore"
	
	for object in $objArr; do
		if echo $exclude | grep -qs $object; then
			continue
		fi
		file_path="$1/$object"

		test -d $file_path
		if [[ $? -eq 0 ]]; then
			test -d ${file_path//$2/$3} # see if the folder exists in the target location  
			if [[ $? -eq 1 ]] then
				echo "Creating diectory ${file_path//$2/$3}"
				mkdir ${file_path//$2/$3}
			fi
			copy_files "$file_path" "$2" "$3" "$4"
		else
			destination=${file_path//$2/$3}
			echo "linking $file_path to $destination"
			test -f $destination 
			if [[ $? -eq 0 ]]; then 
				echo "File $destination exists, overwritting..."
				mv "$destination" "$4/$destination:t"
			fi 
			ln -nfs $file_path $destination
		fi 

	done	
}


test -d $directory 
if [[ $? -eq 1 ]]; then 
	echo "Invalid Directory"
else
	echo "Copying files from $(pwd) to $directory"
	backup_dir="$directory/.dotfiles_old"
	test -d $backup_dir
	if [[ $? -eq 1 ]]; then 
		mkdir $backup_dir
	fi
	copy_files "$(pwd)" "$(pwd)" "$directory" "$backup_dir"
	
	echo "" 
	echo ""
	echo "Dotfiles have been linked to home directory, if a previous version of the file existed it has been moved to $backup_dir"

fi
