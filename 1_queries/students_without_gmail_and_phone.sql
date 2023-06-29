SELECT name, email, id
  FROM students
  WHERE email <> '%gmail.com'
    AND phone IS NULL;