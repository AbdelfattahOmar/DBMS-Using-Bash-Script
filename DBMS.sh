#!/bin/bash
#######################
#allfunctions
source ./mainMenuFunctions.sh
source ./tablesMenuFunctions.sh
source ./selectMenuFunctions.sh


#######################

if ! [ -d DBMS ] 
then
	mkdir DBMS
fi

clear
echo "Welcome To DBMS"

function mainMenu {
  echo "======================================"
  echo "1. Create DataBase"
  echo "2. List DataBases "
  echo "3. Connect to DataBase"
  echo "4. Drop DataBase"
  echo "0. Exit"
  echo "======================================"
  
  echo -e "Enter Choice: \c"
  read ch
  case $ch in
    1)  createDB ;;
    2)  listDBs;;
    3)  connectDB ;;
    4)  dropDB ;;
    0)  ;;
    *) echo " Wrong Choice " ; mainMenu;
  esac
}

function tablesMenu {
  echo "======================================"
  echo "1. Create New Table"
  echo "2. List all Tables"
  echo "3. Drop Table"
  echo "4. Insert Into Table"
  echo "5. Select From Table"
  echo "6. Delete From Table"
  echo "7. Update Table"
  echo "0. Exit "
  echo "======================================"
  echo -e "Enter Choice: \c"
  read ch
  case $ch in
    1)  createTable ;;
    2)  ls .; tablesMenu ;;
    3)  dropTable;;
    4)  insert;;
    5)  clear; selectMenu ;;
    6)  deleteFromTable;;
    7)  updateTable;;
    0) clear; cd ../.. 2>>./.error.log; mainMenu ;;
    *) echo " Wrong Choice " ; tablesMenu;
  esac

}


function selectMenu {
  echo "====================================================="
  echo "1. Select All Columns of a Table"
  echo "2. Select Specific Column from a Table"
  echo "3. Select From Table under condition"
  echo "0. Exit"
  echo "====================================================="
  echo -e "Enter Choice: \c"
  read ch
  case $ch in
    1) selectAll ;;
    2) selectCol ;;
    3) whereCond;;
    0) clear; tablesMenu ;;
    
    *) echo " Wrong Choice " ; selectMenu;
  esac
}

mainMenu
