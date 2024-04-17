#!/bin/bash
printf "CREATE GO TEMPLATE\n"
printf "project name >> "
read project_name
printf ">>>Project name is "$project_name"\n\n"

printf "Template architecture is\n"$project_name/"\n|-handler/\n|-model/\n|-repository/\n|-service/\n"

while true; do
    read -p "Do you want to use this template? (Yes/No) " choice
    if [[ "$choice" == "Yes" ]]; then
        printf ">>>Create with template architecture\n"
        mkdir $project_name
        cd $project_name
        # create directory with template
        mkdir handler
        mkdir model
        mkdir repository
        mkdir service
        cd handler

        # /handler
        mkdir middleware
        mkdir router

        # /handler/router
        cd router
        touch router.go
        echo "package router" >router.go


        # /handler/middleware
        cd ..
        cd middleware/
        touch middleware.go
        echo "package middleware" >middleware.go
        cd ..
        cd ..
        
        break

    elif [[ "$choice" == "No" ]]; then
        printf ">>>Create only common files\n"
        mkdir $project_name
        cd $project_name

        break
    else
        echo "Invalid choice. Please enter 'yes' or 'no'."
    fi
done

touch main.go
echo "package main\nfunc main() {\n}" >main.go
touch .env
touch .gitignore
echo "*.env" >.gitignore
touch Makefile
echo "run :\n\tgo run main.go" >Makefile

printf "Move to "$project_name" directory and run "make run"\n"
