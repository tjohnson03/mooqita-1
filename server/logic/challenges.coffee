###############################################
@gen_challenge = (user, job_id) ->
	challenge =
		num_reviews: 2

	if job_id
		challenge.job_ids = [job_id]
		job = Jobs.findOne(job_id)
		if not job
			throw new Meteor.Error "Job not found."

	res = store_document_unprotected Challenges, challenge, user, true
	msg = "Challenge (" + challenge._id + ") generated by: " + get_user_mail user
	log_event msg, event_logic, event_info

	if not job
		return res

	tmp_challenge_ids = job.challenge_ids

	if not tmp_challenge_ids
		tmp_challenge_ids = []

	tmp_challenge_ids.push(res)

	modify_field_unprotected Jobs, job_id, "challenge_ids", tmp_challenge_ids

	return res

###############################################
@bake_challenge = (user,title,content,link,origin,job_id) ->
	challenge =
		num_reviews: 2
		title: title
		content: content
		link: link
		origin: origin

	if job_id
		challenge.job_ids = [job_id]
		job = Jobs.findOne(job_id)
		if not job
			throw new Meteor.Error "Job not found."

	res = store_document_unprotected Challenges, challenge, user, true
	msg = "Challenge (" + challenge._id + ") generated by: " + get_user_mail user
	log_event msg, event_logic, event_info

	if not job
		return res

	tmp_challenge_ids = job.challenge_ids

	if not tmp_challenge_ids
		tmp_challenge_ids = []

	tmp_challenge_ids.push(res)

	modify_field_unprotected Jobs, job_id, "challenge_ids", tmp_challenge_ids

	return res

###############################################
@finish_challenge = (challenge, user) ->
	modify_field_unprotected Challenges, challenge._id, "published", true
	modify_field_unprotected Challenges, challenge._id, "visible_to", "anonymous"

	#TODO: inform last round participants

	msg = "Challenge (" + challenge._id + ") published by: " + get_user_mail user
	log_event msg, event_logic, event_info

	return challenge._id