Author.create!([
  {name: "Edgar Allan Poe", email: "edgar@example.com", birth_date: "1809-01-19"},
  {name: "George Orwell", email: "george@example.com", birth_date: "1903-06-25"}
])
Publication.create!([
  {author: Author.first, title: "The Raven", body: "The Raven is a narrative poem by American writer Edgar Allan Poe. First published in January 1845, the poem is often noted for its musicality, stylized language, and supernatural atmosphere. It tells of a talking raven's mysterious visit to a distraught lover, tracing the man's slow fall into madness. ", published_at: "1923-02-23 20:00"},
  {author: Author.first, title: "The Tell-Tale Heart", body: "The Tell-Tale Heart is a short story by American writer Edgar Allan Poe, first published in 1843. It is relayed by an unnamed narrator who endeavors to convince the reader of the narrator’s sanity while simultaneously describing a murder they committed.", published_at: "1925-11-13 20:00"},
  {author: Author.last, title: "1984", body: "Nineteen Eighty-Four, often published as 1984, is a dystopian novel by English writer George Orwell published in June 1949. The novel is set in an imagined future, the year 1984, when much of the world has fallen victim to perpetual war, omnipresent government surveillance and propaganda.", published_at: "1931-01-15 20:00"},
  {author: Author.last, title: "Animal Farm", body: "Animal Farm is an allegorical novella by George Orwell, first published in England on 17 August 1945. According to Orwell, the fable reflects events leading up to the Russian Revolution of 1917 and then on into the Stalinist era of the Soviet Union.", published_at: "1953-10-05 20:00"}
])
