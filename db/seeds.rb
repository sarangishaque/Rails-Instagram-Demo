# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Reviewer.destroy_all
Book.destroy_all

Book.create! [
	{ name: "Harry Potter and the Sorcerer's Stone",author: "J. K. Rowling" },
	{ name: "The Hobbit",author: " J. R. R. Tolkie" },
	{ name: "Angels & Demons",author: "Dan Brown" },
	{ name: "Ender's Game",author: "Stephenie Meyer" },
	{ name: "The Ruby Programming Language",author: "Orson Scott Card" }
]
100.times { |index| Book.create! name: "Book#{index}", author: "Author#{index}" }
eloquent = Book.find_by name: "Eloquent Ruby"
eloquent.notes.create! [
	{title: "wow", note: "Great book to Entertainments"},
	{title: "Funny", note: "Doesn't put you to sleep"}
]

reviewers = Reviewer.create! [
	{ name: "Rabbia", password: "rabbia123" },
	{ name: "Akmal", password: "akmal123" }
]

Book.all.each do |book|
	book.reviewer = reviewers.sample
	book.save!
end