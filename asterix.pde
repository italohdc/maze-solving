//==================
//  MAIN ALGORITHM
//==================
// Find the best and/or closest
// way to finish the maze

void asterix ()
{
  print_maze(); //Simulate the robot in a maze
  way_traveled[current_pos_Y][current_pos_X]++; //Increase the value of the current place;
  //Indicates how many times the robot have gone through that square
  
  print("U:", way_place('U'), " D:", way_place('D'), " L:", way_place('L'), " R:", way_place('R')); //log
  
  char direction='#'; int way_value, way_dist=MAZE_X+MAZE_Y; //Temporary variables
  
  //////////COMPARE WAY//////////Analysis the ways the robot haven't gone yet//
  if(way_place('U') != -1) way_value=way_place('U'); else if(way_place('D') != -1) way_value=way_place('D');
  else if(way_place('L') != -1) way_value=way_place('L'); else if(way_place('R') != -1) way_value=way_place('R');
  else way_value=1000;
 
  if(way_value > way_place('U') && way_place('U') != -1) way_value=way_place('U');
  if(way_value > way_place('D') && way_place('D') != -1) way_value=way_place('D');
  if(way_value > way_place('L') && way_place('L') != -1) way_value=way_place('L');
  if(way_value > way_place('R') && way_place('R') != -1) way_value=way_place('R');
  //////////
  
  print("way_value ", way_value); //log
  print("\tU:", available_place('U'), " D:", available_place('D'), " L:", available_place('L'), " R:", available_place('R')); //log
  
  //////////COMPARE DIRECTION//////////Analysis the closest way to the end//
  //
  if(way_place('D') != -1 && available_place('D') < way_dist && way_place('D') == way_value){
    direction = 'D';
    way_dist = available_place('D');
  }
  if(way_place('U') != -1 && available_place('U') < way_dist && way_place('U') == way_value){
    direction = 'U';
    way_dist = available_place('U');
  }
  if(way_place('L') != -1 && available_place('L') < way_dist && way_place('L') == way_value){
    direction = 'L';
    way_dist = available_place('L');
  }
  if(way_place('R') != -1 && available_place('R') < way_dist && way_place('R') == way_value){
    direction = 'R';
    way_dist = available_place('R');
  }
  //////////
  
  println("\tdirection ", direction, "\tway_dist ", way_dist, "\n"); //log
  
  if(start_delete) delete_path(current_pos_X, current_pos_Y); //Delete the square in case it's an endless route
  //This function isn't executed on the first loop
  
  //SWITCH DIRECTION TO GO// (based on the compared directions)
  switch(direction)
  {
    case 'U':
      save_last_dir('U',current_pos_X,current_pos_Y);
      current_pos_Y--;
      break;
    
    case 'D':
      save_last_dir('D',current_pos_X,current_pos_Y);
      current_pos_Y++;
      break;
    
    case 'L':
      save_last_dir('L',current_pos_X,current_pos_Y);
      current_pos_X--;
      break;
    
    case 'R':
      save_last_dir('R',current_pos_X,current_pos_Y);
      current_pos_X++;
      break;
    
    default:
      print("\n It's a trap, Mario! \n\tGAME OVER");
      exit();
      break;
  }
  
  start_delete = true; //Execute "delete_path()" on next loop
}
