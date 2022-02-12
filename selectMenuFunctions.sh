#!/bin/bash


function selectAll {
  echo -e "Enter Table Name: \c"
  read tName
   
  if [[ -f $tName ]]
  then
    column -t -s '|' $tName
    
  else 
    echo "Table $tName doesn't exist"
  fi
  selectMenu
}

function selectCol {
  echo -e "Enter Table Name: \c"
  read tName
  if [[ -f $tName ]]
  then
	  echo -e "Enter Column Number: \c"
	  read colNum
	  awk 'BEGIN{FS="|"} {if (NF >= '$colNum' && '$colNum' >0 ) print $'$colNum'; }END { if(NF < '$colNum' || '$colNum' <= 0 ) print "wrong column number " }' $tName
  else 
    echo "Table $tName doesn't exist"
  fi
  selectMenu
}

function whereCond {
  echo -e "Select all rows from TABLE Where FIELD(OPERATOR) = VALUE \n"
  echo -e "Enter Table Name: \c"
  read tName
  if ! [[ -f $tName ]]
  then
      echo enter valid table
      selectMenu
      return
  fi
  
  fid=$(awk 'BEGIN{FS="|"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$field'") print i}}}' $tName)
  if [[ $fid == "" ]]
  then
    echo "Not Found"
    selectMenu
  else
    echo -e "\nSupported Operators: [==, !=, >, <, >=, <=] \nSelect OPERATOR: \c"
    read op
    if [[ $op == "==" ]] || [[ $op == "!=" ]] || [[ $op == ">" ]] || [[ $op == "<" ]] || [[ $op == ">=" ]] || [[ $op == "<=" ]]
    then
      echo -e "\nEnter required VALUE: \c"
      read val
      res=$(awk 'BEGIN{FS="|"}{if ($'$fid$op$val') print $0}' $tName 2>>./.error.log |  column -t -s '|')
      if [[ $res == "" ]]
      then
        echo "Value Not Found"
        selectMenu
      else
        awk 'BEGIN{FS="|"}{if ($'$fid$op$val') print $0}' $tName 2>>./.error.log |  column -t -s '|'
	
        selectMenu
      fi
    else
      echo "Unsupported Operator\n"
      selectMenu
    fi
  fi
}

