#!/usr/bin/env bash

source util.sh

USERNAME="testuser001"
PASSWORD="testuser001"
CLIENT_SECRET=">Hs8wkP14XzKAj63GpYlKSt529rAsSl83"

TOKEN=$(get_token "$CLIENT_SECRET" "$USERNAME" "$PASSWORD")

echo "========================= TOKEN ========================="
echo "${TOKEN}" | jq -R 'split(".") | .[0],.[1] | @base64d | fromjson'
echo

echo "${TOKEN}" > token.txt


#
# create students
#
echo "===================== create students ==================="
STUDENTS=$(cat students.json)
CREATED_STUDENTS=""
while read -r student;
do
    response=$(create_member "$TOKEN" "${student}" "{}")
    echo "create member: ${student} -> ${response}"
    CREATED_STUDENTS="${CREATED_STUDENTS}${response},"
done <<<$(echo "${STUDENTS}" | jq -c '.[].name')
CREATED_STUDENTS="[${CREATED_STUDENTS::-1}]"

# FIXME
echo "${CREATED_STUDENTS}" > create_students.json

#
# create teachers
#
# every teacher is responsible for everyone
echo "===================== create teachers ==================="
TEACHERS=$(cat teachers.json)
CREATED_TEACHERS=""
while read -r teacher;
do
    response=$(create_member "$TOKEN" "${teacher}" "{\"members\":$(echo "$CREATED_STUDENTS" | jq -c "map(.id)")}")
    echo "create member: ${teacher} -> ${response}"
    CREATED_TEACHERS="${CREATED_TEACHERS}${response},"
done <<<$(echo "${TEACHERS}" | jq -c '.[].name')
CREATED_TEACHERS="[${CREATED_TEACHERS::-1}]"
echo "${CREATED_TEACHERS}" > created_teachers.json

