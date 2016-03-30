User.destroy_all
TodoList.destroy_all
TodoItem.destroy_all
Profile.destroy_all

User.create! [
  { username: 'Fiorina' },
  { username: 'Trump' },
  { username: 'Carson' },
  { username: 'Clinton' }
]

Profile.create! [
  { first_name: 'Carly', last_name: 'Fiorina', birth_year: 1954, gender: 'female' },
  { first_name: 'Donald', last_name: 'Trump', birth_year: 1946, gender: 'male' },
  { first_name: 'Ben', last_name: 'Carson', birth_year: 1951, gender: 'male' },
  { first_name: 'Hillary', last_name: 'Clinton', birth_year: 1947, gender: 'female' }
]

# TodoList.create! [
#   {list_name: "campaign with money", list_due_date: (Date.today >> 12), user: User.find_by(username: "Fiorina")},
#   {list_name: "campaign badly", list_due_date: (Date.today >> 12), user: User.find_by(username: "Trump")},
#   {list_name: "campaign asleep", list_due_date: (Date.today >> 12), user: User.find_by(username: "Carson")},
#   {list_name: "campaign with bankers", list_due_date: (Date.today >> 12), user: User.find_by(username: "Clinton")}
# ]

User.all.each_with_index do |user, i|
  todoList = user.todo_lists.create! list_name: "List #{i}", list_due_date: Date.today >> 12
  (1..5).each do |i|
    todoList.todo_items.create! due_date: Date.today + 1.year, title: "Title #{i}", description: "This is task #{i}"
  end
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
