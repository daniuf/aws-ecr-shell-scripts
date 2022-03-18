#!/bin/bash

ACCOUNT_ID=$1
REGION=$2

echo "Account #: $ACCOUNT_ID"
echo "Region Name: $REGION"

resultado=$(aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com)

if [[ $resultado == "Login Succeeded" ]]; then
  echo "Token obtenido exitosamente"
else
  echo "Error al obtener token $resultado"
fi