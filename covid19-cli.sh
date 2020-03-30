#!/usr/bin/env bash 

VERSION="0.0.1"

BASE_API="https://corona.lmao.ninja"
API_ALL_COUNTRIES_ENDPOINT="$BASE_API/countries"
API_TOTAL_ENDPOINT="$BASE_API/all"

function get_data() {
  country=$1

  echo $API_ALL_COUNTRIES_ENDPOINT

  cases=$(curl -s $API_ALL_COUNTRIES_ENDPOINT/$country | jq ".cases")
  deaths=$(curl -s $API_ALL_COUNTRIES_ENDPOINT/$country | jq ".deaths")
  recovered=$(curl -s $API_ALL_COUNTRIES_ENDPOINT/$country | jq ".recovered")
}

function print_result() {
  get_data $1

  RED=$(tput setaf 1)
  GREEN=$(tput setaf 2)
  YELLOW=$(tput setaf 3)

  echo "${YELLOW}Cases     : ${cases}"
  echo "${RED}Deaths    : ${deaths}"
  echo "${GREEN}Recovered : ${recovered}"
}

print_result $1

