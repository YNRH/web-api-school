#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER app
WORKDIR /app
EXPOSE 8080

ENV DB_CONNECTION_STRING="Server=db-school.cjh3izddzqpw.us-east-1.rds.amazonaws.com,1433;Database=School;User Id=admin;Password=5Aws.aws5;TrustServerCertificate=True;"

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["web-api-school.csproj", "."]
RUN dotnet restore "./web-api-school.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "./web-api-school.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./web-api-school.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "web-api-school.dll"]