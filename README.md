# Buoys

Buoys is a Ruby on Rails breadcrumb plugin like [gretel](https://github.com/lassebunk/gretel).

## Motivation

I like [gretel](https://github.com/lassebunk/gretel) and respect its idea, but I want to create simpler breadcrumb library like [gretel](https://github.com/lassebunk/gretel) using I18n.

## Installation

In your Gemfile

```ruby
gem 'buoys'
```

And run:

```ruby
$ bundle install
```

## Example

Start by generating configuration and example files.
```ruby
$ bin/rails g buoys:install
  create  config/locale/buoys.en.yml
  create  app/views/breadcrumbs/_buoys.html.erb
  create  config/buoys/breadcrumbs.rb
```

Then, in `config/buoys/breadcrumbs.rb`
```ruby
buoy :stories do
  link 'Stories', stories_path
end

# 'crumb' is the alias of 'buoy'
# ex)
crumb :stories do
  link 'Stories', stories_path
end

# link's first argument, it is used as I18n key and defalt value.
# The key is searched in the scope of 'buoys.breadcrumbs'.
# ex)
buoy :story do |story|
  link :story, story_path(story)
  # same as `link I18n.t('story', scope: 'buoys.breadcrumbs', default: 'story'), story_path(story)`
end

# You can alse override Buoys configuration
# ex)
buoy :story_tasks do |story|
  link :story_tasks, story_tasks_path
  pre_buoy :story, story, {link_current: true}
end

# You can use 'pre_buoy' as parent. 'parent' is the alias of re_buoy`
# ex)
buoy :story_tasks do |story|
  link :story_tasks, story_tasks_path
  parent :story, story
end
```

Then, set the current buoy(breadcrumb) at the top of view file (like `app/views/stories/index.html.erb`).

```ruby
<% buoy :stories %>
```

Then, in `app/views/layouts/application.html.erb`.
```ruby
<%= render partial: 'breadcrumbs/buoys' %>
```

Then, You can build and change breadcrumb  `app/views/breadcrumbs/_buoys.html.erb`

```erb
<% if buoys.any? %>
  <ul>
    <% buoys.each do |link| %>
      <li>
        <%# if 'link.current?' is true, link.options includes {class: 'current'}. %>
        <%= link_to link.url, link.options do %>
          <span><%= link.text %></span>
        <% end %>
        <% if !link.current? %>
          <span> &gt;</span>
        <% end %>
      </li>
    <% end %>
  </ul>
<% end %>
```  

## Options

| option         | description | default |
| -------------- | ----------- | ------- |
| :link_current  | whether current buoy(breadcrumb) should be linked to | false |
| :current_class | CSS class for current link. if you set `nil`, it is not set CSS class | 'active' |

## TODO

- Rails 4.1, 4.2, 5.0 support
- Ruby 2.1, 2.2, 2.3

Copyright (c) 2016 muryoimpl Released under the MIT license
