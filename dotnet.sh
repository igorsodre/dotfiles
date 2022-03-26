# certificates for development

# execute this inside your project folder
dotnet dev-certs https -ep ${HOME}/.aspnet/https/aspnetapp.pfx -p "password"
dotnet dev-certs https --trust

# All parameters here are important
docker run -p 8080:80 -p 443:443 -e ASPNETCORE_URLS="https://+;http://+" -e ASPNETCORE_HTTPS_PORT=8001 -e ASPNETCORE_Kestrel__Certificates__Default__Password="password" -e ASPNETCORE_Kestrel__Certificates__Default__Path=/https/aspnetapp.pfx -v ${HOME}/.aspnet/https:/https/ igorsodre/terraform-practice

############### PRO TIPS
# always search for bitnami images when using containers for development
