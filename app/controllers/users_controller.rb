class UsersController < ApplicationController
    <h1>Signup</h1>

<div id="signup-form" class="hide">
    <%= form_with(model: @user) do |f| %>
        <div class="form-control">
            <%= f.label :email, class: "form-label" , class: "form-label" %>
            <%= f.email_field :email, class: "form-input" %>
        </div>
        <div class="form-control">
            <%= f.label :password, class: "form-label" , class: "form-label" %>
            <%= f.password_field :password, class: "form-input" %>
        </div>
        <%= f.submit :create%>
    <% end %>
    Already have an account? <%= link_to "Log in", login_path, class: "show-login"%> here.

</div>
end
