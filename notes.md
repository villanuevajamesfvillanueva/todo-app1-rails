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


### Questions:
    1. I thought 'resources :tasks' handles all HTTP methods and routing. How can I properly take advantage of this so that I don't need to create redundant HTTP methods for my update and create?

    2. Currently, displaying categories rely on task controller and task views. I think this is not the rails way.