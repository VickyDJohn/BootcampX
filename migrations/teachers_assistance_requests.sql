CREATE TABLE IF NOT EXISTS teachers (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  is_active BOOLEAN DEFAULT TRUE,
  start_date DATE,
  end_date DATE
);

CREATE TABLE IF NOT EXISTS assistance_requests (
  id SERIAL PRIMARY KEY NOT NULL,
  assignment_id INTEGER,
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE ,
  teacher_id INTEGER REFERENCES teachers(id) ON DELETE CASCADE,
  created_at TIMESTAMP,
  started_at TIMESTAMP,
  completed_at TIMESTAMP,
  student_feedback TEXT,
  teacher_feedback TEXT
);