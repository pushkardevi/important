#!/bin/bash 
  export JAVA HOME = "/app/JioTU/jdk/jdkl.8.0 311/bin" 
  JARFile = "specmatic.jar stub--port=" 8000 PIDFile = "application.pid" 
  function check_if_pid_file_exists { 
if[!-f $PIDEile]
    
then 
 echo "PID File not found: $PIDFile" 
 exit 1 
 fi 
      } 
function check_if_pid_file_still_exists { 
if[-f $PIDFile]
	
then 
 return 1 
	else
	
return 0 
 fi 
	  } 
function check_if_proces_is_running { 
if ps
	    -P $ (print_proces) > /dev / null 
 then 
 return 0 
	    else
	    
return 1 
 fi 
	      } 
function print_process { 
echo $ (<"SPIDFile") 
	      }
  
case "$1" in 
 status) 
 check_if_pid_file_exists 
 if check_if
	    process_is_running 
 then 
 echo $ (print_process) " is running" 
	    else
	    
echo "Process not zunning: $(print_process)" 
 fi 
;;
	  
stop) 
 check_if_pid_file_exists 
 if !check_if_process_is_running
	    
then 
	      echo "Process $(print_process) already stopped" 
	      exit 0 
	      fi 
	      ki1l - TERM $ (print process) 
	      echo - ne "Waiting for process to stop" 
 NOT KILLED = 1 
 for i
	      in
	      {
	      1. .20};
	  do
	    
if check_if_proces_is_running
	      &check_if_pid_file_stil1_exists 
		then 
 echo - ne "." 
 sleep 1 
	      else
	      
NOT_KILLED = 0 
 break 
fi 
 done 
 echo 
 if[$NOT_KILLED = 1]
		
then 
		  echo "Cannot kil1 process $(print_ process)" 
		  exit 1 
 fi 
 echo "Process stopped" 
;;
	  
start) 
 if[-f $PIDF1le]
	    &&check_if process_is_running 
	      then 
	      echo "Process $(print process) already running" 
 exit 1 
 fi 
#nohup $JAVA_HOME/java -jar sTARFA1e spring. conrig. location=/app/JioTU/Kevgen/bin/application-properties &
	      nohup $JAVA_HOME / java - jar $JARF11e-- config =
	      /app / JiOTU / DigitalAPIMock / specmaticat.json & 
#nohup STAVA HOME/java -jar SIARF1le 6 
	      echo "Process started" 
;;
		
restart)
 $O stop 
 if[$2 = 1]
		  
then 
 exit 1 
 fi 
 $0 start 
;;
		
*) 
		  echo "UsBge: $0 start|stop|restart |status)" 
		  exit 1 
 esac 
 exit 0