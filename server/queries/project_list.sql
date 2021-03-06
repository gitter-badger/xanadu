SELECT project.id AS project_id,project.name AS project_name,project.description as project_description,project.category as project_category,array_agg(json_build_object('skill_id',project_skills.id,'name',project_skills.skill)) AS skills
from project
LEFT OUTER JOIN project_skills on project.name=project_skills.project
GROUP BY project_id,project_name,project_description,project_category
