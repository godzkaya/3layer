FROM --platform=linux/arm64 mcr.microsoft.com/dotnet/sdk:8.0 AS builder
 
WORKDIR /app
 
COPY . ./
 
RUN dotnet restore
 
RUN dotnet publish -o out
 
FROM --platform=linux/arm64 mcr.microsoft.com/dotnet/aspnet:8.0-alpine
 
WORKDIR /app
 
COPY --from=builder /app/out .
 
ENTRYPOINT ["./backend"]
