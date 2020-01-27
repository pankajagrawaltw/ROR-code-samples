class CommentMailer < ApplicationMailer

	def comment_notify(comment)
		user_id = comment[0].user_id
		email = User.find(user_id).email
		mail(to: email, subject: "Welcome to Demo")

	end
end
