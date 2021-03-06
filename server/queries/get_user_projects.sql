
SELECT project.id,ap.project,ap.last_activity,ap.role,
array_agg(json_build_object('id',pm.id,'message',pm.message,'username',pm.username,'timestamp',pm.timestamp)) AS messages,
get_unread_messages(project.id,ap.last_activity) AS unread_messages
FROM account_projects ap
LEFT JOIN project ON ap.project = project.name
LEFT JOIN project_messages pm ON ap.project = pm.project
WHERE ap.username = $1
GROUP BY project.id,ap.project,ap.last_activity,ap.role;
