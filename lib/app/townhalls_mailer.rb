require 'google/apis/gmail_v1'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'
require 'rmail'


class TownhallsMailer

	attr_accessor :OOB_URI , :APPLICATION_NAME , :CREDENTIALS_PATH, :TOKEN_PATH, :SCOPE, :first_name, :email_body, :service


	def initialize
		@OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'.freeze
		@APPLICATION_NAME = 'Gmail API Ruby Quickstart'.freeze
		@CREDENTIALS_PATH = './lib/app/credentials.json'.freeze
		@TOKEN_PATH = './lib/app/token.yaml'.freeze
		@SCOPE = Google::Apis::GmailV1::AUTH_GMAIL_SEND

		@service = Google::Apis::GmailV1::GmailService.new
		@service.client_options.application_name = @APPLICATION_NAME
		@service.authorization = authorize

		@email_body = 


		@first_name = "THP_master"
	end


	def authorize
		client_id = Google::Auth::ClientId.from_file(@CREDENTIALS_PATH)
		p client_id
		token_store = Google::Auth::Stores::FileTokenStore.new(file: @TOKEN_PATH)
		authorizer = Google::Auth::UserAuthorizer.new(client_id, @SCOPE, token_store)
		user_id = 'default'
		credentials = authorizer.get_credentials(user_id)
		if credentials.nil?
			url = authorizer.get_authorization_url(base_url: @OOB_URI)
			puts 'Open the following URL in the browser and enter the ' \
					 "resulting code after authorization:\n" + url
			code = gets
			credentials = authorizer.get_and_store_credentials_from_code(
				user_id: user_id, code: code, base_url: @OOB_URI
			)
		end
		credentials
	end


	def send_email_to_all_townhalls(hash_townhalls)

		hash_townhalls.each do |department, hash_department|
			hash_department.each do |townhall_name, townhall_detail|
				message = RMail::Message.new
				message.header['To'] = townhall_detail[1]
				message.header['Subject'] = "Changer le monde !"
				first_name = "THP_master"
				townhall_name = townhall_name

				p townhall_name
				p townhall_detail[1]
	
				message.body = "Bonjour,\nJe m'appelle #{first_name}, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de ntore école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.\nDéjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de #{townhall_name} veut changer le monde avec nous ?"
	
				#@service.send_user_message("me", upload_source: StringIO.new(message.to_s),	content_type: 'message/rfc822')
			end
		end

	end
	
	def perform(hash_townhalls)
		send_email_to_all_townhalls(hash_townhalls)
	end 
    
end
