## models:
    tags table:
        columns: id=>uuid, tags

    tasks table: 
        columns: id=>uuid, taskname, description, deadline, tag_uuid, urgency, archived
            #urgency can have 3 values: completed, in progress, to do

    user table:
        columns: id=>uuid, firstname, lastname, username, email, password 



# if in dev state:
    editing table:
    rails db:rollback

    add col:
    generate new migration file
    can't rollback bec of existing data
    command:
    rails g migration <name of what you want to do (snakecase) (user_defined)>
    rails g migration 


### To Fix:
    1. Problem of enabling creation of task with optional categ:
        -task not being displayed in the page since tasks connected to users through categ;
        -no categ: can't link to user
        