#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~ Salon ~~~\n"

MAIN_MENU()
{
  if [[ $1 ]]
  then
    echo -e $1
  fi

  echo -e "\nChoose one of the following services:"
  SERVICES_DATA=$($PSQL "SELECT * FROM services")
  SERVICES_DATA_FORMATTED=$(echo "$SERVICES_DATA" | sed 's/ |/)/g')
  echo "$SERVICES_DATA_FORMATTED"

  # get service_id
  read SERVICE_ID_SELECTED
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  echo $SERVICE_ID
  if [[ -z $SERVICE_ID ]]
  then
    MAIN_MENU "\n======================================\nThe current option does not exit!"
  else
    # get phone
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    # get name
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nWhat's your name?"
      read CUSTOMER_NAME

      # insert customer info
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    fi

    # get service time
    echo -e "\nWhat time do you prefer for our service?"
    read SERVICE_TIME

    # get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    # insert appointment info
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    # formatted final output
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    echo "I have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *//g')."
  fi
}

MAIN_MENU
echo -e "\nThank you for choosing us!\n"
