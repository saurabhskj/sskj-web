ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base,
                                       :access_key_id     => 'ENV['ACCESS_KEY']',
                                       :secret_access_key => 'ENV['SECRET_KEY']'


#phoenix
# ses.send_email(
    #:to => "saurabhskj@hotmail.com",
   # :source =>  'saurabhskj@hotmail.com',
  #  :subject => 'testing via aws-ses',
 #   :text_body => 'testing'
#)
