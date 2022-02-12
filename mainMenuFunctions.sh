#!/bin/bash

function createDB {
  echo -e "Enter Database Name: \c"
  read dbName

  if ! [[ $dbName =~ ^[a-zA-Z]*$ ]]; then
        echo -e "Invalid Database Name !!"
        mainMenu
	return;
  fi


  if ! [ -d ./DBMS/$dbName ]
  then
  	mkdir ./DBMS/$dbName
    echo "Database Created Successfully"
  else
    echo "Database $dbName already exists"
  fi
  mainMenu
}
function connectDB {
  echo -e "Enter Database Name: \c"
  read dbName
  if [ -d ./DBMS/$dbName ]
  then
    cd ./DBMS/$dbName 
    echo "Database $dbName was Successfully Connected"
    tablesMenu
  else
    echo "Database $dbName wasn't found"
    mainMenu
  fi
}
function listDBs {
	ls ./DBMS ;
	mainMenu
} 

function dropDB {
  echo -e "Enter Database Name: \c"
  read dbName
   
  if [ -d ./DBMS/$dbName ]
  then
    rm -r -i ./DBMS/$dbName
    echo "Database Dropped Successfully"
  else
    echo "Database Not found"
  fi
  mainMenu
}

