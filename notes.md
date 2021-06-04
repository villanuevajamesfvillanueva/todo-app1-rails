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
    1. In displaying tasks and categories of user, only the current_user's
    tasks and categories should be shown.
    2. When creating new tasks, only current_user's categoires should be shown.
    3. Uniqueness of task and category names should only be true for each user, meaning different users can have the same task and category names.
    4. Tasks table should also have a column for user_id.
    5. Add username field to user registration.