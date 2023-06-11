MODULE="Modules/AnimeQuotesNetwork/Sources/AnimeQuotesNetwork/"
FILE_NAME="openapi.yaml"
YOUR_CUSTOM_NAME_API="AnimeQuotesNetwork"

openapi-generator generate -i $FILE_NAME -g swift5 -o $YOUR_CUSTOM_NAME_API
rm -r $MODULE""*
cp -R $YOUR_CUSTOM_NAME_API"/OpenAPIClient/Classes/OpenAPIs/". $MODULE
rm -r $YOUR_CUSTOM_NAME_API
