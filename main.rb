require 'aws-sdk'
require 'json'

file = ARGV[0]
file_key  = ARGV[1]

abort 'Entre com os argumentos necessários [file_path] [key]' if file.empty? or file_key.empty?

secrets = JSON.load(File.read('secrets.json'))	

key 		= secrets['s3_key']
secret 		= secrets['s3_secret']
bucket_name = secrets['s3_bucket_report']

credentials = Aws::Credentials.new(key, secret)
s3 = Aws::S3::Resource.new(credentials: credentials, region: secrets['s3_region']) 

s3_object = s3.bucket(bucket_name).object(file_key)

send = s3_object.upload_file(file, acl: 'public-read')

if send 
	puts 'Enviado com sucesso, link: '
	puts s3_object.public_url
else
	puts 'Ocorreu algum erro'
end