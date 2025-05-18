#!/bin/bash
echo -e "\e[35m🅶🅴🅽-🅳🅿🅾🅻\e[0m"
echo -e "\e[31mGENERADOR DPOL\e[0m"

generate_card_number() {
  card_type=$1
  card_number=""
  case $card_type in
    "VISA")
      card_number="4"
      ;;
    "MASTERCARD")
      card_number="5"
      ;;
    "AMERICAN EXPRESS")
      card_number="3"
      ;;
    *)
      echo "Tipo de tarjeta no válido"
      return
      ;;
  esac

  for i in {1..15}; do
    card_number="$card_number$((RANDOM % 10))"
  done

  echo $card_number
}

echo "Generador de tarjetas de crédito"
echo "Seleccione el tipo de tarjeta que desea generar:"
echo "1. VISA"
echo "2. MASTERCARD"
echo "3. AMERICAN EXPRESS"
read -p "Opción: " option

case $option in
  1)
    card_type="VISA"
    ;;
  2)
    card_type="MASTERCARD"
    ;;
  3)
    card_type="AMERICAN EXPRESS"
    ;;
  *)
    echo "Opción no válida"
    exit 1
    ;;
esac

read -p "¿Cuántas tarjetas desea generar? " quantity

for ((i=1; i<=quantity; i++)); do
  card_number=$(generate_card_number $card_type)
  echo $card_number >> "/data/data/com.termux/files/home/$card_type.txt"
done

echo "Se han generado $quantity números de tarjeta de crédito de tipo $card_type. Los archivos se han guardado en el almacenamiento interno con el nombre $card_type.txt"