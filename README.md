# Send_to_AWS_Bucket
Aplicativo command line para facilitar o upload de arquivos para o bucket AWS

#### Dependências

```shell 
gem install aws-sdk
```

#### Modo de usar

```shell 
ruby main.rb [file_path] [file_key]
```
resultado
```shell 
Enviado com sucesso, link: 
https://[bucket_name].s3-us-west-2.amazonaws.com/[file_key]

```