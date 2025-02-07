#!/usr/bin/env bash
ASSETS_DIR="assets"
MODELS_DIR="${ASSETS_DIR}/models"
MODELS=("emotion_classification" "sentiment_classification")

BASE_URL='https://solipsis-data.s3.us-east-2.amazonaws.com/models' 

download () {
    curl -fLo "${MODELS_DIR}/$1" "$2"
}

mkdir -p $(pwd)/${MODELS_DIR}

for i in "${MODELS[@]}"
do
    if [ ! -f "${i}.tflite" ]; then
        download "${i}.tflite" "${BASE_URL}/${i}.tflite"
    fi

    if [ ! -f "{i}.vocab.txt" ]; then
        download "${i}.vocab.txt" "${BASE_URL}/${i}.vocab.txt"
    fi
done
