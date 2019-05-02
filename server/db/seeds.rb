Author.create!([
  {name: "Edgar Allan Poe", email: "edgar@example.com", birth_date: "1809-01-19"},
  {name: "George Orwell", email: "george@example.com", birth_date: "1903-06-25"}
])
Publication.create!([
  {author_id: 1, title: "The Raven", body: nil, date: "1923-02-23", time: nil},
  {author_id: 1, title: "The Tell-Tale Heart", body: nil, date: "1925-11-13", time: nil},
  {author_id: 2, title: "1984", body: nil, date: "1931-01-15", time: nil},
  {author_id: 2, title: "Animal Farm", body: nil, date: "1953-10-05", time: nil}
])
