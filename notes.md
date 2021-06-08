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




## snippet from index.html.erb, tasks table:
    <div class="table table-responsive-lg">
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">title</th>
                    <th scope="col">body</th>
                    <th scope="col">deadline</th>
                    <th scope="col">id(pk)</th>
                    <th scope="col">category_id(fk)</th>
                    <th scope="col">category_name</th>
                    <th scope="col">username</th>
                </tr>
            </thead>
            <tbody>
                <% @tasks.each do |task| %>
                    <tr>
                        <td scope="row"><%= task.title%></td>
                        <td><%= task.body%></td>
                        <td><%= task.deadline%></td>
                        <td><%= task.id%></td>
                        <td><%= task.category_id%></td>
                        <% c = @categories.to_a.map(&:serializable_hash) %>
                        <% c.each do |categ| %>
                            <% if (categ['id'] == task.category_id) %>
                                <td><%= categ['name']%></td>
                            <% end %>   
                        <% end %>
                        <td><%= task.category.user.username%></td>
                        <td><%= link_to "View", task %></td>
                        <td><%= link_to "Edit", edit_task_path(task) %></td>
                        <td><%= link_to "Delete", task, method: :delete, data: { confirm: "Are you sure?" } %></td>
                    </tr>
                <% end %>
            </tbody>
        </table>
    </div>


## snippet from index.html.erb, categories table:
    <div class="table table-responsive-lg">
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">name</th>
                    <th scope="col">UUID</th>
                    <th scope="col">username</th>
                </tr>
            </thead>
            <tbody>
                <% @categories.each do |categ| %>
                    <tr>
                        <td scope="row"><%= categ.name%></td>
                        <td><%= categ.id%></td>
                        <td><%= categ.user.username%></td>
                        <td><%= link_to "View", categ %></td>
                        <td><%= link_to "Edit", edit_category_path(categ) %></td>
                        <td><%= link_to "Delete", categ, method: :delete, data: { confirm: "Are you sure?" } %></td>
                    </tr>
                <% end %>
            </tbody>
        </table>
        <br>
        <%= link_to "New Category", new_category_path %>
    </div>