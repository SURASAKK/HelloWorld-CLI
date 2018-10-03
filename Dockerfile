#deploy with dockerfile
FROM microsoft/dotnet:2.1-sdk-alpine AS build-env
WORKDIR /app
#esssee
COPY *.csproj ./
RUN dotnet restore
#adasdasdasdsd
COPY . ./
RUN dotnet publish -c Release -o out
#asdasdadsadasd
FROM microsoft/dotnet:2.1-aspnetcore-runtime-alpine
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "HelloWolrd-CLI.dll"]
