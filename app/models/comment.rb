class Comment < ApplicationRecord
	#associations
	belongs_to :user
	belongs_to :post

	#validation
	validates_presence_of :comment

	# callback to send mail
	after_create :send_email_for_post_notify

	private 

	def send_email_for_post_notify
		PostNotifyWorker.perform_async(self.id)
	end
end
