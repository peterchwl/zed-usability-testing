while true; do
  echo -n "Enter the name of the first person whose queries you want to compare: "
  read name1

  if  [ "$name1" == "siya" ] || [ "$name1" == "ruiping" ] || [ "$name1" == "peter" ] || [ "$name1" == "brandon" ] ; then
    echo "You chose $name1 as person 1"
    break
  else
    echo "Invalid input. Please enter siya , ruiping , peter , or brandon."
  fi
done

while true; do
  echo -n "Enter the name of the second person whose queries you want to compare: "
  read name2

  if  [ "$name2" == "siya" ] || [ "$name2" == "ruiping" ] || [ "$name2" == "peter" ] || [ "$name2" == "brandon" ] ; then
    if [ "$name2" != "$name1" ] ; then
        echo "You chose $name2 as person 2"
        break
    else 
        echo "Don't choose the same person again"
    fi
  else
    echo "Invalid input. Please enter siya , ruiping , peter , or brandon."
  fi
done



