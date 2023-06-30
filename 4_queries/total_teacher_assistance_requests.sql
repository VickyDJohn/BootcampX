SELECT count(assistance_requests.completed_at) AS total_assistances, teachers.name as name
FROM assistance_requests
  JOIN teachers ON teacher_id = teachers.id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY name;