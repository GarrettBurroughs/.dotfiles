#!/bin/zsh
echo "Enter your home directory: "
read directory

copy_files () {
	files="$(ls -A $1)"
	objArr=( ${=files} )
	exclude=".git README.md init.sh"
	
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
			copy_files "$file_path" "$2" "$3"
		else
			destination=${file_path//$2/$3}
			echo "linking $file_path to $destination"
			test -f $destination 
			if [[ $? -eq 0 ]]; then 
				echo "File $destination exists, overwritting..."
				rm $destination 
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
	copy_files "$(pwd)" "$(pwd)" "$directory"
	
	echo "" 
	echo ""
	echo "Dotfiles have been linked to home directory, if a previous version of the file existed it has been moved to $backup_dir"

fi
