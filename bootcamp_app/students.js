const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});

const input = process.argv.slice(2);
const cohortName = input[0];
const limit = input[1];
pool.query(`
  SELECT students.id, students.name, cohorts.name AS cohort
  FROM students
  JOIN cohorts ON cohorts.id = cohort_id
  WHERE cohorts.name LIKE $1
  LIMIT $2;
  `,
  [`${cohortName}%`, limit]
)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort} cohort`);
    });
  })
  .catch(err => {
    console.error('Error:', err);
  });