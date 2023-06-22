PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only  -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
 #get data by atomic_number
  if [[ $1 =~ ^(1|2|3|4|5|6|7|8|9|10|1000)$ ]]
  then
      #get data
      DATA=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number='$1'") 
      echo "$DATA"| while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT_CELSIUS BAR BOILING_POINT_CELSIUS
      do
        if [[ -z $NAME ]]
        then
          echo "I could not find that element in the database."
        else  
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius." 
        fi  
      done
  #get data by symbol    
  elif [[ $1 =~ ^(H|He|Li|Be|B|C|N|O|Mt|F|Ne)$ ]]
  then
      #get data
      DATA=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1'") 
      echo "$DATA"| while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT_CELSIUS BAR BOILING_POINT_CELSIUS
      do
        if [[ -z $SYMBOL ]]
        then
          echo "I could not find that element in the database."
        else  
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius." 
        fi  
      done  
  #get data by name     
  elif [[ $1 =~ ^(Hydrogen|Helium|Lithium|Beryllium|Boron|Carbon|Nitrogen|Oxygen|moTanium|Fluorine|Neon)$ ]]
  then
      #get data
      DATA=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$1'") 
      echo "$DATA"| while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT_CELSIUS BAR BOILING_POINT_CELSIUS
      do
        if [[ -z $ATOMIC_NUMBER ]]
        then
          echo "I could not find that element in the database."
        else  
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius." 
        fi  
      done     
  else
      echo "I could not find that element in the database."
  fi 
fi  